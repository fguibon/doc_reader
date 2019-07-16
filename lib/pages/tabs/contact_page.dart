import 'package:doc_reader/models/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeChanger theme = Provider.of<ThemeChanger>(context);

    String data =
        "Customer contact page including; logo, contact details, Link to call/email/website.";
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(data),
            ListTile(
              leading: Image.network(theme.logo),
              title: Text(theme.companyName),
              subtitle: Text(theme.phoneNumber),
            ),
          ],
        ),
      ),
    );
  }
}
