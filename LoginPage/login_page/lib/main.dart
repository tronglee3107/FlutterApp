import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _email = '';
  final emailController = TextEditingController();

  String _password = '';
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  width: 70,
                  height: 70,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[400],
                  ),
                  child: FlutterLogo(),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Hello 🥰\nWelcome Back',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w900),
                ),
              ),
              //this the the input for enmail
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: TextField(
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  controller: emailController,
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'USERNAME',
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ),
              ),
              Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  TextField(
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    controller: passwordController,
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        _password = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'PASSWORD',
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      print('Press');
                    },
                    child: Text(
                      'Show',
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  onPressed: () {
                    print('Signed in');
                  },
                  color: Colors.blue,
                  child: Center(
                    child: Text('SIGN IN',
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'NEW USER?',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                        FlatButton(
                          onPressed: () {
                            print('Press');
                          },
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(color: Colors.blue, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    FlatButton(
                      onPressed: () {
                        print('Press');
                      },
                      child: Text(
                        'FORGOT PASSWORD',
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
