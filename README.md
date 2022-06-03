# Used to resolve warnings caused by `xxxbinding. Instance` in Flutter 3.0

Resolved the warning of 'xxxbinding. Instance' in 3.0, compatible with previous versions


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

<img width="1433" alt="image" src="https://user-images.githubusercontent.com/40540394/171787141-4f54cc63-5c83-4846-8284-80b1b8d50456.png">

#### Note that original dependencies are not removed by default,If you need to remove it, you can add the -remove argument, may cause your dependency error

#### After the migration, you can remove the upgrade_tool dependency
