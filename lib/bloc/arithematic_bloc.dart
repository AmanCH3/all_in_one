import 'package:all_in_one/bloc/arithematic_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArithematicBloc extends Bloc<ArithmeticEvent , int>{
  ArithematicBloc() : super(0){
    // new paramter is added
    // Events
    on<AddEvent>((event , emit) {
      final result = event.first + event.second ; // result where addition takes
      emit(result) ; // new state is return
    }) ;

    on<SubEvent>((event , emit){
      final result = event.first + event.second ; // result  where subtraction takes
      emit(result) ;
    }) ;

    on<MultiplyEvent>((event , emit){
      final result = event.first * event.second ;
      emit(result) ;
    }) ;
  }
}