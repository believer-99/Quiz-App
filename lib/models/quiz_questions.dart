
class QuizQuestion
{
  final String text;
  final List<String>answers;
  const QuizQuestion(this.text,this.answers);

  List<String> shuffledQuestions()
  {
    final shuffled=List.of(answers);
    shuffled.shuffle();
    return shuffled;
  }
}