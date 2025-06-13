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
    df = pd.read_csv("Agmarknet_Price_potato.csv")
    print("Loaded", len(df), "rows")
    df = df[(df["crop"] == crop) & (df["city"] == city)]
    print("Filtered to", len(df), "rows for", crop, city)
    return df



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


@app.route('/predict', methods=['GET'])
def predict_price():
    crop = request.args.get('crop')
    city = request.args.get('city')
    date = request.args.get('date')
    model = request.args.get('model', 'rf')

    if not crop or not city or not date:
        return jsonify({"error": "Missing input"}), 400

    df = get_data(crop, city)
    if df.empty:
        return jsonify({"error": "No data found"}), 404

    # Prediction logic here (example for RF):
    forecast = predict_rf(df)
    return jsonify({"forecast": forecast})
import os
if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(debug=True, host="0.0.0.0", port=port)


