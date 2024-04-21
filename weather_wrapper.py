from flask import Flask, request, jsonify
import os
import requests

app = Flask(__name__)

@app.route('/weather', methods=['GET'])
def get_weather():
    latitude = float(request.args.get('lat'))
    longitude = float(request.args.get('lon'))
    api_key = os.environ.get('API_KEY')
    url = f'http://api.openweathermap.org/data/2.5/weather?lat={latitude}&lon={longitude}&appid={api_key}'
    response = requests.get(url)
    if response.status_code == 200:
        data = response.json()
        return jsonify(data)
    else:
        return jsonify({"error": "Failed to fetch weather data. Check your API key or coordinates."}), 500

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=80)

