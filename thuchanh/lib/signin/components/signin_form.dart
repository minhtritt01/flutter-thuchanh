import 'package:flutter/material.dart ';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../homepage.dart';
import '../../model/user.dart';
import '../../model/utilities.dart';
import '../../signup/signup_page.dart';

class SignInForm extends StatefulWidget {
   SignInForm({super.key});

  // const SignInForm({Key? key}) : super(key: key);
  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  bool _value = false;
  var result;

  // ignore: prefer_typing_uninitialized_variables
  late SharedPreferences prefs;
  final username = TextEditingController();
  final password = TextEditingController();

  late FToast fToast;

  //
  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    _getData();
  }

  _getData() async {
    prefs = await SharedPreferences.getInstance();
    // prefs = await SharedPreferences.getInstance();
    // if (!prefs.getString('username').isEmpty) {
    //   username.text = prefs.getString('username');
    //   password.text = prefs.getString('password');
    //   _value = prefs.getBool('check');
    // }
    if (prefs.getString('username')!.isNotEmpty) {
      username.text = prefs.getString('username')!;
      password.text = prefs.getString('password')!;
      _value = prefs.getBool('check')!;
    }
  }

  // _getData() async {
  //   prefs=await SharedPreferences.getInstance();
  //   if(prefs.)
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Food Now",
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),

                    ),
                    Text(
                      "Sign in with your email and password \nor continue with social media",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      validator: (value) {
                        return Utilities.validatePassword(value!);
                      },
                      onSaved: (_value) {
                        setState(() {
                          username.text = _value!;
                        });
                      },
                      controller: username,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Username",
                          prefixIcon: Icon(Icons.mail_outline)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: password,
                      validator: (value) {
                        return Utilities.validatePassword(value!);
                      },
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock_outline_rounded)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_value) {
                            prefs = await SharedPreferences.getInstance();
                            prefs.setString('username', username.text);
                            prefs.setString('password', username.text);
                            prefs.setBool('check', _value);
                          } else {
                            prefs.remove('check');
                          }
                          Navigator.pushNamed(context, HomePage.routeName);
                          // goi nguoc lai navigator.pop
                        },
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green),
                        ),
                        child: Text(
                          "Continue",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Color(0xFFF5F6F9),
                                shape: BoxShape.circle),
                            child:
                                SvgPicture.asset("asset/icons/facebook-2.svg"),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            margin: EdgeInsets.only(left: 10, right: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Color(0xFFF5F6F9),
                                shape: BoxShape.circle),
                            child:
                                SvgPicture.asset("asset/icons/google.svg"),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Color(0xFFF5F6F9),
                                shape: BoxShape.circle),
                            child: SvgPicture.asset("asset/icons/twitter.svg"),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account ?",
                          style: TextStyle(color: Colors.green, fontSize: 14),
                        ),
                        GestureDetector(
                            onTap: () async {
                              // Navigator.pushNamed(
                              //     context, SignUpPage.routeName);
                              result = await Navigator.pushNamed(
                                  context, SignUpPage.routeName);
                              User user=result;
                              username.text = user.username!;
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.redAccent, fontSize: 14),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
    return const Placeholder();
  }
}
