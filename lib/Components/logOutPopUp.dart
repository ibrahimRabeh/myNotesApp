import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants/routes.dart';

Future<bool> LogoutPopup(BuildContext context) {
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
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(loginRoute, (route) => false);

              FirebaseAuth.instance.signOut();
            },
            child: Text("Logout"),
          ),
        ],
      );
    },
  ).then((value) => value ?? false);
}
