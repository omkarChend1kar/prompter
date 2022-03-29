import 'dart:io';
import 'package:prompter_oc/prompter_oc.dart';

void main() {
  // var terminal = Terminal();
  // terminal.clearScreen();
  // terminal.printPrompt("Hello World");
  // var printInput = terminal.collectInput();
  // stdout.writeln('You just Entered : ${printInput}');
  final option = [
    new Option('Red', '#f00'),
    new Option('Green', '#f01'),
    new Option('Blue', '#f02'),
    new Option('Black', '#000'),
  ];

  final prompter = new Prompter();
  // stdout.writeln(prompter.askBinary('Do you want to learn Flutter ?'));
  stdout
      .writeln(prompter.askMultiple('What is your favourite color ?', option));
  // terminal.printOptions(option);
  // terminal.collectInput();
}
