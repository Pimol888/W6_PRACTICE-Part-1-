import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/course.dart';
import '../provider/courses_provider.dart';
import 'course_score_form.dart';

class CourseScreen extends StatelessWidget {
  final String courseID;
  const CourseScreen({super.key, required this.courseID});

  Future<void> _addScore(BuildContext context, String courseID) async {
    final courseProvider = context.read<CourseProvider>();
    CourseScore? newScore = await Navigator.of(context).push<CourseScore>(
      MaterialPageRoute(builder: (ctx) => const CourseScoreForm()),
    );
    courseProvider.addScore(courseID, newScore!);
  }

  Color scoreColor(double score) {
    return score > 50 ? Colors.green : Colors.orange;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CourseProvider>(
      builder: (context, courseProvider, child) {
        Course course = courseProvider.getCoursesFor(courseID);

        Widget content = const Center(child: Text('No Scores added yet.'));

        if (course.scores.isNotEmpty) {
          content = ListView.builder(
            itemCount: course.scores.length,
            itemBuilder:
                (ctx, index) => ListTile(
                  title: Text(course.scores[index].studentName),
                  trailing: Text(
                    course.scores[index].studenScore.toString(),
                    style: TextStyle(
                      color: scoreColor(course.scores[index].studenScore),
                      fontSize: 15,
                    ),
                  ),
                ),
          );
        }

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: mainColor,
            title: Text(
              course.name,
              style: const TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                onPressed: () async {
                  await _addScore(context, course.courseID!);
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          body: content,
        );
      },
    );
  }
}