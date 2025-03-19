import 'package:flutter/material.dart';
import '../models/course.dart';
import '../repository/course_repo.dart';

class CourseProvider extends ChangeNotifier {
  CourseRepository repository;
  CourseProvider({required this.repository});

  List<Course> get getCourses => repository.getCourses();

  Course getCoursesFor(String courseID){
    return getCourses.firstWhere((item)=>item.courseID == courseID);
  }

  void addScore(String courseID, CourseScore courseScore){
    Course course = getCoursesFor(courseID);
    repository.addScore(course, courseScore);
    notifyListeners();
  }
}