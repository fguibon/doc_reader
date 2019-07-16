import 'dart:io';

import 'package:doc_reader/tabs/first.dart';
import 'package:flutter/material.dart';

class EntryList extends StatefulWidget {
  final String path;

  EntryList({Key key, this.path}) : super(key: key);

  @override
  _EntryListState createState() => _EntryListState();
}

class _EntryListState extends State<EntryList> {
  String currentPath;
  List<String> folders;

  @override
  void initState() {
    super.initState();

    currentPath = widget.path;
    folders = fetchFolders();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new ListView.builder(
      itemCount: folders.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(folders[index].toString()),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => buildParent(index),
              ),
            );
          },
        );
      },
    ));
  }

  FirstTab buildParent(index) {
    var newPath = currentPath + folders[index].toString();
    currentPath = newPath;
    return new FirstTab(path: currentPath);
  }

  List<String> fetchFolders() {
    List<String> entities = new List();
    Directory currentDir = new Directory(currentPath);
    currentDir
        .list(recursive: true, followLinks: false)
        .listen((FileSystemEntity entity) {
      entities.add(entity.toString());
    });
    return entities;
  }
}
