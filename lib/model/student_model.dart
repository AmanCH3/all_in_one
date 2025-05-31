import 'package:equatable/equatable.dart';

class Student extends Equatable {
  final String name ;
  final int age  ;
  final String address ;

  const Student({
    required this.name ,
    required this.age ,
    required this.address,
  }) ;

  @override
  List<Object?> get props => [
    name ,
    age ,
    address
  ] ;
}