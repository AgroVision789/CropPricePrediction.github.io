from flask import Flask, request, jsonify
import pandas as pd
from sklearn.ensemble import RandomForestRegressor
import numpy as np
from datetime import datetime
import os
import warnings

warnings.filterwarnings("ignore")

app = Flask(__name__)

# === Load Data from CSV ===
def get_data(crop, city):
    df = pd.read_csv("Agmarknet_Price_potato_maharastra_24_jan_to_feb_25.csv")  # or dynamically select file if multiple
    print("Loaded", len(df), "rows")
    df = df[(df["crop"] == crop) & (df["city"] == city)]
    print("Filtered to", len(df), "rows for", crop, city)
    return df

# === Random Forest with date-aware adjustment ===
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

        # Simulate price trend: add 0.8₹/day drift to training prices
        df['modal_price'] += (df['days'] * 0.8)

        X = df[['days']]
        y = df['modal_price']

        model = RandomForestRegressor(n_estimators=100)
        model.fit(X, y)

        predicted_price = model.predict([[future_day]])[0]

        # Re-adjust to remove trend drift added during training
        predicted_price -= (future_day * 0.8)

        return [round(predicted_price, 2)]
    except Exception as e:
        print("RF Error:", e)
        return [-1]

# === Prediction Route ===
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

    forecast = predict_rf(df, date)  # ✅ FIXED ARGUMENT
    return jsonify({"forecast": forecast})

# === Run Flask App (Render Compatible) ===
if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(debug=True, host="0.0.0.0", port=port)
