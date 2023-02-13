import 'package:flutter/material.dart';
import 'package:projectatlas/gamescreen.dart';
import '../home_page.dart';
import 'gamescreen1.dart';
import 'gamescreen2.dart';

class ChooseScreen extends StatelessWidget {
  @override
  int score = 0;

  ChooseScreen({required this.score});

  @override
  Widget build1(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Score: $score'),
      ),
    );

  }
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '3 Column UI with Floating Action Buttons',
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.lightBlue[100],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 5),
                    Text('Overall Recent Score: $score',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 44.0
                    ),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>GameScreen()),
                        );},
                      child: Text('30 sec'),
                    ),

                  ],
                ),
              ),
            ),

            Expanded(
              child: Container(
                color: Colors.lightGreen[100],
                child: Center(
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>GameScreen1()),
                      );},
                    child: Text('45 sec'),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.pink[100],
                child: Center(
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>GameScreen2()),
                      );},
                    child: Text('60 sec'),
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(

          onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context)=>HomePage(title: 'Flutter Demo Home Page',)),
            );},
          child: Text('Return'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}