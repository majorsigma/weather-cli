import 'dart:io';
import 'package:cli_weather/repository.dart';
import 'package:cli_weather/utils/runes.dart';

Future weatherCli(double lat, double lon) async {
  try {
    final apiResult = await getWeather(lat: lat, lon: lon);
    stdout.writeln('');
    stdout.writeln(
      'Weather in ${apiResult.name} ${String.fromCharCodes(rainBow)}',
    );
    stdout.writeln('---------------------------------------');

    final date =
        DateTime.fromMillisecondsSinceEpoch(apiResult.dt.toInt() * 1000);
    final dateTimeString = '${date.day}.${date.month}.${date.year} :';
    final tempString =
        'Now: ${apiResult.main.temp} °C, Min: ${apiResult.main.tempMin} °C, Max: ${apiResult.main.tempMax} °C';

    stdout.writeln(dateTimeString);
    stdout.writeln(tempString);
    stdout.writeln('');
  } catch (e) {
    stderr.writeln('error: networking error');
    stderr.writeln(e.toString());
  }
}
