
import 'package:flutter/material.dart';
import 'package:quiz_app/question_Summary.dart/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;
  const QuestionsSummary(this.summaryData, {super.key});
  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: Container(
        color: Color.fromARGB(199, 35, 35, 200),
        child: SingleChildScrollView(
          child: Column(
            children: summaryData.map(
              (data) {
                return SummaryItem(itemData: data);
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
