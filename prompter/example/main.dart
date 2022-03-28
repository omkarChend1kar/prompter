import 'package:prompter_oc/src/terminal.dart';
import 'dart:io';

void main() {
  var terminal = Terminal();
  terminal.clearScreen();
  terminal.printPrompt("Hello World");
  var printInput = terminal.collectInput();
  stdout.writeln('You just Entered : ${printInput}');
  
}
