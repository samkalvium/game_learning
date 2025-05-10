import 'package:flutter/material.dart';
import '../models/course_content_model.dart';

class FillQuestionWidget extends StatefulWidget {
  final Question question;

  const FillQuestionWidget({super.key, required this.question});

  @override
  State<FillQuestionWidget> createState() => _FillQuestionWidgetState();
}

class _FillQuestionWidgetState extends State<FillQuestionWidget> {
  String? selectedOption;
  bool submitted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fill Question')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              widget.question.question,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            ...?widget.question.options?.map((option) {
              bool isCorrect = option == widget.question.answer;
              bool isSelected = option == selectedOption;
              Color optionColor = Colors.grey[200]!;

              if (submitted && isSelected) {
                optionColor = isCorrect ? Colors.green : Colors.red;
              }

              return GestureDetector(
                onTap: () {
                  if (!submitted) {
                    setState(() {
                      selectedOption = option;
                      submitted = true;
                    });
                  }
                },
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: optionColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Text(option, style: const TextStyle(fontSize: 16)),
                ),
              );
            }).toList(),

            const SizedBox(height: 20),

            if (submitted)
              Text(
                selectedOption == widget.question.answer
                    ? "✅ Correct!"
                    : "❌ Wrong. Correct answer: ${widget.question.answer}",
                style: TextStyle(
                  color: selectedOption == widget.question.answer
                      ? Colors.green
                      : Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )
          ],
        ),
      ),
    );
  }
}
