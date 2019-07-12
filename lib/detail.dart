import 'package:flutter/material.dart';

import 'folder.dart';

class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo.
  final Folder folder;

  // In the constructor, require a Todo.
  DetailScreen({Key key, @required this.folder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(folder.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('Media'),
      ),
    );
  }
}