import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginscreen/login.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final User = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Hi user at ${loggedInUser.email}. You are logged in"),
          Container(
            height: 50,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('Sign Out'),
              onPressed: () {
                _auth.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage()),
                );
              },
            ),
          )
        ],
      ),
    )
  }
}
