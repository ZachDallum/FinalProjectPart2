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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "This is an app that will allow you to make api calls to retrieve information about players in the NBA"),
            SizedBox(height: 16.0),
            Text("Developed by Zach Dallum for CMSC 2204."),
          ],
        ),
      ),
    );
  }
}
