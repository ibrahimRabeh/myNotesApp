// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'View/RegisterView.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 73, 63, 90)),
      useMaterial3: true,
    ),
    home: const RegisterView(),
  ));
}
