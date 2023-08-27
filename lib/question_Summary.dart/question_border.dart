import 'package:flutter/material.dart';

class QuestionBorder extends StatelessWidget {
  final int questionIndex;
  final bool correctAnswer;
  const QuestionBorder(
      {super.key, required this.correctAnswer, required this.questionIndex});
  @override
  Widget build(context) {
    final int questionNumber = questionIndex + 1;
    return Container(
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: correctAnswer
              ? const Color.fromARGB(255, 65, 248, 71)
              : const Color.fromARGB(255, 249, 48, 33)),
      child: Text(
        questionNumber.toString(),
        style: const TextStyle(
          color: Colors.black,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
