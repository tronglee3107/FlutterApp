import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

enum Gender { male, female }

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color inActiveColor = Color(0xFF24232F);
  Color ActiveColor = Colors.grey;
  Gender selectedGender;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('BMI'),
        ),
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectedGender == Gender.male
                          ? ActiveColor
                          : inActiveColor,
                    ),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.male,
                          color: Colors.white,
                          size: 45,
                        ),
                        SizedBox(
                          height: 20,
                          width: 100,
                        ),
                        Text(
                          'Male',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectedGender == Gender.female
                          ? ActiveColor
                          : inActiveColor,
                    ),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.female,
                          color: Colors.white,
                          size: 45,
                        ),
                        SizedBox(
                          height: 20,
                          width: 100,
                        ),
                        Text(
                          'female',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
