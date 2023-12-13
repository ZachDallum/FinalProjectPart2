import 'package:finalproject/Repositories/DataService.dart';
import 'package:finalproject/Views/TeamList.dart';
import 'package:flutter/material.dart';
import 'Views/AboutPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Dallum Final Project'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

bool _loading = false;

class _MyHomePageState extends State<MyHomePage> {
  var apiVersion = "1.0.1";

  var usernameController = new TextEditingController();
  var passwordController = new TextEditingController();

  final DataService _dataService = DataService();

  void onLoginButtonPress() async {
    final enteredUsername = usernameController.text;
    final enteredPassword = passwordController.text;

    final storedCredentials = await _dataService.getCredentials();
    final storedUsername = storedCredentials['username'];
    final storedPassword = storedCredentials['password'];

    if (enteredUsername != storedUsername) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('username does not exist'),
          duration: Duration(seconds: 3),
        ),
      );
    } else if (enteredUsername == storedUsername &&
        enteredPassword != storedPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('password is incorrect'),
          duration: Duration(seconds: 3),
        ),
      );
    } else {
      openTeamList();
    }
  }

  void openTeamList() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TeamList()),
    );
  }

  void openAboutPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AboutPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Please Sign In"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: usernameController,
                        decoration: InputDecoration(hintText: "Username"),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(hintText: "Password"),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: onLoginButtonPress,
                          child: Text("Sign In"),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            _loading
                ? Column(
                    children: [
                      CircularProgressIndicator(),
                      Text("Loading"),
                    ],
                  )
                : SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: openAboutPage,
                      child: Text('About'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text("Version ${apiVersion}")],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
