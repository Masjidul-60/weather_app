import 'package:myapp/models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherServices {
  final String apiKey = 'c1a450a9bc90cfa94a75eb191f9d0c6d';

  Future<Weather> featchWeather(String cityName) async {
  final url = Uri.parse(
    'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey',
  );

  final response = await http.get(url);

print('Status Code: ${response.statusCode}');
print('Response Body: ${response.body}');

if (response.statusCode == 200) {
  return Weather.fromJson(json.decode(response.body));
} else {
  throw Exception('Failed to load weather data');
}
}
}
