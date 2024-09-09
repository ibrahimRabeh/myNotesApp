import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynewappmynotes/firebase_options.dart';
import '../Components/PasswordAndEmail.dart';
import './RegisterView.dart';
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
        body: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                print(FirebaseAuth.instance.currentUser);
                return Center(
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
                            String email =
                                _passwordAndEmailKey.currentState!.getEmail();
                            String password = _passwordAndEmailKey.currentState!
                                .getPassword();
                            try {
                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: email, password: password);
                            } on FirebaseAuthException catch (e) {
                              String messsag = "Email or password is incorrect";
                              if (e.code == "channel-error")
                                messsag = "please fill in email and password";
                              Fluttertoast.showToast(
                                  msg: messsag,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.TOP,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor:
                                      const Color.fromARGB(165, 255, 0, 0),
                                  textColor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 16.0);
                            }
                          },
                          child: const Text("Login"),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterView()));
                            },
                            child: const Text(
                                "Don't have an account? Register here"))
                      ],
                    ),
                  ),
                );
              default:
                return const Text("loading...");
            }
          },
        ));
  }
}
