import 'dart:io';

void main(List<String> arguments) async {
  Directory currentProject = Directory.current;

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
        return match[0]?.replaceAll('!', '') ?? match.input;
      });
    }
    if (hasMatched) {
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
