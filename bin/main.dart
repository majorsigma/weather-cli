import 'dart:io';
import 'package:args/args.dart';
import 'package:cli_weather/view/dart_weather.dart';

main(List<String> arguments) {
  exitCode = 0;
  final parser = ArgParser()
    ..addOption('latitude', abbr: 't', defaultsTo: "12.32")
    ..addOption('longitude', abbr: 'n', defaultsTo: '9.232');

  final argResults = parser.parse(arguments);

  final latitude = double.parse(argResults['latitude']);
  final longitude = double.parse(argResults['longitude']);

  weatherCli(latitude, longitude);
}
