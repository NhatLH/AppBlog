import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/models/auth_firestore.dart';
import 'package:firebaseapp/screens/signup_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  AuthFireStore authFireStore = AuthFireStore();

  @override
  void dispose(){
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        centerTitle: true,
        title: const Text(
          'Login',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.yellowAccent),
        ),
      ),
      body: SafeArea (
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: username,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Username',
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                )
            ),
            const SizedBox(height: 5),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 15)
                    ),
                    icon: const Icon(Icons.lock_open),
                    onPressed: ()  async {
                      authFireStore.logIn(username.text, password.text, context);
                    },
                    label: const Text('Login'),

                  ),
                const SizedBox(width: 5),
                TextButton(onPressed: (){}, child: const Text('Forgot password ?')),
                const SizedBox(width: 5),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 15)
                  ),
                  icon: const Icon(Icons.create),
                  onPressed: ()  async {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
                  label: const Text('Sign Up'),

                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}

