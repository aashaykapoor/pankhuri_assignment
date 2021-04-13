import 'package:flutter/cupertino.dart';
import 'package:pankhuri/model/course.dart';

class CourseViewModel extends ChangeNotifier {
  Course _course;
  get course => _course;
  set course(Course course) {
    this._course = course;
  }

  incrementDay() {
    _course.currentDay++;
    notifyListeners();
  }
}
