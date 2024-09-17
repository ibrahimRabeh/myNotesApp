import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynewappmynotes/constants/routes.dart';
import 'package:mynewappmynotes/firebase_options.dart';

class ReRouter extends StatefulWidget {
  const ReRouter({super.key});

  @override
  _ReRouterState createState() => _ReRouterState();
}

final routes = Routes();

class _ReRouterState extends State<ReRouter> {
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
                        return routes.getLoginRoute(context);
                      } else if (user.emailVerified) {
                        log("User is verified");
                        return routes.getMainPage(context);
                      } else {
                        return routes.getVerifyEmail(context);
                      }
                    } else {
                      return routes.getLoginRoute(context);
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
