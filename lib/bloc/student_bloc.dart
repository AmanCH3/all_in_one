import 'package:all_in_one/bloc/student_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  StudentBloc() : super(StudentState.intial()) {
    on<addStudent>((event, emit) {
      emit(state.copyWith(isLoading: true));
      Future.delayed(const Duration(seconds: 1), () {
        emit(
          state.copyWith(
            // copyWith change the state
            lstStudents: [...state.lstStudent, event.student],
            isLoading: false, // after adding the
          ),
        );
      });
    });

    on<deleteStudent>((event, emit) {
      emit(state.copyWith(isLoading: true));
      Future.delayed(const Duration(seconds: 1), () {
        emit(
          state.copyWith(
            lstStudents: state.lstStudent..remove(event.index),
            isLoading: false,
          ),
        );
      });
    });
  }
}
