import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions_screen.dart';
class Quiz extends StatefulWidget
{
 const Quiz({super.key});
@override
  State<Quiz> createState()
  {
    return _QuizState();
  }
}
Widget? activeScreen;

class _QuizState extends State<Quiz>
{
   List<String> selectedAnswers=[];
   void onRestart()
   {
    setState(() {
      selectedAnswers=[];
      activeScreen=QuestionsScreen(onSelectAnswer: chooseAnswer);
    });
   }
  void chooseAnswer(String answer)
{
  selectedAnswers.add(answer);
  if(selectedAnswers.length==questions.length)
  {
    setState(() {
      activeScreen= ResultsScreen(finalAnswers: selectedAnswers,onRestart:onRestart);
    });
  }
}
  @override
  void initState() {
    activeScreen=StartScreen(setScreen);
    super.initState();
  }
  void setScreen()
{
  setState(() {
    activeScreen= QuestionsScreen(onSelectAnswer: chooseAnswer,);
  });
}
  @override
  Widget build(context)
  {
    return  MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 42, 38, 255),
                Color.fromARGB(255, 68, 110, 250),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        child: activeScreen,
      ),
    )
    );
  }
}