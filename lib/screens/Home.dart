import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseapp/models/auth_firestore.dart';
import 'package:firebaseapp/screens/login_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  static late String currentID;
  @override
  State<HomePage>createState() => _HomePageState();

  static void setCurrentID(doc) {
    currentID = doc;
  }

  static String getCurrentID() {
    return currentID;
  }
}

class  _HomePageState extends State<HomePage>{
  var userI4 = {};
  Future getInformation() async {
    FirebaseFirestore.instance.collection('user').get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        if (doc['id'] == HomePage.getCurrentID().trim()) {
          setState(() {
            userI4 = {
              'id': doc['id'],
              'name': doc['name'],
              'username': doc['username']
            };
          });
          print(userI4['name']);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    getInformation();
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.red,
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Center(
                  child: CircleAvatar(
                    radius: 44.0,
                    backgroundColor: Colors.red,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('https://scontent.fhan5-9.fna.fbcdn.net/v/t1.6435-9/120030859_713751182560106_6892642878029460142_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=0debeb&_nc_ohc=eHsNMYJf2V8AX8rtWak&tn=xd-1EaoIqK55SmC8&_nc_ht=scontent.fhan5-9.fna&oh=00_AT9XkLChGy8MysQaFe_SuVlj0HSQweEdxolx8TGV2-hhcQ&oe=62E58E58'),
                      radius: 40.0,
                    ),
                  ),
                ),
                Divider(
                  height: 30.0,
                  color: Colors.grey[800],
                ),
                const Center(
                  child: Text(
                    'HUYNH TRUONG',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                const Text(
                  'Name: ',
                  style: const TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2.0,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  '${userI4['name']}',
                  style: TextStyle(
                      color: Colors.amberAccent[200],
                      letterSpacing: 2.0,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 30.0),
                const Text(
                  "ID: ",
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2.0,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  '${HomePage.getCurrentID()}',
                  style: TextStyle(
                      color: Colors.amberAccent[200],
                      letterSpacing: 2.0,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 30.0),
                const Text(
                  "Username: ",
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2.0,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  '${userI4['username']}',
                  style: TextStyle(
                      color: Colors.amberAccent[200],
                      letterSpacing: 2.0,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 30.0),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.email,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      'h',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 18.0,
                        letterSpacing: 1.0,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.phone,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      'h',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 18.0,
                        letterSpacing: 1.0,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_city,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      'h',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 18.0,
                        letterSpacing: 1.0,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              color: Colors.black,
              onPressed: () {
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              color: Colors.black,
              onPressed: () {},
            ),
            const SizedBox(
              width: 40,
            ),
            IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              color: Colors.black,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.account_box),
              color: Colors.black,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}