# Used to resolve warnings caused by `xxxbinding. Instance` in Flutter 3.0

In Flutter 3.0, `instance` cannot be null. I need to make changes everywhere the code is used. I think it's troublesome

So I wrote a dart Command Line that automatically changed instance!

# Usage
Add dependence：
```dart
    dart pub add upgrade_tool
```
Directly run this command :
```dart
    dart run upgrade_tool
```
