import 'package:flutter/material.dart';

import 'main.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _form = GlobalKey<FormState>();

  bool _isValid = false;

  bool _passvisibl = true;
  bool _passvisibl2 = true;
  void _saveForm() {
    setState(() {
      _isValid = _form.currentState!.validate();
    });
  }

  void changevisible1() {
    setState(() {
      _passvisibl = !_passvisibl;
    });
  }

  void changevisible2() {
    setState(() {
      _passvisibl2 = !_passvisibl2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 8.0,
            right: 8.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create account",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Sign up to get started!",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Form(
                      key: _form,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                label: Text("Username"),
                                prefixIcon: Icon(Icons.person_2_outlined),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }

                              if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                return "Please enter a valid email address";
                              }

                              return null;
                            },
                            decoration: InputDecoration(
                                label: Text("Email"),
                                prefixIcon: Icon(Icons.mail_outline),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            obscureText: _passvisibl,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }

                              if (!RegExp(
                                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                  .hasMatch(value)) {
                                return "Please enter a valid email address";
                              }

                              return null;
                            },
                            decoration: InputDecoration(
                                label: Text("Pasword"),
                                prefixIcon: Icon(Icons.lock_outline),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.remove_red_eye_outlined),
                                  onPressed: () {
                                    changevisible1();
                                  },
                                ),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }
                              return null;
                            },
                            obscureText: _passvisibl2,
                            decoration: InputDecoration(
                                label: Text(" Confirm Pasword"),
                                prefixIcon: Icon(Icons.lock_outline),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.remove_red_eye_outlined),
                                  onPressed: () {
                                    changevisible2();
                                  },
                                ),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)))),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Text("Forgot Password?")),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: TextButton(
                          onPressed: _saveForm,
                          child: Text(
                            "Sign up",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          style: ButtonStyle(
                              iconColor:
                                  MaterialStateProperty.all(Colors.white),
                              backgroundColor: MaterialStateProperty.all(
                                Colors.amber,
                              ),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(19)),
                              ))),
                        ),
                      ),
                    ),
                    _isValid
                        ? const Text('Your email seems nice!')
                        : Container(),
                    buttons(
                        txt: "Sign up using Apple",
                        bgclr: Colors.black,
                        icn: Icon(Icons.apple),
                        txclr: Colors.white),
                    buttons(
                        txt: "Sign up using Google",
                        bgclr: Colors.blue[50],
                        icn: Icon(Icons.g_mobiledata),
                        txclr: Colors.black)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                    alignment: Alignment.center,
                    child: Text("Don't have account? Sign up")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
