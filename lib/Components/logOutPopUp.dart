import 'package:flutter/material.dart';
import 'package:mynewappmynotes/Services/Auth/Authservice.dart';
import 'package:mynewappmynotes/Services/Auth/FireBaseAuth.dart';
import 'package:mynewappmynotes/constants/routes.dart';

Future<bool> LogoutPopup(BuildContext context) {
  Routes routes = Routes();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Logout"),
        content: const Text("are you sure you want to logout?"),
        actions: [
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => routes.getLoginRoute(context)),
                  (route) => false);

              Authservice(FirebBaseAuth()).LogOut();
            },
            child: Text("Logout"),
          ),
        ],
      );
    },
  ).then((value) => value ?? false);
}
