// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:saa/models/weather_forecast_daily.dart';
import 'package:saa/utilities/contacts.dart';
import 'package:saa/utilities/location.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast(
      {String? cityName, bool? isCity}) async {
    Location location = Location();
    await location.getCurrentLocation();

    Map<String, String?> parameters;

    if (isCity == true) {
      var queryParameters = {
        'APPID': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'q': cityName,
      };

      parameters = queryParameters;
    } else {
      var queryParameters = {
        'APPID': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
      };

      parameters = queryParameters;
    }

    var uri = Uri.https(
      Constants.WEATHER_BASE_URL_DOMAIN,
      Constants.WEATHER_FORECAST_PATH,
      parameters,
    );

    log('request: ${uri.toString()}');

    var response = await http.get(uri);

    print('response: ${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      throw Future.error('Erorr response');
    }
  }
}