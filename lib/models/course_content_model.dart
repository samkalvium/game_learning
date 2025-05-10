class CourseContent {
  final String courseName;
  final List<Question> questions;

  CourseContent({required this.courseName, required this.questions});

  factory CourseContent.fromJson(Map<String, dynamic> json) {
    return CourseContent(
      courseName: json['courseName'] ?? 'Unknown',
      questions: (json['questions'] as List)
          .map((q) => Question.fromJson(q))
          .toList(),
    );
  }
}

class Question {
  final int id;
  final String type;
  final String question;
  final List<String>? options;
  final List<Pair>? pairs;
  final String? audioUrl;
  final List<String>? words;
  final String answer;

  Question({
    required this.id,
    required this.type,
    required this.question,
    this.options,
    this.pairs,
    this.audioUrl,
    this.words,
    required this.answer,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      type: json['type'],
      question: json['question'],
      options: (json['options'] as List?)?.map((e) => e.toString()).toList(),
      pairs: (json['pairs'] as List?)?.map((e) => Pair.fromJson(e)).toList(),
      audioUrl: json['audioUrl'],
      words: (json['words'] as List?)?.map((e) => e.toString()).toList(),
      answer: json['answer'],
    );
  }
}

class Pair {
  final String image;
  final String label;

  Pair({required this.image, required this.label});

  factory Pair.fromJson(Map<String, dynamic> json) {
    return Pair(
      image: json['image'],
      label: json['label'],
    );
  }
}
