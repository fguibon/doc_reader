
import 'package:flutter/material.dart';
import 'package:doc_reader/pdf-reader.dart';

class SecondTab extends StatefulWidget {
  @override
  _SecondTabState createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {
  String assetPDFPath = 'assets/test/tutorials/tutorials.pdf';

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
