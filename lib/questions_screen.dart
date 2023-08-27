import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  final void Function(String answer)onSelectAnswer;
  const QuestionsScreen({super.key,required this.onSelectAnswer});
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var questionIndex = 0;
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(context) {
    final question = questions[questionIndex];
    return Container(
      margin: const EdgeInsets.all(40),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lobster(
                color: Color.fromARGB(255, 245, 232, 118),
                fontSize: 25,
              ),
            ),
            ...question.shuffledQuestions().map(
              (answer) {
                return AnswerButton(
                  answerText: answer,
                  onTap: ((){
                    answerQuestion(answer);
                  }),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
