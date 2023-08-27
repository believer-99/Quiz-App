import 'package:flutter/material.dart';
import 'package:quiz_app/question_Summary.dart/question_border.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  final Map<String, Object> itemData;
  const SummaryItem({super.key, required this.itemData});
  @override
  Widget build(context) {
    final isCorrectAnswer =
        itemData["user_answer"] == itemData["correct_answer"];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionBorder(
            correctAnswer: isCorrectAnswer,
            questionIndex: itemData['question_index'] as int),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(itemData['question'] as String,
                  style: GoogleFonts.lobster(
                    color: Colors.white,
                    fontSize: 20,
                  )),
              const SizedBox(
                height: 5,
              ),
              
              Text(
                itemData['user_answer'] as String,
                style: GoogleFonts.lato(color: const Color.fromARGB(255, 254, 220, 97),
                fontSize: 18,),
              ),
              Text(
                itemData['correct_answer'] as String,
                style: GoogleFonts.lato(
                  color:Color.fromARGB(255, 50, 250, 127),
                  fontSize: 18,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
