import 'package:doc_reader/settings_page.dart';
import 'package:flutter/material.dart';

import 'tabs/contact.dart';
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

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = new TabController(length: 4, vsync: this);
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
      // Appbar
      appBar: new AppBar(
        // Title
        title: new Text("Main Menu"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.settings_applications),
            onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
                          );
                          }
                        ),
                      ],
                      // Set the background color of the App Bar
                      backgroundColor: Colors.lightBlue,
                    ),
                    // Set the TabBar view as the body of the Scaffold
                    body: new TabBarView(
                      // Add tabs as widgets
                      children: <Widget>[
                        new FirstTab(),
                        new SecondTab(),
                        new ThirdTab(),
                        new Contact()
                      ],
                      // set the controller
                      controller: controller,
                    ),
                    // Set the bottom navigation bar
                    bottomNavigationBar: new Material(
                      // set the color of the bottom navigation bar
                      color: Colors.lightBlue,
                      // set the tab bar as the child of bottom navigation bar
                      child: new TabBar(
                        tabs: <Tab>[
                          new Tab(
                            // set icon to the tab
                            icon: new Icon(Icons.favorite),
                          ),
                          new Tab(
                            icon: new Icon(Icons.ac_unit),
                          ),
                          new Tab(
                            icon: new Icon(Icons.airport_shuttle),
                          ),
                          new Tab(
                            icon: new Icon(Icons.contact_phone),
                          ),
                        ],
                        // setup the controller
                        controller: controller,
                      ),
                    ),
                  );
                }
              }
              
              