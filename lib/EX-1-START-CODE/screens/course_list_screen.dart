import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/course.dart';
import '../provider/courses_provider.dart';
import 'course_screen.dart';

const Color mainColor = Colors.blue;

class CourseListScreen extends StatelessWidget {
  const CourseListScreen({super.key});

  void _editCourse(BuildContext context ,String courseID) async {
    await Navigator.of(context).push<Course>(
      MaterialPageRoute(builder: (ctx) => CourseScreen(courseID: courseID)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CourseProvider>(builder: (context,courseProvider,child){
      
      List<Course> allCourses = courseProvider.getCourses;

      return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text('SCORE APP', style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: allCourses.length,
        itemBuilder:
            (ctx, index) => Dismissible(
              key: Key(allCourses[index].courseID!),
              child: CourseTile(
                course: allCourses[index],
                onEdit: _editCourse,
              ),
            ),
      ),
    );
 
    });
    }
}

class CourseTile extends StatelessWidget {
  const CourseTile({super.key,required this.onEdit,required this.course});

  final Function(BuildContext,String) onEdit;
  final Course course;

  int get numberOfScores => course.scores.length;

  String get numberText {
    return course.hasScore ? "$numberOfScores scores" : 'No score';
  }

  String get averageText {
    String average = course.average.toStringAsFixed(1);
    return course.hasScore ? "Average : $average" : '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            onTap:() => onEdit(context,course.courseID!),
            title: Text(course.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(numberText), Text(averageText)],
            ),
          ),
        ),
      ),
    );
  }
}