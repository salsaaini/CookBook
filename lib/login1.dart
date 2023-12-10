import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/register1.dart';
import 'package:flutter_application_1/services/firebase_auth_service.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuthService _authService = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void login() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    User? user =
        await _authService.loginWithEmailandPassword(email, password, context);
    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login success"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login failed"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(254, 193, 35, 1.0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'images/udon.png',
                width: 292,
                height: 292,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'AbhayaLibre',
                ),
              ),
              const SizedBox(
                height: 7.0,
              ),
              const Text(
                "Sign in to continue",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'AbhayaLibre',
                  color: Color(0xFF635B5B),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(21.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        hintText: "Email Address",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.key),
                        hintText: "Password",
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 54.0,
                    ),
                    SizedBox(
                      height: 55,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(255, 152, 0, 1)),
                        onPressed: () {
                          login();
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'AbhayaLibre',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don’t have an account?",
                          style: TextStyle(
                            fontFamily: 'AbhayaLibre',
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 4.0),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Register(),
                              ),
                            );
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.red,
                              fontFamily: 'AbhayaLibre',
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
