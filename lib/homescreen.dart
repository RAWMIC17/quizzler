import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:velocity_x/velocity_x.dart';

QuizBrain quizBrain = QuizBrain();//create a local object to use the question

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> scorekeeper = [
    // Icon(
    //   Icons.check,
    //   color: Colors.green,
    // ),
    // Icon(
    //   Icons.close,
    //   color: Colors.red,
    // ),
    // Icon(
    //   Icons.close,
    //   color: Colors.red,
    // ),
    // Icon(
    //   Icons.close,
    //   color: Colors.red,
    // ),
    // Icon(
    //   Icons.close,
    //   color: Colors.red,
    // ),
  ];

  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.'
  // ];

  int questionNumber = 0;

  // List<bool> answers = [false, true, true];

  // Question q1 = Question(
  //     q: 'You can lead a cow down stairs but not up stairs.', a: false);
  // Question q2 = Question(
  //     q: 'Approximately one quarter of human bones are in the feet.', a: true);
  // Question q3 = Question(
  //     q: 'A slug\'s blood is green.', a: true);

  // List<Question> questionBank=[
  //  Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
  //  Question(q: 'Approximately one quarter of human bones are in the feet.', a: true),
  //  Question(q: 'A slug\'s blood is green.', a: true),
  // ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Vx.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5, //to extend the expanded widget
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  quizBrain.questionBank[questionNumber].questionText, // questions.first
                  style: TextStyle(color: Vx.white, fontSize: 25),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  onPressed: () {
                    bool correctanswer =
                        quizBrain.questionBank[questionNumber].questionAnswer;
                    if (correctanswer == true) {
                      print("Right");
                    } else {
                      print("Wrong");
                    }
                    setState(() {
                      questionNumber = questionNumber + 1;
                      // scorekeeper.add(Icon(
                      //   Icons.check,
                      //   color: Colors.green,
                      // ));
                    });
                    print(questionNumber);
                  },
                  child: "True".text.xl2.color(Vx.white).make(),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Vx.green500),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero))),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  onPressed: () {
                    bool correctanswer =
                        quizBrain.questionBank[questionNumber].questionAnswer;
                    if (correctanswer == false) {
                      print("Right");
                    } else {
                      print("Wrong");
                    }
                    setState(() {
                      questionNumber = questionNumber + 1;
                      // scorekeeper.add(Icon(
                      //   Icons.close,
                      //   color: Colors.red,
                      // ));
                    });
                    print(questionNumber);
                  },
                  child: "False".text.xl2.color(Vx.white).make(),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Vx.red500),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero))),
                ),
              ),
            ),
            Row(
              children: scorekeeper,
            )
          ],
        ),
      ),
    );
  }
}
