import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isHiden = true;
  @override
  Widget build(BuildContext context) {
    final Size sizeDevice = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(
              //   "Welcome Back!",
              //   style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              // ),
              // SizedBox(
              //   height: 8,
              // ),
              // Text(
              //   "Fill your details or continue",
              //   style: TextStyle(fontSize: 16),
              // ),
              // Text(
              //   "with social media",
              //   style: TextStyle(fontSize: 16),
              // ),
              SizedBox(
                height: 35,
              ),
              Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  key: _formKey,
                  children: [
                    TextFormField(
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
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade400)),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2.0)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2.0)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: password,
                      obscureText: isHiden,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isHiden = !isHiden;
                            });
                          },
                          icon: Icon(isHiden
                              ? Icons.visibility_off
                              : Icons.visibility),
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
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade400)),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2.0)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2.0)),
                      ),
                    ),
                    SizedBox(
                      height: 55,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print("Login");
                      },
                      style: ElevatedButton.styleFrom(
                        primary: HexColor('#00A2C4'),
                        fixedSize: Size(sizeDevice.width - 10, 55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                      ),
                      child: Text("LOG IN"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(" - Or login with - "),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset("assets/images/abc.svg"),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset("assets/images/Facebook.svg"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
