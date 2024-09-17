import 'package:flutter/material.dart';
import 'package:mynewappmynotes/Components/ReRouter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 73, 63, 90)),
      useMaterial3: true,
    ),
    home: const ReRouter(),
  ));
}
