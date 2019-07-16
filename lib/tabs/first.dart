import 'dart:io';

import 'package:doc_reader/list.dart';
import 'package:doc_reader/pdf-reader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class FirstTab extends StatefulWidget {
  final String path;

  FirstTab({Key key,this.path}) : super(key: key);

  @override
  _FirstTabState createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  Directory currentDir;
  String currentPath;
  PDFDocument file;

  @override
  void initState() {
    currentPath = widget.path;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.red,
      body: _buildChild(),
    );
  }

  Widget _buildChild() {
    return checkIfFile(currentPath)
        ? _buildPDFWidget()
        : new EntryList(path: currentPath);
  }

  Widget _buildPDFWidget() {
    return new PdfViewPage(path: currentPath+file.toString());
  }

  bool checkIfFile(String path) {
    
    bool isFile = false;
    currentDir.exists().then((isThere) {
      isThere
          ? currentDir
              .list(recursive: false, followLinks: false)
              .listen((FileSystemEntity entity) {
              if (entity is PDFDocument) {
                isFile =true;
                this.file = (entity as PDFDocument);
              }
            })
          : print('non-existent');
    });
    return isFile;
  }
}
