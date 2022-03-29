import 'dart:io';
import 'package:prompter_oc/src/option.dart';

class Terminal {
  const Terminal();
  void printPrompt(String prompt) {
    stdout.writeln(prompt);
  }

  void clearScreen() {
    if (Platform.isWindows) {
      stdout.write('\x1B[2J\x1B[0f');
    } else {
      stdout.write('\x1B[2J\x1B[3J\x1B[H');
    }
  }

  void printOptions(options) {
    options.asMap().forEach((index, value) {
      stdout.writeln('($index): ${value.label}');
    });
    stdout.writeln('Enter a choice : ');
    stdout.write('> ');
  }

  String collectInput() {
    return stdin.readLineSync();
  }
}
