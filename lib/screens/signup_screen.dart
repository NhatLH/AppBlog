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
      body: Container(
        alignment: Alignment.center,
        child: ListView (
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
                  child: Text('Đăng ký tham gia xứ đoàn', style: (TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    controller: name,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.red),
                      ),
                      hintText: 'Tên',
                    ),
                  ),
                ),
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
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextField(
                      controller: cf_password,
                      obscureText: true,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.red),
                        ),
                        labelText: 'Xác thực mật khẩu',
                      ),
                    )
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 15),
                        primary: Colors.red,
                        onPrimary: Colors.yellow,
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
                                title: Text('Thành công',style: TextStyle(fontSize: 10, color: Colors.redAccent)),
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
                                title: Text('Mật khẩu nhập lại không đúng',style: TextStyle(fontSize: 10, color: Colors.redAccent)),
                                backgroundColor: Colors.yellow,
                              );
                            },
                          );
                        }
                      },
                      label: const Text('Đăng ký'),

                    ),

                    const Text('Bạn đã có mật khẩu ?'),
                    const SizedBox(width: 5),
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginPage()));
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.redAccent, // Text Color
                      ),
                      child: const Text('Đăng nhập ngay')
                    )
                  ],
                ),
              ]
          ),
        ),
      );
  }
}

