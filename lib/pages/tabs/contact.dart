import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String data =
        "Customer contact page including; logo, contact details, Link to call/email/website.";
    return new Scaffold(
      body: new Text(data),

    );
  }
}
