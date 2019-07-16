import 'package:doc_reader/models/theme.dart';
import 'package:doc_reader/pages/settings_page.dart';
import 'package:doc_reader/pages/tabs/contact_page.dart';
import 'package:doc_reader/pages/tabs/emergency_page.dart';
import 'package:doc_reader/pages/tabs/home_page.dart';
import 'package:doc_reader/pages/tabs/information_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeContainer extends StatefulWidget {
  @override
  _HomeContainerState createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer>
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
        final theme = Provider.of<ThemeChanger>(context);

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
              }),
        ],
      ),
      // Set the TabBar view as the body of the Scaffold
      body: new TabBarView(
        
        // Add tabs as widgets
        children: <Widget>[
          new HomePage(),
          new InformationPage(),
          new EmergencyPage(),
          new ContactPage()
        ],
        // set the controller
        controller: controller,
      ),
      // Set the bottom navigation bar
      bottomNavigationBar: new Material(
        color: theme.getPrimaryColor(),
        // set the tab bar as the child of bottom navigation bar
        child: new TabBar(
          tabs: <Tab>[
            new Tab(
              // set icon to the tab
              icon: new Icon(Icons.home),
            ),
            new Tab(
              icon: new Icon(Icons.info),
            ),
            new Tab(
              icon: new Icon(Icons.warning),
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
