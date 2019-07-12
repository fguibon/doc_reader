import 'dart:io';

import 'package:doc_reader/folder.dart';
import 'package:flutter/material.dart';

import 'detail.dart';

class EntryList extends StatefulWidget {
  @override
  _EntryListState createState() => _EntryListState();
}

class _EntryListState extends State<EntryList> {
  final Directory currentDir =
      new Directory('/home/flora/Documents/repositories/Flutter/test');

  @override
  Widget build(BuildContext context) {
    final folders = fetchFolders();

    return Scaffold(
        body: new ListView.builder(
      itemCount: folders.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(folders[index].title),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(folder: folders[index]),
              ),
            );
          },
        );
      },
    ));
  }

  List<Folder> fetchFolders() {
    List<Folder> folderList = List<Folder>.generate(
      20,
      (i) => Folder(
        'Folder $i',
      ),
    );

    (currentDir.exists() == true) ? print('exists') : print('non-existent');

    return folderList;
  }
}
