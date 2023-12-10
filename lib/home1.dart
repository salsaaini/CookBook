import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth _auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Recipe",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        actions: [
          InkWell(
            onTap: () {
              _auth.signOut();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Login()));
            },
            child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Icon(
                  Icons.logout,
                  color: Colors.white,
                )),
          )
        ],
        automaticallyImplyLeading: false,
      ),
    );
  }
}
