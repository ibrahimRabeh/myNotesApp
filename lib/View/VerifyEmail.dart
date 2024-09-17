import 'package:flutter/material.dart';
import 'package:mynewappmynotes/Components/ReRouter.dart';
import 'package:mynewappmynotes/Components/Toast.dart';
import 'package:mynewappmynotes/Services/Auth/Authservice.dart';
import 'package:mynewappmynotes/Services/Auth/FireBaseAuth.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  sendAuth() async {
    final user = Authservice(FirebBaseAuth());
    user.SendEmailVerification();
  }

  @override
  Widget build(BuildContext context) {
    sendAuth();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Email"),
        backgroundColor: const Color.fromARGB(255, 94, 172, 255),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Please verify your email"),
            ElevatedButton(
              onPressed: () async {
                final user = await Authservice(FirebBaseAuth());
                user.reload();
                toast("Please check your email", color: Colors.grey);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => ReRouter()),
                    (route) => false);
              },
              child: const Text("Verify Email"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => routes.getRegisterRoute(context)),
                    (route) => false);
              },
              child: const Text("Change Email?"),
            ),
          ],
        ),
      ),
    );
  }
}
