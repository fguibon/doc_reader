import 'dart:io';

import 'package:flutter/material.dart';
import 'package:doc_reader/pdf-reader.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class SecondTab extends StatefulWidget {
  @override
  _SecondTabState createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {
  String assetPDFPath = "";

  @override
  void initState() {
    super.initState();

    getFileFromAsset("assets/mypdf.pdf").then((f) {
      setState(() {
        assetPDFPath = f.path;
        print(assetPDFPath);
      });
    });
  }

  Future<File> getFileFromAsset(String asset) async {
    try {
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/mypdf.pdf");

      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e) {
      throw Exception("Error opening asset file");
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.green,
      body: new Container(
        child: new Center(
          child: new Column(
            // center the children
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                color: Colors.cyan,
                child: Text("Open from Asset"),
                onPressed: () {
                  if (assetPDFPath != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PdfViewPage(path: assetPDFPath)));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
