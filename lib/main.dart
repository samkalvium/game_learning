import 'package:flutter/material.dart';
import 'mock/demo_data.dart';
import 'models/course_content_model.dart';
import 'widgets/fill_question_widget.dart';
import 'widgets/image_match_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learning + Gaming App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Convert demo data (Map) into Dart object
    final CourseContent content = CourseContent.fromJson(mockCourseData);

    return Scaffold(
      appBar: AppBar(title: Text(content.courseName)),
      body: ListView.builder(
        itemCount: content.questions.length,
        itemBuilder: (context, index) {
          final q = content.questions[index];
          return ListTile(
              title: Text(q.question),
              subtitle: Text("Type: ${q.type}"),
              onTap: () {
                if (q.type == 'fill') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FillQuestionWidget(question: q),
                    ),
                  );
                } else if (q.type == 'image_match') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImageMatchWidget(question: q),
                    ),
                  );
                }
              });
        },
      ),
    );
  }
}
