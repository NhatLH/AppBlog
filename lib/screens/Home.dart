import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/screens/login_screen.dart';
import 'package:flutter/material.dart';
class WelcomApp extends StatefulWidget{
  @override
  State<WelcomApp> createState() => _WelcomeAppState();
}

class  _WelcomeAppState extends State<WelcomApp>{
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100,
        width: 100,
        child: Column(
          children: [
            Text('thanh cong'),
            SizedBox(height: 20),
            Center(child: FlatButton(child: Text('Logout'),onPressed: (){
              auth.signOut();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginPage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}