import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/screens/Home.dart';
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
        child: Column(
            children: <Widget>[
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: username,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Username',
                  ),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  )
              ),
              SizedBox(height: 5),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 15)
                      ),
                      icon: Icon(Icons.lock_open),
                      onPressed: ()  async {
                        auth.signInWithEmailAndPassword(email: username.text.trim(), password: password.text.trim()).then((_){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => WelcomApp()));
                        });

                      },
                      label: Text('Login'),

                    ),
                  SizedBox(width: 5),
                  TextButton(onPressed: (){}, child: Text('Forgot password ?')),
                ],
              ),
            ]
        ),
      ),
    );
  }
}

