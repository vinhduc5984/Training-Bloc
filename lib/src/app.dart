import 'package:flutter/material.dart';
import 'package:login_screen_bloc/src/screens/login_screen.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}
