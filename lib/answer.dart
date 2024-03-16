import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:quizapp/question.dart';
import 'quizscreen.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    Key? key,
    required this.currentIndex,
    required this.answer,
    required this.isSelected,
    required this.correctAnswerIndex,
     required this.selectedAnswerIndex,
  }) : super(key: key);

  final int currentIndex;
  final String answer;
  final bool isSelected;
   final int? selectedAnswerIndex;
  final int correctAnswerIndex;

  @override
  Widget build(BuildContext context) {
    bool isCorrectAnswer = currentIndex == correctAnswerIndex;
    bool isWrongAnswer = !isCorrectAnswer && isSelected;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Container(
        height: 70,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            width: 2,
            color: isCorrectAnswer && currentIndex != correctAnswerIndex
    ? Colors.green
    : isWrongAnswer
        ? Colors.red
        : Colors.white,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                answer,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 10),
           selectedAnswerIndex != null
                ? (isCorrectAnswer ? BuildCorrectIcon() : isWrongAnswer ? BuildWrongIcon() : const SizedBox.shrink())
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  } 
}

Widget BuildCorrectIcon() => const CircleAvatar(
      radius: 15,
      backgroundColor: Colors.green,
      child: Icon(Icons.check, color: Colors.white),
    );

Widget BuildWrongIcon() => const CircleAvatar(
      radius: 15,
      backgroundColor: Colors.red,
      child: Icon(Icons.close, color: Colors.white),
    );