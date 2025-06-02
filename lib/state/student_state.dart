import '../model/student_model.dart';

class StudentState {
  final List<Student> lstStudent;

  final bool isLoading;

  const StudentState({required this.lstStudent, required this.isLoading});

  // intially state is -> lstStudent where all the data is empty
  // like name , address , age
  // also loading is also false

  factory StudentState.intial() {
    return StudentState(lstStudent: [], isLoading: false);
  }

  // to change the state
  StudentState copyWith({
    // -> copyWith -> change the state
    List<Student>? lstStudents,
    bool? isLoading,
  }) {
    return StudentState(
      lstStudent: lstStudents ?? this.lstStudent,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
