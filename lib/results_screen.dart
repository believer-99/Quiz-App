import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_Summary.dart/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> finalAnswers;
  final void Function() onRestart;
  const ResultsScreen({super.key, required this.finalAnswers,required this.onRestart});
  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];
    for (int i = 0; i < finalAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': finalAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQue = questions.length;
    final numCorrectQue = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
  
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
                    'You have correctly answered $numCorrectQue out of $numTotalQue Questions!',
                    style: GoogleFonts.lato(
                        color: const Color.fromARGB(255, 249, 224, 4),
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30,),
                  QuestionsSummary(summaryData),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton.icon(
                      onPressed:onRestart,
                      style: TextButton.styleFrom(foregroundColor: Colors.white,
                      ),
                      icon:const Icon(Icons.refresh),
                       label: const Text('Restart Quiz')),
                ])));
  }
}
