import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/airthematic_cubit.dart';
import '../cubit/counter_cubit.dart';
import '../cubit/student_cubit.dart';
import '../view/airthematic_view.dart';
import '../view/counter_view.dart';
import '../view/student_view.dart';

class DashboardCubit extends Cubit<void> {
  DashboardCubit(
      this._counterCubit,
      this._airthematicCubit,
      this._studentCubit,
      ) : super(null);

  final CounterCubit _counterCubit;
  final AirthematicCubit _airthematicCubit;
  final StudentCubit _studentCubit;

  void openCounterView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _counterCubit,
          child: const CounterCubitView(),
        ),
      ),
    );
  }

  void openAirthematicView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _airthematicCubit,
          child: const AirthematicView(),
        ),
      ),
    );
  }

  void openStudentView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _studentCubit,
          child: const StudentView(),
        ),
      ),
    );
  }
}
