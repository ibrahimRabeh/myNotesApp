import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynewappmynotes/Components/EmailVertification.dart';
import 'package:mynewappmynotes/View/RegisterView.dart';
import 'package:mynewappmynotes/constants/routes.dart';
import '../Components/PasswordAndEmail.dart';
import 'package:fluttertoast/fluttertoast.dart';

class loginView extends StatefulWidget {
  const loginView({Key? key}) : super(key: key);

  @override
  _loginViewState createState() => _loginViewState();
}

class _loginViewState extends State<loginView> {
  final GlobalKey<PasswordandEmailState> _passwordAndEmailKey =
      GlobalKey<PasswordandEmailState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New App"),
        backgroundColor: const Color.fromARGB(255, 94, 172, 255),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PasswordandEmail(key: _passwordAndEmailKey),
              FilledButton(
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(
                        Color.fromRGBO(0, 161, 230, 1))),
                onPressed: () async {
                  String email = _passwordAndEmailKey.currentState!.getEmail();
                  String password =
                      _passwordAndEmailKey.currentState!.getPassword();
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email, password: password);
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const EmailVerification()),
                        (route) => false);
                  } on FirebaseAuthException catch (e) {
                    String message = e.code;

                    switch (e.code) {
                      case "channel-error":
                        message = "please fill in password and email";
                        break;
                      case "network-request-failed":
                        message = "check internet connection";
                        break;
                      default:
                        message = "something went wrong";
                    }

                    Fluttertoast.showToast(
                        msg: message,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 1,
                        backgroundColor: const Color.fromARGB(165, 255, 0, 0),
                        textColor: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: 16.0);
                  }
                },
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => RegisterView()),
                        (Route) => false);
                  },
                  child: const Text("Don't have an account? Register here"))
            ],
          ),
        ),
      ),
    );
  }
}
