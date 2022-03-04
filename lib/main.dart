import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_screen_bloc/src/bloc/contract_bloc.dart/contract_bloc.dart';
import 'package:login_screen_bloc/src/bloc/contract_bloc.dart/contract_bloc_state.dart';

import 'package:login_screen_bloc/src/bloc/login_bloc/bloc.dart';
import 'package:login_screen_bloc/src/bloc/login_bloc/bloc_state.dart';
import 'package:login_screen_bloc/src/common/share_prefernce_user.dart';
import 'package:login_screen_bloc/src/repositories/auth_repository.dart';
import 'package:login_screen_bloc/src/repositories/contract_repository.dart';
import 'package:login_screen_bloc/src/screens/login_screen.dart';

// void main() {
//   BlocOverrides.runZoned(() async {
//     WidgetsFlutterBinding.ensureInitialized();
//     await UserSharedPreference.init();
//     runApp(MyApp());
//   }, blocObserver: MyBlocObserver());
// }

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSharedPreference.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => LoginBloc(LoginInitState(), AuthRepository())),
        BlocProvider(
            create: (context) =>
                ContractBloc(ContractInitState(), ContractRepository()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
