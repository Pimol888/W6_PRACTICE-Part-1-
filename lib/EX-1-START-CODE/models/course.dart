import 'package:uuid/uuid.dart';

class Course {
  Course({required this.name,this.courseID}){
    courseID ??= Uuid().v4();
  }

  String? courseID;
  final String name;

  final List<CourseScore> scores = [];

  bool get hasScore => scores.isNotEmpty;

  double get average {
    if (scores.isNotEmpty) {
      double total = scores.fold(0, (prev, score) => prev + score.studenScore);
      return total / scores.length;
    }
    return 0;
  }
}

class CourseScore {
  const CourseScore({required this.studentName, required this.studenScore});

  final String studentName;
  final double studenScore;
}