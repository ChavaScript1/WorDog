import 'package:flutter/material.dart';
import '../home_page.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/settingsfix.jpg"),
        fit: BoxFit.cover
    ),
  ),
  ),
    floatingActionButton:Padding(padding: const EdgeInsets.only(bottom: 250.0),
      child: Container(
          height: 100,
          width: 190,
          child: FloatingActionButton(
              elevation: 0.0,
              backgroundColor: const Color(0xAAFFBF00),
              onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>HomePage(title: 'Flutter Demo Home Page',)),
                );
              },
              child: const Icon(
                Icons.arrow_back,
                size: 75.0,

              )
          )
      ),
    ),
  );
  }

