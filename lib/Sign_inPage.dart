import 'package:flutter/material.dart';
import 'Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Control_Page.dart';

class registerscreen extends StatefulWidget {
  registerscreen({super.key});

  @override
  State<registerscreen> createState() => _registerscreenState();
}

class _registerscreenState extends State<registerscreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  // ignore: non_constant_identifier_names
  String user_get() {
    return email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'logo',
              child: SizedBox(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter Your Email'),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter Your Password'),
            ),
            const SizedBox(
              height: 24.0,
            ),
            TextButton(
              onPressed: () async {
                try {
                  user_get();
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  // ignore: unnecessary_null_comparison
                  if (newUser != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Controll_page();
                        },
                      ),
                    );
                  }
                } catch (e) {
                  print(e);
                }
              },
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.black)))),
              child: const Text(
                'Register',
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.black)))),
              child: const Text(
                'Back',
                style: TextStyle(color: Colors.blueAccent),
              ),
            )
          ],
        ),
      ),
    );
  }
}
