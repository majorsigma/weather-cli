import 'package:cli_weather/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'models/forecast.dart';

Future<Forecast> getWeather({
  required double lat,
  required double lon,
}) async {
  var url = Uri.parse('${BASE_URL}lat=$lat&lon=$lon$API_KEY_QUERY');

  var response = await http.get(url);
  var jsonResponse = json.decode(response.body);
  print("Response: ${response.body}");

  return Forecast.fromJson(jsonResponse);
}
