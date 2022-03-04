import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_screen_bloc/src/bloc/contract_bloc.dart/contract_bloc.dart';
import 'package:login_screen_bloc/src/common/share_prefernce_user.dart';
import 'package:login_screen_bloc/src/screens/contract/contract_screen.dart';
import 'package:login_screen_bloc/src/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? token;

  @override
  void initState() {
    token = UserSharedPreference.getAccessToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Text(token!.toString()),
          ElevatedButton(
            onPressed: () {
              UserSharedPreference.clearAccessToken();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
            },
            child: Text("Log out"),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ContractScreen()));
              },
              child: Text("contract page")),
        ],
      )),
    );
  }
}
