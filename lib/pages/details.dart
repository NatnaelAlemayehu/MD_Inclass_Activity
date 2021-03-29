import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginscreen/setup/login.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About the App'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text('This App was developed for educational purposes'),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            key: Key('Button'),
            height: 50,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            // ignore: deprecated_member_use
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(primary: Colors.blue),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.login,
                    key: Key('icon_login'),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Return to Login')
                ])),
          )
        ],
      ),
    );
  }
}
