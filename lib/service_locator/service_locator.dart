import 'package:all_in_one/cubit/airthematic_cubit.dart';
import 'package:all_in_one/cubit/counter_cubit.dart';
import 'package:all_in_one/cubit/dashboard_cubit.dart';
import 'package:all_in_one/cubit/student_cubit.dart';
import 'package:get_it/get_it.dart';

import '../bloc/arithematic_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initBloc();
  _initCubit();
}

void _initBloc() {
  serviceLocator.registerFactory(() => ArithematicBloc());
}
// serviceLocator provide the service

void _initCubit() {
  serviceLocator.registerFactory<CounterCubit>(() => CounterCubit());
  serviceLocator.registerFactory<AirthematicCubit>(() => AirthematicCubit());
  serviceLocator.registerFactory<StudentCubit>(() => StudentCubit());

  serviceLocator.registerLazySingleton<DashboardCubit>(
    () => DashboardCubit(serviceLocator(), serviceLocator(), serviceLocator()),
  );
}
