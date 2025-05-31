import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/student_model.dart';
import '../state/student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentState.intial());

  void addStudent(Student student) {
    // final updatedList = List<Student>.from(state)..add(student);

    // emit(updatedList);
    // loading is state true to show up the progress bar
    emit(state.copyWith(isLoading: true)) ;
    // progress bar wait for 1 sec
    Future.delayed(const Duration(seconds:  1), () {
      emit(state.copyWith( // copyWith change the state
          lstStudents: [...state.lstStudent, student] , isLoading: false // after adding the
      )) ;

    }) ;
  }


  void deleteStudent(Student student) {
    // final updatedList = List<Student>.from(state)..removeAt(index);
    // emit(updatedList);
    emit(state.copyWith(isLoading: true)) ;
    Future.delayed(Duration(seconds:  1), (){
      emit(state.copyWith(
          lstStudents: state.lstStudent..remove(student) ,
          isLoading: false
      )) ;
    }) ;
  }

  // reset the state to initial
  void reset(){
    emit(StudentState.intial()) ;
  }
}
