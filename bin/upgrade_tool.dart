import 'dart:io';
import 'package:process_run/shell.dart';

void main(List<String> arguments) async {
  Directory currentProject = Directory.current;

  var shell = Shell();

  await shell.run('flutter pub add bindings_compatible').onError((error, stackTrace) => []);

  String libPath = currentProject.path + '/lib';
  handlePath(libPath);
}

Future<void> handlePath(String path) async {
  if (await FileSystemEntity.isFile(path)) await handleCodeFile(path);

  if (await FileSystemEntity.isDirectory(path)) {
    Directory dir = Directory(path);
    if (await dir.exists()) {
      var list = dir.listSync();
      for (var element in list) {
        await handlePath(element.path);
      }
    }
  }
}

Future<void> handleCodeFile(String path) async {
  print(path);
  if (path.contains('.dart')) {
    File file = File(path);
    bool hasMatched = false;
    List<String> codes = await file.readAsLines();
    for (int i = 0; i < codes.length; i++) {
      codes[i] = codes[i].replaceAllMapped(regExp, (match) {
        hasMatched = true;
        String? binding;
        try {
          binding = 'use${match[0]?.split('.')[0]}()'.replaceAll(' ', '');
        } catch (e) {
          print(e);
          binding = match.input;
        }
        return binding;
      });
    }
    if (hasMatched) {
      codes.insert(
          1, 'import \'package:bindings_compatible/bindings_compatible.dart\';');
      file.writeAsString(join(codes, '\n'));
    }
  }
}

String join(List<String> sources, String separator) {
  if (sources.isEmpty) return "";
  StringBuffer buffer = StringBuffer();
  for (int i = 0; i < sources.length; i++) {
    buffer.write(sources[i]);
    if (i != sources.length) buffer.write(separator);
  }
  return buffer.toString();
}

String pattern =
    r'\W(Scheduler|Widgets|Gesture|Renderer|Services|Painting|Semantics)Binding.instance\!';
RegExp regExp = RegExp(pattern);
