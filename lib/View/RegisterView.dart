import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mynewappmynotes/Components/EmailVertification.dart';
import 'package:mynewappmynotes/constants/routes.dart';
import '../Components/PasswordAndEmail.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<PasswordandEmailState> _passwordAndEmailKey =
      GlobalKey<PasswordandEmailState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("New App"),
          backgroundColor: Color.fromARGB(255, 94, 172, 255),
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
                  final email = _passwordAndEmailKey.currentState!.getEmail();
                  final password =
                      _passwordAndEmailKey.currentState!.getPassword();
                  try {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: email, password: password);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const EmailVerification()));
                  } on FirebaseAuthException catch (e) {
                    print(e.code);
                    print("error");

                    String messsag = "Email or password is incorrect";
                    switch (e.code) {
                      case "email-already-in-use":
                        messsag = "email already in use";
                        break;
                      case "invalid-email":
                        messsag = "please enter a valid email";
                        break;
                      case "weak-password":
                        messsag =
                            "password must contain uppercase and lowercase letters and numbers";
                        break;
                    }
                    Fluttertoast.showToast(
                        msg: messsag,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 3,
                        backgroundColor: const Color.fromARGB(165, 255, 0, 0),
                        textColor: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: 16.0);
                  }
                },
                child: const Text("register", style: TextStyle(fontSize: 20)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(loginRoute, (route) => false);
                },
                child: const Text("Already have an account?"),
              ),
            ],
          ),
        )));
  }
}
