import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_screen_bloc/src/bloc/login_bloc/bloc.dart';
import 'package:login_screen_bloc/src/bloc/login_bloc/bloc_event.dart';
import 'package:login_screen_bloc/src/bloc/login_bloc/bloc_state.dart';
import 'package:login_screen_bloc/src/bloc/login_bloc/form_submission_status.dart';

import 'package:login_screen_bloc/src/common/share_prefernce_user.dart';
import 'package:login_screen_bloc/src/repositories/auth_repository.dart';
import 'package:login_screen_bloc/src/screens/home/home_screen.dart';
import 'package:login_screen_bloc/src/screens/widgets/dialog_loading.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController(text: "");
  TextEditingController password = TextEditingController(text: "");

  bool isHiden = true;
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: Duration(seconds: 2),
      ),
    );
  }

  // ignore: close_sinks
  LoginBloc? loginBloc;
  @override
  void initState() {
    loginBloc = BlocProvider.of<LoginBloc>(context);
    super.initState();
  }

  pushToRoute(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final Size sizeDe = MediaQuery.of(context).size;
    return Scaffold(body: loginForm(sizeDe));
  }

  Widget loginForm(Size sizeDevice) {
    return BlocListener<LoginBloc, LoginState2>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            return showDialogLoading(context);
          } else if (state is UserLoginSuccessState) {
            //Navigator.of(context).pop();
            return pushToRoute(context);
          } else if (state is LoginErrorState) {
            Navigator.of(context).pop();
            snackBar(state.message);
            return;
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildTitle(),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildEmailField(),

                      SizedBox(
                        height: 15,
                      ),
                      buildPasswordField(),
                      SizedBox(
                        height: 55,
                      ),

                      // button Login here
                      loginButton(sizeDevice, email.text, password.text),

                      SizedBox(
                        height: 20,
                      ),
                      Text(" - Or login with - "),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/images/abc.svg",
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/images/Facebook.svg",
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "New User? ",
                            style:
                                TextStyle(color: Colors.black38, fontSize: 16),
                          ),
                          Text(
                            "Create Account",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget buildTitle() => Column(children: [
        Text(
          "Welcome Back!",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "Fill your details or continue",
          style: TextStyle(fontSize: 16),
        ),
        Text(
          "with social media",
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 35,
        ),
      ]);

  Widget buildPasswordField() {
    return TextFormField(
      controller: password,
      obscureText: isHiden,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isHiden = !isHiden;
            });
          },
          icon: Icon(isHiden ? Icons.visibility_off : Icons.visibility),
        ),
        hintText: "Password",
        labelText: "Password",
        prefixIcon: Container(
          child: SvgPicture.asset(
            "assets/images/lock.svg",
            height: 10,
            width: 10,
            fit: BoxFit.scaleDown,
          ),
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.0)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.0)),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Mật khẩu không được bỏ trống";
        }
        return null;
      },
      // onChanged: (value) =>
      //     context.read<LoginBloc>().add(LoginPasswordChanged(password: value)),
    );
  }

  Widget buildEmailField() {
    return TextFormField(
      controller: email,
      decoration: InputDecoration(
        hintText: "Email Address",
        labelText: "Email",
        prefixIcon: SvgPicture.asset(
          "assets/images/Message.svg",
          height: 10,
          width: 10,
          fit: BoxFit.scaleDown,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.0)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.0)),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Tài khoản không được bỏ trống";
        }
        return null;
      },
      // onChanged: (value) =>
      //     context.read<LoginBloc>().add(LoginUsernameChanged(username: value)),
    );
  }

  Widget loginButton(Size size, String username, String pass) {
    // return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
    //  state.formStatus is FormSubmitting
    //     ? showDialogLoading(context)
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          loginBloc!
              .add(LoginSubmitted(email: email.text, password: password.text));
        }
      },
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF00A2C4),
        fixedSize: Size(size.width - 10, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // <-- Radius
        ),
      ),
      child: Text(
        "LOG IN",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
    // });
  }
}


/*
  ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          showDialogLoading(context);
                          var status = await AuthRepository().loginAPI(
                              email: email.text, password: password.text);
                          Navigator.of(context).pop();
                          if (status.statusCode == 200) {
                            snackBar("Đăng nhập thành công");
                            var dataResponse = jsonDecode(status.body)['data'];
                            print(dataResponse['accessToken']);
                            UserSharedPreference.setAccessToken(
                                dataResponse['accessToken']);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                          } else {
                            snackBar("Sai tài khoản hoặc mật khẩu");
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF00A2C4),
                        fixedSize: Size(sizeDevice.width - 10, 55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                      ),
                      child: Text(
                        "LOG IN",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
 */