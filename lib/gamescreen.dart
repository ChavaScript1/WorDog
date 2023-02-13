import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projectatlas/choosescreen.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  static List<String> correctGuesses = [];

  static const dictionaryFilePath = 'assets/notepad.txt';
  List<String> dictionary = [];
  String word = '';
  int count = 0;
  late Timer _timer;
  int _start = 30;
  bool isOver = false;

  @override
  void initState() {
    super.initState();
    loadDictionary(dictionaryFilePath);
    startTimer();
    correctGuesses.clear();
  }

  void loadDictionary(String filePath) {
    rootBundle.loadString(filePath).then((value) {
      List<String> lines = LineSplitter.split(value).toList();
      dictionary = lines;
      pickRandomWord(dictionary);
    });
  }

  void pickRandomWord(List<String> dictionary) {
    if (dictionary == null || dictionary.isEmpty) {
      throw Exception("Dictionary cannot be null or empty");
    }
    Random random = Random();
    int index = random.nextInt(dictionary.length);
    word = dictionary[index];
    while (word.length < 8) {
      index = random.nextInt(dictionary.length);
      word = dictionary[index];
    }
    setState(() {});
  }
  bool isValidGuess(String word, String guess) {
    word = word.toLowerCase();
    guess = guess.toLowerCase();
    List<int> wordCounts = List.filled(26, 0);
    List<int> guessCounts = List.filled(26, 0);

    if (guess.length > word.length) {
      return false;
    } else if (guess == word) {
      print("guess is the same word as the given one");
      return false;
    }

    // Count the occurrences of each letter in the word
    for (int i = 0; i < word.length; i++) {
      int c = word.codeUnitAt(i);
      wordCounts[c - 'a'.codeUnitAt(0)]++;
    }

    // Count the occurrences of each letter in the guess
    for (int i = 0; i < guess.length; i++) {
      int c = guess.codeUnitAt(i);
      guessCounts[c - 'a'.codeUnitAt(0)]++;
    }

    // Check if the counts of each letter in the guess are less than or equal to the counts in the word
    for (int i = 0; i < 26; i++) {
      if (guessCounts[i] > wordCounts[i]) {
        return false;
      }
    }

    return true;
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          if (_start < 1) {
            timer.cancel();
            isOver = true;
          } else {
            _start = _start - 1;
          }
          if (isOver)
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChooseScreen(score: count),
              ),
            );
        },
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Return Home",
        style: TextStyle(color: Colors.brown),
        ),
        backgroundColor: Colors.amberAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("The word is: $word",
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 33,
                fontWeight: FontWeight.bold,
              ),

            ),
            SizedBox(
              height: 16.0,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter a word",
              ),
              onSubmitted: (value) {
                if (isValidGuess(word, value) && dictionary.contains(value)) {
                  setState(() {
                    correctGuesses.add(value);
                    count += 10;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("$value is a valid word!"),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("$value is not a valid word!"),
                    ),
                  );
                }
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            Text("Correct guesses: ${correctGuesses.toString()}",
            style: TextStyle(
              fontSize: 15,

            ),
            ),
            Text("Points: $count",
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 25

              ),
            ),
            Text('Time: $_start',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
        ),
      ),
            SizedBox(height: 20),



            if (isOver && (count > 100))
              Text(
                'Game Over, you got 100+ points nice job!',
                style: TextStyle(
                  fontFamily: 'Oswald',
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (isOver && (count < 100))
              Text(
                'Game Over, Wow you Suck!',
                style: TextStyle(
                  fontFamily: 'Oswald',
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),


          ],
        ),
      ),
    );
  }
}
