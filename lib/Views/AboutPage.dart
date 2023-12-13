import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Text(
                "This is an app that will allow you to make API calls to retrieve information about teams in the NBA",
              ),
            ),
            Text(
              "Developed by Zach Dallum for CMSC 2204",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
