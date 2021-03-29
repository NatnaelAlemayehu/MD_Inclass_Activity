import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginscreen/setup/login.dart';

class WelcomePage extends StatefulWidget {
  final String title;
  final String messange;

  const WelcomePage({Key key, this.title, this.messange}) : super(key: key);
  @override
  WelcomePageState createState() => WelcomePageState();
}

class WelcomePageState extends State<WelcomePage> {
  final _auth = FirebaseAuth.instance;
  String loggedInUser;
  // ignore: unused_field

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      _auth.authStateChanges().listen((User user) {
        if (user == null) {
          //print(user);
        } else {
          print(user);
          print(user.email);
          setState(() {
            loggedInUser = user.email;
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Hi user with email $loggedInUser. You are logged in."),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              // ignore: deprecated_member_use
              child: RaisedButton(
                key: Key('Button'),
                textColor: Colors.white,
                color: Colors.blue,
                child: Text('Sign Out'),
                onPressed: () async {
                  await _auth.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
