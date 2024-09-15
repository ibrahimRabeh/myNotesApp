import 'package:flutter/material.dart';
import 'package:mynewappmynotes/Components/logOutPopUp.dart';

class Mynotesmainpage extends StatefulWidget {
  const Mynotesmainpage({super.key});

  @override
  State<Mynotesmainpage> createState() => _MynotesmainpageState();
}

enum MenuActions { logout, settings, profile }

class _MynotesmainpageState extends State<Mynotesmainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Notes"),
        backgroundColor: const Color.fromARGB(255, 94, 172, 255),
        actions: [
          PopupMenuButton<MenuActions>(
            onSelected: (value) async {
              switch (value) {
                case MenuActions.logout:
                  await LogoutPopup(context);
                  break;
                default:
                  print("nothing happened");
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: MenuActions.logout,
                  child: Text("logout"),
                ),
                const PopupMenuItem(
                  value: MenuActions.settings,
                  child: Text("Settings"),
                ),
                const PopupMenuItem(
                  value: MenuActions.profile,
                  child: Text("Profile"),
                ),
              ];
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text("Welcome to My Notes"),
          ],
        ),
      ),
    );
  }
}
