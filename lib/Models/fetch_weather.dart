import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Weather> fetchWeather() async {
  dynamic _apiKey = "8ddb082634bc41c2b795a95a2b95983d";
  final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?zip=10370,lk&units=metric&appid=$_apiKey'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Weather.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    // ScaffoldMessenger.of(context).showSnackBar(
    //     customSnackBar("No internet Connection", Icons.close, primaryColor));
    throw Exception('Failed to load Weather');
  }
}

class WeatherMain {
  final double temp;

  WeatherMain({required this.temp});

  factory WeatherMain.fromJson(Map<String, dynamic> json) {
    return WeatherMain(
      temp: json['temp'],
    );
  }
}

class Weather {
  final String name;
  final WeatherMain main;
  final List weather;

  Weather({
    required this.weather,
    required this.name,
    required this.main,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      name: json['name'],
      main: WeatherMain.fromJson(
        json['main'],
      ),
      weather: json['weather'],
    );
  }
}
