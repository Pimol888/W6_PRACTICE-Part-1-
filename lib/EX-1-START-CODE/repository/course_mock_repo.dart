import 'package:uuid/uuid.dart';
import '../models/course.dart';
import 'course_repo.dart';

class CourseMockRepository implements CourseRepository {
  List<Course> _courses = [];

  // init dummy
  CourseMockRepository() {
    _courses = [
      Course(name: "Java", courseID: Uuid().v4()),
      Course(name: "Html", courseID: Uuid().v4()),
      Course(name: "Dart", courseID: Uuid().v4()),
    ];
  }

  @override
  void addScore(Course course, CourseScore courseScore) {
    for(var item in _courses){
      if(item.courseID == course.courseID){
        item.scores.add(courseScore);
      }
    }
  }

  @override
  List<Course> getCourses() {
    return _courses;
  }
}