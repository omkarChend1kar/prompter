import 'dart:io';
import 'package:converter/src/converter.dart';
import 'package:prompter_oc/prompter_oc.dart';

void main() {
  //User should get prompted with whether he wants to convert the image if not immediatly exited out
  final prompter = Prompter();
  final choice = prompter.askBinary('Do you want to convert the image ?');
  //Using exit() instead of return;
  if (!choice) {
    exit(0);
  }
  final String format = prompter.askMultiple(
      'Choose your desired format of your image to be converted into :',
      buildFormatOptions());
  final chooseImage =
      prompter.askMultiple('Select an Image to convert : ', buildFileOptions());
  final openImage = prompter.askBinary('Open the image ?');
  final newPath = convertImage(chooseImage, format);
  print(newPath);
  if (openImage) {
    Process.run('', [newPath]);
  } else {
    exit(0);
  }
  // print(format);
  // buildFileOptions();
}

List<Option> buildFormatOptions() {
  return [
    new Option('Convert to JPG', 'jpg'),
    new Option('Convert to PNG', 'png'),
    // new Option('Convert to JPEG', 'jpeg'),
  ];
}

List<Option> buildFileOptions() {
  //To get the current directory
  final currentDirectory = Directory.current;
  //To get list of files in current directory
  final listOfFiles = currentDirectory.listSync();
  //To segregate the files in current working directory into img files
  final listofImgfilesOnly = listOfFiles.where((entity) {
    //To check whether the it is file or folder and whether it is image and also return its list
    return FileSystemEntity.isFileSync(entity.path) &&
        entity.path.contains(new RegExp(r'\.(jpg|png|jpeg)'));
  });
  //To extract the names of the images in current directory and display to the prompter
  final fileNamesforTerminal = listofImgfilesOnly.map((entity) {
    return new Option(entity.path.split(Platform.pathSeparator).last, entity);
  }).toList();
  return fileNamesforTerminal;
  // print(currentDirectory);
  // print(listOfFiles);
  // print(listofImgfilesOnly);
  // print(fileNamesforTerminal);
}
