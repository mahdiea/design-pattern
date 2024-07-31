import 'dart:io';

// Component
abstract class FileSystemComponent {
  String getName();
  void display(String indent);
  Future<void> create(String path);
}

// Leaf
class File extends FileSystemComponent {
  String _name;

  File(this._name);

  @override
  String getName() => _name;

  @override
  void display(String indent) {
    print('$indent- File: $_name');
  }

  @override
  Future<void> create(String path) async {
    var myDir = Directorys('./myDir');
    final file = File('$path/$_name');
    await file.create( path);
    print('Created file: ${ path}');
  }
}

// Composite
class Directorys extends FileSystemComponent {
  String _name;
  List<FileSystemComponent> _children = [];

  Directorys(this._name);

  void add(FileSystemComponent component) {
    _children.add(component);
  }

  void remove(FileSystemComponent component) {
    _children.remove(component);
  }

  @override
  String getName() => _name;

  @override
  void display(String indent) {
    print('$indent+ Directory: $_name');
    for (var child in _children) {
      child.display('$indent  ');
    }
  }

  @override
  Future<void> create(String path) async {
    final dir = Directory('$path/$_name');
    // await dir.create( path);
    print('Created directory: ${ path}');
    for (var child in _children) {
      await child.create(path);
    }
  }
}

void main() async { 
  File file1 = File('file1.txt');
  File file2 = File('file2.txt');
  File file3 = File('file3.txt');

  Directorys dir1 = Directorys('dir1');
  Directorys dir2 = Directorys('dir2');

  dir1.add(file1);
  dir1.add(file2);
  dir2.add(file3);
  dir2.add(dir1);

  dir2.display('');

  await dir2.create('.');
}
