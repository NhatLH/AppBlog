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
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text(
          'Đăng nhập',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.yellowAccent),
        ),
      ),
      body: SafeArea (
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 60),
              height: 200.0,
              width: 30.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/img/LogoTNTT.PNG'),
                  fit: BoxFit.fill,
                ),
              ),
            ),

            const SizedBox(height: 10),
            Center(
              child: Text('Thiếu Nhi Thánh Thể', style: (TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
            ),
            const SizedBox(height: 5),
            Center(
              child: Text('Xứ đoàn Teresa Hài đồng Giê-su', style: (TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
            ),
            const SizedBox(height: 13),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: username,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.red),
                  ),
                  hintText: 'Tên đăng nhập',
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
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.red),
                    ),
                    labelText: 'Mật khẩu',
                  ),
                )
            ),
            const SizedBox(height: 5),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 15, color: Colors.yellow),
                      primary: Colors.red,
                      onPrimary: Colors.yellow,
                    ),
                    icon: const Icon(Icons.lock_open),
                    onPressed: ()  async {
                      authFireStore.logIn(username.text, password.text, context);
                    },
                    label: const Text('Đăng nhập'),
                    ),

                    const SizedBox(width: 20),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 15),
                        primary: Colors.red,
                        onPrimary: Colors.yellow,
                      ),
                      icon: const Icon(Icons.create),
                      onPressed: ()  async {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SignUpPage()));
                      },
                      label: const Text(' Đăng ký    '),

                    ),
                  ]
                ),

                TextButton(
                  onPressed: (){},
                  style: TextButton.styleFrom(
                    primary: Colors.redAccent, // Text Color
                  ),
                  child: const Text('Quên mật khẩu ?'),
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}

