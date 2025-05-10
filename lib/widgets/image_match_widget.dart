import 'package:flutter/material.dart';
import '../models/course_content_model.dart';

class ImageMatchWidget extends StatefulWidget {
  final Question question;

  const ImageMatchWidget({super.key, required this.question});

  @override
  State<ImageMatchWidget> createState() => _ImageMatchWidgetState();
}

class _ImageMatchWidgetState extends State<ImageMatchWidget> {
  int? selectedImageIndex;
  int? selectedLabelIndex;
  List<bool> matched = [];

  @override
  void initState() {
    super.initState();
    matched = List.filled(widget.question.pairs?.length ?? 0, false);
  }

  void checkMatch(int imageIndex, int labelIndex) {
    final pair = widget.question.pairs!;
    if (pair[imageIndex].label == pair[labelIndex].label) {
      setState(() {
        matched[imageIndex] = true;
      });
    }

    setState(() {
      selectedImageIndex = null;
      selectedLabelIndex = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pairs = widget.question.pairs ?? [];

    return Scaffold(
      appBar: AppBar(title: const Text('Image Match')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Images column
            Expanded(
              child: Column(
                children: List.generate(pairs.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      if (!matched[index]) {
                        setState(() {
                          selectedImageIndex = index;
                        });
                        if (selectedLabelIndex != null) {
                          checkMatch(index, selectedLabelIndex!);
                        }
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: matched[index]
                            ? Colors.green[100]
                            : selectedImageIndex == index
                                ? Colors.blue[100]
                                : Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 80,
                      width: 80,
                      child: Image.asset(pairs[index].image, fit: BoxFit.contain),
                    ),
                  );
                }),
              ),
            ),
            // Labels column
            Expanded(
              child: Column(
                children: List.generate(pairs.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedLabelIndex = index;
                      });
                      if (selectedImageIndex != null) {
                        checkMatch(selectedImageIndex!, index);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: selectedLabelIndex == index
                            ? Colors.blue[100]
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(pairs[index].label,
                          style: const TextStyle(fontSize: 16)),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
