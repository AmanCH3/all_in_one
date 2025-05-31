import 'package:flutter_bloc/flutter_bloc.dart';

class AirthematicCubit extends Cubit<int> {
  AirthematicCubit() : super(0);

  void add(int firstNumber, int secondNumber) {
    emit(firstNumber + secondNumber);
  }

  void sub(int firstNumber, int secondNumber) {
    emit(firstNumber - secondNumber);
  }

  void mul(int firstNumber, int secondNumber) {
    emit(firstNumber * secondNumber);
  }

  void div(int firstNumber, int secondNumber) {
    if (secondNumber == 0) {
      emit(0); // or handle error differently
    } else {
      emit(firstNumber ~/ secondNumber);
    }
  }

  void reset() {
    emit(0);
  }
}
