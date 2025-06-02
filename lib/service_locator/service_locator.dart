import 'package:all_in_one/bloc/arithematic_bloc.dart';
import 'package:all_in_one/bloc/student_bloc.dart';
import 'package:all_in_one/cubit/airthematic_cubit.dart';
import 'package:all_in_one/cubit/counter_cubit.dart';
import 'package:all_in_one/cubit/dashboard_cubit.dart';
import 'package:all_in_one/cubit/student_cubit.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initBloc();
  _initCubit();
}

void _initBloc() {
  // Ensure ArithematicBloc is registered
  serviceLocator.registerFactory<ArithematicBloc>(() => ArithematicBloc());
  // Ensure StudentBloc is registered
  serviceLocator.registerFactory<StudentBloc>(() => StudentBloc());
}

void _initCubit() {
  // Register all Cubit dependencies
  serviceLocator.registerFactory<CounterCubit>(() => CounterCubit());
  serviceLocator.registerFactory<AirthematicCubit>(() => AirthematicCubit());
  serviceLocator.registerFactory<StudentCubit>(() => StudentCubit());

  // Now, register DashboardCubit, providing the *correct types* for its dependencies
  serviceLocator.registerLazySingleton<DashboardCubit>(
    () => DashboardCubit(
      serviceLocator<CounterCubit>(), // Provide CounterCubit
      serviceLocator<AirthematicCubit>(), // Provide AirthematicCubit
      serviceLocator<StudentCubit>(), // Provide StudentCubit
      serviceLocator<ArithematicBloc>(),
      // Provide ArithematicBloc (registered in _initBloc)
      serviceLocator<
        StudentBloc
      >(), // Provide StudentBloc (registered in _initBloc)
    ),
  );
}
