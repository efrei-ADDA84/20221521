import os
import requests

def get_weather(latitude, longitude):
    api_key = os.environ.get('API_KEY')
    url = f'http://api.openweathermap.org/data/2.5/weather?lat={latitude}&lon={longitude}&appid={api_key}'
    response = requests.get(url)
    if response.status_code == 200:
        data = response.json()
        return data
    else:
        return None

if __name__ == "__main__":
    latitude = float(os.environ.get('LAT'))
    longitude = float(os.environ.get('LONG'))
    weather_data = get_weather(latitude, longitude)
    if weather_data:
        print(weather_data)
    else:
        print("Failed to fetch weather data. Check your API key or coordinates.")