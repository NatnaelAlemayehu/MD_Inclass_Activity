import 'package:flutter/material.dart';
import 'package:loginscreen/pages/details.dart';
import './login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginscreen/pages/home.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<SignupPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  String repeatpassword;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Screen App'),
        ),
        body: ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: Padding(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: <Widget>[
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Firebase Authentication',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                              fontSize: 30),
                        )),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          email = value;
                        },
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email Address',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextField(
                        onChanged: (value) {
                          password = value;
                          print(password);
                        },
                        obscureText: true,
                        //controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password (must be at least 6 characters)',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextField(
                        onChanged: (value) {
                          repeatpassword = value;
                          print(repeatpassword);
                        },
                        obscureText: true,
                        //controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Repeat Password',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 50,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: Text('Sign Up', style: TextStyle(fontSize: 20)),
                        onPressed: () async {
                          setState(() {
                            showSpinner = true;
                          });
                          try {
                            setState(() {
                              showSpinner = false;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WelcomePage(),
                              ),
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              print('The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              print(
                                  'The account already exists for that email.');
                            }
                          } catch (e) {
                            print(e);
                          }
                        },
                      ),
                    ),
                    Container(
                        child: Row(
                      children: <Widget>[
                        Text('Don\'t not have account?'),
                        // ignore: deprecated_member_use
                        FlatButton(
                          textColor: Colors.blue,
                          child: Text(
                            'Sign in',
                            style: TextStyle(fontSize: 16),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )),
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(),
                          ),
                        );
                      },
                      textColor: Colors.blue,
                      child: Text('About the App'),
                    )
                  ],
                ))));
  }
}
