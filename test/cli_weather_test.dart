import 'package:cli_weather/models/forecast.dart';
import 'package:test/test.dart';
import "package:cli_weather/repository.dart";

void main() {
  test('calculate', () async {
    final Forecast forecast = await getWeather(lat: 10, lon: 10);
    expectLater(forecast, forecast);
  });
}
