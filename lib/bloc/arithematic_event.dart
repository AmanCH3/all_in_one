import 'package:flutter/cupertino.dart';

@immutable
sealed class ArithmeticEvent {}


// event is created
class AddEvent extends ArithmeticEvent{
  final int first ;
  final int second ;

  AddEvent(this.first , this.second) ;
}

class SubEvent extends ArithmeticEvent {
  final int first ;
  final int second ;

  SubEvent(this.first , this.second) ;
}

class MultiplyEvent extends ArithmeticEvent {
  final int first ;
  final int second ;

  MultiplyEvent(this.first , this.second) ;
}

