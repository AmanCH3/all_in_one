import 'package:all_in_one/cubit/dashboard_cubit.dart';
import 'package:all_in_one/service_locator/service_locator.dart';
import 'package:all_in_one/view/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider.value(
        value: serviceLocator<DashboardCubit>(),
        child: DashboardView(),
      ),
    );
  }
}

// return MultiBlocProvider(
//   providers: [
//     BlocProvider(create: (context) => CounterCubit()),
//     BlocProvider(create: (context) => AirthematicCubit()),
//     BlocProvider(create: (context) => StudentCubit()),
//     BlocProvider(create: (context) =>
//         DashboardCubit(
//           context.read<CounterCubit>(),
//           context.read<AirthematicCubit>(),
//           context.read<StudentCubit>(),
//
//         ))
//   ],
//
//   child: MaterialApp(
//     debugShowCheckedModeBanner: false,
//     title: 'Flutter BLoc',
//     home: DashboardView(),
//   ),
// );
