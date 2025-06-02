import 'package:flutter/cupertino.dart';

import '../model/student_model.dart';

@immutable
sealed class StudentEvent {}

class addStudent extends StudentEvent {
  final Student student;

  addStudent(this.student);
}

class deleteStudent extends StudentEvent {
  final int index;

  deleteStudent(this.index);
}
