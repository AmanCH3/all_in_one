
import '../model/student_model.dart';

class StudentState {
  final List<Student> lstStudent  ;
  final bool isLoading ;

  const StudentState({
    required this.lstStudent ,
    required this.isLoading ,

  }) ;

  factory StudentState.intial(){
    return StudentState(lstStudent: [], isLoading: false) ;
  }

// to change the state
  StudentState copyWith({
    List<Student>? lstStudents ,
    bool? isLoading ,
  }){
    return StudentState(lstStudent: lstStudents  ?? this.lstStudent, isLoading: isLoading ?? this.isLoading) ;
  }


}