import 'package:flutter/material.dart';
import './homepage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoggingPage(),
    );
  }
}

class LoggingPage extends StatefulWidget {
  @override
  _LoggingPageState createState() => _LoggingPageState();
}

class _LoggingPageState extends State<LoggingPage> {
  String _email = '';
  final emailController = TextEditingController();

  String _password = '';
  final passwordController = TextEditingController();

  bool _showpass = true;
  var _unValidEmail;
  var _unValidPass;

  bool _check = false;
  void _onToggleShowPass() {
    setState(() {
      _showpass = !_showpass;
    });
  }

  void _onPressSignIn() {
    setState(() {
      if (emailController.text.length < 6 ||
          !emailController.text.contains('@')) {
        _unValidEmail = true;
      } else {
        _unValidEmail = false;
      }
      if (passwordController.text.length < 8) {
        _unValidPass = true;
      } else {
        _unValidPass = false;
      }
      if (_unValidEmail == false && _unValidPass == false) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    });
  }

  Widget gotoHome(BuildContext context) {
    return HomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  errorText: _unValidEmail == true ? 'Invalid email' : null,
                  //errorText: _check == true ? 'True' : null,
                ),
              ),
            ),
            Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: <Widget>[
                TextField(
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  controller: passwordController,
                  obscureText: _showpass ? true : false,
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'PASSWORD',
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
                    errorText: _unValidPass == true ? 'Invalid password' : null,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    this.setState(() {
                      _onToggleShowPass();
                    });
                  },
                  child: Text(
                    !_showpass ? 'HIDE' : 'SHOW',
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 15),
                onPressed: _onPressSignIn,
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
    );
  }
}
