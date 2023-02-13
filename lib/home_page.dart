import 'package:flutter/material.dart';
import 'settingsscreen.dart';
import 'choosescreen.dart';

class HomePage extends StatefulWidget {
  HomePage({required this.title});

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/inava.jpg"),
            fit: BoxFit.cover
          ),
        ),

      ),
      floatingActionButton: Row(
        children: [
          Padding(padding: const EdgeInsets.only(bottom: 325.0),
            child: Container(
                height: 100,
                width: 190,
                child: FloatingActionButton(
                    elevation: 0.0,
                    backgroundColor: const Color(0xAAFFBF00),
                    onPressed: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>SettingsScreen()),
                      );
                    },
                    child: const Icon(
                      Icons.question_mark,
                      size: 75.0,
                    )
                )
            ),
          ),

          Padding(padding: const EdgeInsets.only(bottom: 325.0),
            child: Container(
                height: 100,
                width: 100,
                child: FloatingActionButton(
                    elevation: 0.0,
                    backgroundColor: const Color(0xAAFFBF00),
                    onPressed: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>ChooseScreen(score: 0,)),
                      );
                    },
                    child: const Icon(
                      Icons.play_arrow,
                      size: 95.0,
                    )
                )
            ),
          ),

        ],
      )
      );


  Widget _buildTitle() => const Text(
    "Inava Games",
    textAlign: TextAlign.center,
  );

}



