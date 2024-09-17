import 'package:flutter/material.dart';
import 'package:mynewappmynotes/Components/ReRouter.dart';
import 'package:mynewappmynotes/Services/Auth/Authservice.dart';
import 'package:mynewappmynotes/Services/Auth/FireBaseAuth.dart';
import '../Components/PasswordAndEmail.dart';
import 'package:mynewappmynotes/Services/Auth/auth_exceptions.dart';
import 'package:mynewappmynotes/Components/Toast.dart';

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
                  try {
                    final email = _passwordAndEmailKey.currentState!.getEmail();
                    final password =
                        _passwordAndEmailKey.currentState!.getPassword();

                    final Authservice authservice =
                        Authservice(FirebBaseAuth());
                    await authservice.CreateUser(
                      email: email,
                      password: password,
                    );
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ReRouter()));
                  } on AuthExceptions catch (e) {
                    toast(e.toString());
                  } catch (e) {
                    toast(e.toString());
                  }
                },
                child: const Text("register", style: TextStyle(fontSize: 20)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => routes.getLoginRoute(context)),
                      (route) => false);
                },
                child: const Text("Already have an account?"),
              ),
            ],
          ),
        )));
  }
}
