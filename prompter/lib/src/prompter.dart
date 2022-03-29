import 'package:prompter_oc/src/terminal.dart';
import 'package:prompter_oc/src/option.dart';

Terminal _terminal = const Terminal();

class Prompter {
  String _ask(prompt, options) {
    _terminal.clearScreen();
    _terminal.printPrompt(prompt);
    _terminal.printOptions(options);
    return _terminal.collectInput();
  }

  bool askBinary(prompt) {
    final input = _ask('${prompt} [y/n] : ', []);

    return input.contains('y');
  }

  askMultiple(prompt, List<Option> options) {
    final input = _ask(prompt, options);

    try {
      return options[int.parse(input)].value;
    } catch (error) {
      askMultiple(prompt, options);
    }
  }
}
