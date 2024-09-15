import 'package:flutter/material.dart';
import 'package:mynewappmynotes/Components/EmailVertification.dart';
import 'package:mynewappmynotes/View/RegisterView.dart';
import 'package:mynewappmynotes/View/loginView.dart';
import 'package:mynewappmynotes/View/myNotesMainPage.dart';
import 'package:mynewappmynotes/constants/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 73, 63, 90)),
      useMaterial3: true,
    ),
    home: const EmailVerification(),
    routes: {
      loginRoute: (context) => const loginView(),
      registerRoute: (context) => const RegisterView(),
      notesRoute: (context) => const Mynotesmainpage(),
    },
  ));
}
