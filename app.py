from flask import Flask, request, jsonify
import mysql.connector
import pandas as pd
from sklearn.ensemble import RandomForestRegressor
import numpy as np
from datetime import datetime
import warnings

warnings.filterwarnings("ignore")

app = Flask(__name__)

# === Database Configuration ===
MYSQL_HOST = "localhost"
MYSQL_USER = "root"
MYSQL_PASSWORD = ""
MYSQL_DB = "croppriceprediction"

def get_data(crop, city):
    try:
        conn = mysql.connector.connect(
            host="localhost",
            user="root",
            password="",
            database="croppriceprediction"
        )
        query = """
            SELECT arrival_date, modal_price 
            FROM price_dataset 
            WHERE LOWER(crop) = LOWER(%s) AND LOWER(city) = LOWER(%s)
        """
        df = pd.read_sql(query, conn, params=(crop, city))
        conn.close()

        df['arrival_date'] = pd.to_datetime(df['arrival_date'], errors='coerce', dayfirst=True)
        df['modal_price'] = pd.to_numeric(df['modal_price'], errors='coerce')
        df = df.dropna()
        return df.sort_values("arrival_date")
    except Exception as e:
        print("DB Error:", e)
        return pd.DataFrame()


def predict_rf(df, future_date_str):
    try:
        df['arrival_date'] = pd.to_datetime(df['arrival_date'], dayfirst=True, errors='coerce')
        df['modal_price'] = pd.to_numeric(df['modal_price'], errors='coerce')
        df = df.dropna()
        df = df.sort_values("arrival_date")

        # Feature: days since start
        df['days'] = (df['arrival_date'] - df['arrival_date'].min()).dt.days

        # Target day (future date)
        future_date = pd.to_datetime(future_date_str)
        future_day = (future_date - df['arrival_date'].min()).days

        # Add a trend line to price (simulate price drift over time)
        df['modal_price'] += (df['days'] * 0.8)  # 0.8 ₹/day drift

        X = df[['days']]
        y = df['modal_price']

        model = RandomForestRegressor(n_estimators=100)
        model.fit(X, y)

        predicted_price = model.predict([[future_day]])[0]

        # Re-adjust to remove added drift from prediction
        predicted_price -= (future_day * 0.8)

        return [round(predicted_price, 2)]
    except Exception as e:
        print("RF Error:", e)
        return [-1]


@app.route("/predict", methods=["GET"])
def predict_price():
    crop = request.args.get("crop")
    city = request.args.get("city")
    date = request.args.get("date")
    model = request.args.get("model", "rf")

    if not crop or not city or not date:
        return jsonify({"error": "Missing parameters"}), 400

    df = get_data(crop, city)
    if df.empty:
        return jsonify({"error": "No data found"}), 404

    forecast = predict_rf(df, date)

    if forecast[0] == -1:
        return jsonify({"error": "Prediction failed"}), 500

    return jsonify({"forecast": forecast})

if __name__ == "__main__":
    app.run(debug=True)
