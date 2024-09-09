import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynewappmynotes/firebase_options.dart';

class PasswordandEmail extends StatefulWidget {
  const PasswordandEmail({super.key});
  @override
  State<PasswordandEmail> createState() => _PasswordandEmailState();

  _PasswordandEmailState() {
    return PasswordandEmailState();
  }
}

class PasswordandEmailState extends State<PasswordandEmail> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  String getEmail() {
    return _email.text;
  }

  String getPassword() {
    return _password.text;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: TextField(
                            controller: _email,
                            autocorrect: false,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Enter your Email",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: TextField(
                            controller: _password,
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Enter your password",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            default:
              return const CircularProgressIndicator();
          }
        });
  }
}
