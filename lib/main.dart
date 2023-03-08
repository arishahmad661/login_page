import 'package:flutter/material.dart';
import 'package:login_page/signup.dart';

import 'login.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Spedah.",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(300),
                    child: Container(
                      color: Colors.blue,
                      child: Image.asset(
                        "assets/bike.png",
                        height: 250,
                      ),
                    ),
                  ),
                ),
                Text(
                  '''Let's
get started''',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 50),
                  child: Text(
                    "Everything starts from here",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text(
                        "Log in",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.amber,
                          ),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => LogIn()));
                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.blue,
                          ),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ))),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class buttons extends StatelessWidget {
  String? txt;
  Color? bgclr, txclr;
  Icon? icn;
  buttons({
    this.txt,
    this.bgclr,
    this.icn,
    this.txclr,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: TextButton.icon(
          icon: icn!,
          onPressed: () {},
          label: Text(
            this.txt!,
            style: TextStyle(color: txclr!, fontSize: 18),
          ),
          style: ButtonStyle(
              iconColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(
                bgclr!,
              ),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(19)),
              ))),
        ),
      ),
    );
  }
}
