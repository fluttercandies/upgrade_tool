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

All the positions are automatically changed

![image](https://user-images.githubusercontent.com/40540394/168479984-0cb3094d-d220-47c6-91b3-307bdd3158b7.png)
