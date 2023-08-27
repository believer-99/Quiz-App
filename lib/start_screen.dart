import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.setQuiz, {super.key});
  final void Function() setQuiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            height: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          SizedBox(
            height: 100,
            child: Center(
              child: Text(
                'Learn Flutter the Fun Way!',
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          OutlinedButton.icon(
            onPressed: setQuiz,
            label: const Text('Play Quiz'),
            icon: const Icon(Icons.arrow_circle_right_sharp),
            style: const ButtonStyle(
              iconColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 251, 239, 239)),
              backgroundColor: MaterialStatePropertyAll(
                Color.fromARGB(255, 251, 235, 96),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
