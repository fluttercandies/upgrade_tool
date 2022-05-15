import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) async {
  Directory currentProject = Directory.current;

  String libPath = currentProject.path + '/lib';
  handlePath(libPath);
}

void handlePath(String path) async {
  print(path);

  /// 如果是文件，则进行处理
  if (await FileSystemEntity.isFile(path)) handleCodeFile(path);

  if (await FileSystemEntity.isDirectory(path)) {
    Directory dir = Directory(path);
    if (await dir.exists()) {
      // 从目录的list方法获取FileSystemEntity对象
      var list = dir.listSync();
      for (var element in list) {
        handlePath(element.path);
      }
    }
  }
  // 如果是文件夹，递归处理所有的子集目录
}

void handleCodeFile(String path) async {
  if (path.contains('.dart')) {
    File file = File(path);
    List<String> codes = await file.readAsLines();
    for (int i = 0; i < codes.length; i++) {
      // codes[i].replaceAllMapped("", (match) => "instance");
      print(codes[i].allMatches(match.toString()));
    }
  }
}

String match =
    'SchedulerBinding.instance\!|WidgetsBinding.instance\!|GestureBinding.instance\!|RendererBinding.instance\!|ServicesBinding.instance\!| PaintingBinding.instance\!|SemanticsBinding.instance\!';
