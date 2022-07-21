import 'package:firebaseapp/Components/user_class.dart';
import 'package:firebaseapp/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebaseapp/models/auth_firestore.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController name = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cf_password = TextEditingController();

  AuthFireStore authFireStore = AuthFireStore();

  late Users users;

  @override
  void dispose() {
    name.dispose();
    username.dispose();
    password.dispose();
    cf_password.dispose();
    super.dispose();
  }

  bool confirm() {
    if (password.text == cf_password.text) {
      return true;
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: ListView (
              children: <Widget>[
                const SizedBox(height: 40),
                const Text('SIGN UP', style: TextStyle(fontSize: 40)),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    controller: name,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Name',
                    ),
                  ),
                ),
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
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextField(
                      controller: cf_password,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirm Password',
                      ),
                    )
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 15)
                      ),
                      icon: const Icon(Icons.lock_open),
                      onPressed: ()  async {
                        if (confirm()) {
                          users = Users(
                            id: '',
                            name: name.text,
                            username: username.text,
                            password: password.text,
                          );
                          authFireStore.createAccount(users);
                          Navigator.pop(context);
                          await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const AlertDialog(
                                title: Text('Successfull',style: TextStyle(fontSize: 10, color: Colors.redAccent)),
                                backgroundColor: Colors.yellow,
                              );
                            },
                          );

                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
                        } else {
                          await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const AlertDialog(
                                title: Text('Fail Sign Up',style: TextStyle(fontSize: 10, color: Colors.redAccent)),
                                backgroundColor: Colors.yellow,
                              );
                            },
                          );
                        }
                      },
                      label: const Text('Sign Up'),

                    ),

                    const Text('I have an account ?'),
                    const SizedBox(width: 5),
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginPage()));
                      },
                      child: const Text('Login now')
                    )
                  ],
                ),
              ]
          ),
        ),
      );
  }
}

