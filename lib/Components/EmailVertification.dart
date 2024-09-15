import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynewappmynotes/View/VerifyEmail.dart';
import 'package:mynewappmynotes/View/loginView.dart';
import 'package:mynewappmynotes/View/myNotesMainPage.dart';
import 'package:mynewappmynotes/firebase_options.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  _EmailVerificationState createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return FutureBuilder<User?>(
                  future: _checkEmailVerification(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Scaffold(
                        body: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (snapshot.hasData) {
                      final user = snapshot.data;
                      if (user == null) {
                        return const loginView();
                      } else if (user.emailVerified) {
                        return const Mynotesmainpage();
                      } else {
                        return const VerifyEmail();
                      }
                    } else {
                      return const loginView();
                    }
                  });
            default:
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
          }
        },
      ),
    );
  }

  Future<User?> _checkEmailVerification() async {
    final user = FirebaseAuth.instance.currentUser;
    await user?.reload();
    return user;
  }
}
