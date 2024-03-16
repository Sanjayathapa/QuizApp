import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizapp/answer.dart';
import 'package:quizapp/question.dart';
import 'package:quizapp/resultscreen.dart';
import 'nextbtn.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedAnswerIndex ;
  int questionIndex = 0;
  int score = 0;

  void selectAnswer(int value) {
    setState(() {
      selectedAnswerIndex = value;
      final question = questions[questionIndex];
      if (selectedAnswerIndex == question.correctedanswerIndex) {
        score++;
      }
    });
  }

  void goToNextQuestion() {
    setState(() {
      if (questionIndex < questions.length - 1) {
        questionIndex++;
        selectedAnswerIndex = null; // Reset selectedAnswerIndex
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];
    bool isLastQuestion = questionIndex == questions.length - 1;

    return Scaffold(
  backgroundColor: Color.fromARGB(255, 1, 43, 85),
  appBar: AppBar(
    title: Text('Quiz Screen',style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold)),
    centerTitle: true,
    backgroundColor:Color.fromARGB(255, 1, 43, 85),
  ),
  body: Padding(
    padding: EdgeInsets.all(10.0),
    child: Column(
      children: [
        Text(
          question.question,
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Column(
          children: question.option.map((option) {
            int index = question.option.indexOf(option);
            return GestureDetector(
              onTap: () => selectedAnswerIndex == null ? selectAnswer(index) : null,
              child: AnswerCard(
                currentIndex: index,
                answer: option,
              selectedAnswerIndex: selectedAnswerIndex,
                isSelected: selectedAnswerIndex == index,
                correctAnswerIndex: question.correctedanswerIndex, 
              ),
            );
          }).toList(),
        ),
  
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            isLastQuestion
                ? Button(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => resultscreen(score: score),
                        ),
                      );
                    },
                    // child: Text('Finish'),
                     label:'Finish'
                  )
                : Button(
                    onPressed: selectedAnswerIndex != null ? goToNextQuestion : null,
                    // child: Text(),
                    label:'Next'
                  ),
          ],
        ),
     
      ],
    ),
  ),
);
  }
}

