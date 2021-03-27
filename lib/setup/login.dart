import 'package:flutter/material.dart';
import './signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './home.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String email;
  String password;
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign In'),
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
                      },
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      //forgot password screen
                    },
                    textColor: Colors.blue,
                    child: Text('Forgot Password'),
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Login'),
                      onPressed: () async {
                        setState((){
                          showSpinner = true;
                        });
                        try {
                          final newUser = await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          if (newUser != null) {
                            setState((){
                              showSpinner = false;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WelcomePage()),
                            );
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
                          FlatButton(
                            textColor: Colors.blue,
                            child: Text(
                              'Sign Up',
                              style: TextStyle(fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignupPage()),
                              );
                            },
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ))
                ],
              ))
        ));
  }
}
