library example;

import 'dart:io';
import 'package:args/args.dart';

void main(List<String> args) {
  var parser = ArgParser();

  parser.addSeparator('===== Platform');

  parser.addOption('compiler',
      abbr: 'c',
      help: 'Specify any compilation step (if needed).',
      allowed: [
        'none',
        'dart2js',
        'dartc',
      ],
      allowedHelp: {
        'none': 'Do not compile the Dart code (run native Dart code on the VM).'
            '(only valid with the following runtimes: vm, drt)',
        'dart2js': 'Compile dart code to Javascript by running dart2js.\n'
            'safari, ie, firefox, opera, none (compile only))',
        'dartc': 'Perform static analysis on Dart code by running dartc.\n'
            '(only valid with the following runtimes: none)',
      });

  parser.addOption('runtime',
      abbr: 'r',
      defaultsTo: 'vm',
      help: 'Where the test should be run.',
      allowed: [
        'vm',
        'd8',
        'dartium',
        'ff',
        'firefox',
        'chrome',
        'safari',
        'ie',
        'opera',
        'none',
      ],
      allowedHelp: {
        'vm': 'Run Dart code on the standalone dart vm.',
        'd8': 'Run Javascript from the command line using v8.',
        'drt': 'Run Dart or Javascript in the headless version content shell.',
        'dartium': 'Run Dart or Javascript in Dartium.',
        'ff': 'Run Javascript in Firefox',
        'chrome': "Run Javascript in Chrome",
        'safari': "Run Javascript in Safari",
        'opera': "Run Javascript in Opera",
        'none': "No runtime, compile only (for example, used for dartc static\n"
            "analysis test)."
      });

  parser.addOption('arch',
      abbr: 'a',
      defaultsTo: 'ia32',
      help: 'The architecture to run tests for',
      allowed: ['all', 'ia32', 'x64', 'simarm']);

  parser.addOption('system',
      abbr: 's',
      defaultsTo: Platform.operatingSystem,
      help: 'The operating system to run tests on',
      allowed: ['linux', 'macos', 'windows']);

  parser.addSeparator('===== Runtime');

  parser.addOption('mode',
      abbr: 'm',
      defaultsTo: 'debug',
      help: 'Mode in which to run the tests',
      allowed: [
        'all',
        'debug',
        'release',
      ]);

  parser.addFlag(
    'checked',
    defaultsTo: false,
    help: 'Run tests in checked mode',
  );

  parser.addFlag(
    'host-checked',
    defaultsTo: false,
    help: 'Run compiler in checked mode',
  );

  parser.addOption(
    'timeout',
    abbr: 't',
    help: 'Timeout in seconds',
  );

  parser.addOption(
    'tasks',
    abbr: 'j',
    defaultsTo: Platform.numberOfProcessors.toString(),
    help: "The number of parallel task to run",
  );

  parser.addOption(
    'shards',
    defaultsTo: '1',
    help: 'The number of instances that the test will be shareded over',
  );

  parser.addOption(
    'shard',
    defaultsTo: '1',
    help: 'The index of this instance when running in sharded mode',
  );

  parser.addFlag(
    'valgrind',
    defaultsTo: false,
    help: 'Run tests through valgrind',
  );

  parser.addSeparator('===== Output');

  parser.addOption(
    'progress',
    abbr: 'p',
    defaultsTo: 'compact',
    help: 'Progress indication mode',
    allowed: [
      'compact',
      'collor',
      'line',
      'verbose',
      'silent',
      'status',
      'buildbot',
    ],
  );

  parser.addFlag(
    'report',
    defaultsTo: false,
    help: 'Print a summary report of the number of test, by expectation',
  );

  parser.addFlag(
    'verbose',
    abbr: 'v',
    defaultsTo: false,
    help: 'Verbose outputs',
  );

  parser.addFlag(
    'list',
    defaultsTo: false,
    help: 'List tests only, do not run them',
  );

  parser.addFlag(
    'time',
    help: 'Print timing information after running tests',
    defaultsTo: false,
  );

  parser.addFlag(
    'batch',
    abbr: 'b',
    help: 'Run browser tests in batch mode',
    defaultsTo: true,
  );

  parser.addSeparator('===== Miscellaneous');

  parser.addFlag(
    'keep-generated-tests',
    defaultsTo: false,
    help: 'Keep the generated files in the temporary directory',
  );

  parser.addOption('special-command', help: """
Special command support. Wraps the command line in
a special command. The special command should contain
an '@' character which will be replaced by the normal
command.

For example if the normal command that will be executed
is 'dart file.dart' and you specify special command
'python -u valgrind.py @ suffix' the final command will be
'python -u valgrind.py dart file.dart suffix'""");

  parser.addOption('dart', help: 'Path to dart executable');
  parser.addOption('drt', help: 'Path to content shell executable');
  parser.addOption('dartium', help: 'Path to Dartium Chrome executable');
  parser.addOption('mandatory', help: 'A mandatory option', mandatory: true);

  print(parser.usage);
}
