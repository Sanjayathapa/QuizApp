import 'package:flutter/material.dart';
import 'package:quizapp/nextbtn.dart';
import 'package:quizapp/question.dart';
import 'package:quizapp/quizscreen.dart';

class resultscreen extends StatelessWidget {
  const resultscreen({super.key, required this.score});
  final int score;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 92, 18),
      body: Center(
        child:Column(
          children: [
          const  SizedBox(height:100),
          const Text('YOUR SCORE',
            style:TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold, 
              color:Colors.white)),
              const SizedBox(height:180),
              Stack(
                alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 200,
                width:200,
              child:CircularProgressIndicator(
                strokeWidth: 12,
              value: score / 21,color:Color.fromARGB(255, 13, 251, 13),backgroundColor: Colors.white,
              )
              ),
             Column(
  children: [
    Text(score.toString() + "/21",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:Colors.white),),
    Text(((score / questions.length * 100).round()).toString() + "%",
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color:Colors.white)),
    TextButton(
      onPressed: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const QuizScreen()));
      },
      child: Text('Restart',style: TextStyle(
        color:Colors.white,
        fontSize: 18,
      fontWeight: FontWeight.bold),),
    ),
  ],
),
           ] ),]
      ),
    ));
  }
}
