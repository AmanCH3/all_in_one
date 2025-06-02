import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/dashboard_cubit.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: GridView(
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          children: [
            // Counter Cubit
            Card(
              child: InkWell(
                onTap: () {
                  context.read<DashboardCubit>().openCounterView(context);
                },
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, size: 48),
                    SizedBox(height: 8),
                    Text('Counter Cubit'),
                  ],
                ),
              ),
            ),

            // Airthematic Cubit
            Card(
              child: InkWell(
                onTap: () {
                  context.read<DashboardCubit>().openAirthematicView(context);
                },
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.calculate, size: 48),
                    SizedBox(height: 8),
                    Text('Airthematic Cubit'),
                  ],
                ),
              ),
            ),

            // Student Cubit
            Card(
              child: InkWell(
                onTap: () {
                  context.read<DashboardCubit>().openStudentView(context);
                },
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person, size: 48),
                    SizedBox(height: 8),
                    Text('Student Cubit'),
                  ],
                ),
              ),
            ),

            Card(
              child: InkWell(
                onTap: () {
                  context.read<DashboardCubit>().openAirthematicView(context);
                },
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.calculate, size: 48),
                    SizedBox(height: 8),
                    Text('Airthematic Bloc View'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
