import 'package:all_in_one/bloc/arithematic_bloc.dart';
import 'package:all_in_one/bloc/student_bloc.dart';
import 'package:all_in_one/view/airthematic_bloc_view.dart';
import 'package:all_in_one/view/student_bloc_view.dart';
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
    this._arithematicBloc,
    this._studentBloc,
  ) : super(null);

  final CounterCubit _counterCubit;
  final AirthematicCubit _airthematicCubit;
  final StudentCubit _studentCubit;
  final ArithematicBloc _arithematicBloc;
  final StudentBloc _studentBloc;

  void openCounterView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (_) => BlocProvider.value(
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
        builder:
            (_) => BlocProvider.value(
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
        builder:
            (_) => BlocProvider.value(
              value: _studentCubit,
              child: const StudentView(),
            ),
      ),
    );
  }

  void openArithematicBlocView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (_) => BlocProvider.value(
              value: _arithematicBloc,
              child: const AirthematicBlocView(),
            ),
      ),
    );
  }

  void openStudentBlocView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (_) => BlocProvider.value(
              value: _studentBloc,
              child: const StudentBlocView(),
            ),
      ),
    );
  }
}
