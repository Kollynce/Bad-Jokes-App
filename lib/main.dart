import 'package:flutter/material.dart';
import 'package:test/button.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var jokes = [
    {
      "question": "What do you call pencil with two erasers?",
      "answer": "Pointless"
    },
    {
      "question": "What does a baby computer call its father?",
      "answer": "Data"
    },
    {
      "question": "Why is the calender always scared?",
      "answer": "Because its days are numbered"
    },
    {"question": "What do you call a fish with no eye?", "answer": "Fsh"},
  ];

  var jokeIndex = 0;

  changeJokeIndex(String direction) {
    if (direction == "next") {
      if (jokeIndex != jokes.length - 1) {
        setState(() {
          jokeIndex++;
        });
      } else {
        setState(() {
          jokeIndex = jokeIndex = 0;
        });
      }
    } else if (direction == "prev") {
      if (jokeIndex != 0) {
        setState(() {
          jokeIndex--;
        });
      } else {
        setState(() {
          jokeIndex = jokes.length - 1;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Question(question: jokes[jokeIndex]["question"] as String),
              Answer(answer: jokes[jokeIndex]["answer"] as String),
              Button(changeJokeIndex: changeJokeIndex),
            ],
          ),
        ),
      ),
    );
  }
}
