import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynewappmynotes/Components/HandleSigninUpErrors.dart';
import 'package:mynewappmynotes/Components/ReRouter.dart';
import 'package:mynewappmynotes/Components/Toast.dart';
import 'package:mynewappmynotes/Services/Auth/Authservice.dart';
import 'package:mynewappmynotes/Services/Auth/FireBaseAuth.dart';
import 'package:mynewappmynotes/Services/Auth/auth_exceptions.dart';
import '../Components/PasswordAndEmail.dart';

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
                  try {
                    String email =
                        _passwordAndEmailKey.currentState!.getEmail();
                    String password =
                        _passwordAndEmailKey.currentState!.getPassword();
                    final Authservice authservice =
                        Authservice(FirebBaseAuth());
                    await authservice.LogIn(email: email, password: password);
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const ReRouter()),
                        (route) => false);
                  } on AuthExceptions catch (e) {
                    toast(e.toString());
                  } catch (e) {
                    toast(e.toString());
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
                        MaterialPageRoute(
                            builder: (context) =>
                                routes.getRegisterRoute(context)),
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
