import 'dart:io';

void main(List<String> arguments) async {
  Directory currentProject = Directory.current;

  String libPath = currentProject.path + '/lib';

  print('Hello world!');
}

void handlePath(String path) async {
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
  return;
  // 如果是文件夹，递归处理所有的子集目录
}

void handleCodeFile(String path) async {
  



}
