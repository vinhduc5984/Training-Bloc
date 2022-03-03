import 'package:flutter/material.dart';
import 'package:login_screen_bloc/src/common/share_prefernce_user.dart';
import 'package:login_screen_bloc/src/screens/home/home_screen.dart';
import 'package:login_screen_bloc/src/screens/login_screen.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return UserSharedPreference.getAccessToken() != null
        ? HomeScreen()
        : LoginScreen();
  }
}
