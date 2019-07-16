import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'tabs/first.dart';
import 'tabs/second.dart';
import 'tabs/third.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  final tutorialsUrl = "https://www.tutorialspoint.com/sql/sql_tutorial.pdf";
  final integrationUrl =
      "http://www.inf.ed.ac.uk/teaching/courses/st/2011-12/Resource-folder/10_integration.pdf";
  final samplesUrl = "https://nofuss.co.za/talks/flutter_talk_26_nov_2018.pdf";
  String currentPath;

  @override
  void initState() {
    createResources();
    getRootDirectory().then((String value){

    });

    super.initState();
    // Initialize the Tab Controller
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Main Menu"),
        backgroundColor: Colors.lightBlue,
      ),
      body: new TabBarView(
        children: <Widget>[
          new FirstTab(path: currentPath),
          new SecondTab(),
          new ThirdTab()
        ],
        controller: controller,
      ),
      bottomNavigationBar: new Material(
        color: Colors.lightBlue,
        child: new TabBar(
          tabs: <Tab>[
            new Tab(
              icon: new Icon(Icons.favorite),
            ),
            new Tab(
              icon: new Icon(Icons.ac_unit),
            ),
            new Tab(
              icon: new Icon(Icons.airport_shuttle),
            ),
          ],
          controller: controller,
        ),
      ),
    );
  }

  Future<String> getRootDirectory() async {
    final dir = await getApplicationDocumentsDirectory();
    print(dir.path);
    var rootPath;
    dir.exists().then((isThere) {
      isThere
          ? dir
              .list(recursive: false, followLinks: false)
              .listen((FileSystemEntity entity) {
              if (entity is Directory) {
                rootPath = entity.path;
                print(entity.path);
              }
            })
          : print('non-existent');
    });
    return rootPath;
  }

  Future<void> createResources() async {
    Dio dio = Dio();

    try {
      var dir = await getApplicationDocumentsDirectory();

      new Directory('${dir.path}/test/integration')
          .create(recursive: true)
          .then((Directory directory) {
        print(directory.path);
      });

      new Directory('${dir.path}/test/samples')
          .create(recursive: true)
          .then((Directory directory) {
        print(directory.path);
      });

      new Directory('${dir.path}/test/tutorials')
          .create(recursive: true)
          .then((Directory directory) {
        print(directory.path);
      });

      await dio.download(
          tutorialsUrl, "${dir.path}/test/tutorials/tutorials.pdf");
      await dio.download(
          integrationUrl, "${dir.path}/test/integration/tutorials.pdf");
      await dio.download(samplesUrl, "${dir.path}/test/samples/tutorials.pdf");
      
    } catch (e) {}
  }
}
