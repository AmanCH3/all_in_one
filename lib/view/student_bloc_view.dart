import 'package:all_in_one/bloc/student_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/student_bloc.dart';
import '../cubit/student_cubit.dart';
import '../model/student_model.dart';
import '../state/student_state.dart';

class StudentBlocView extends StatefulWidget {
  const StudentBlocView({super.key});

  @override
  State<StudentBlocView> createState() => _StudentViewState();
}

class _StudentViewState extends State<StudentBlocView> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Student Cubit"))),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? 'Enter name'
                                  : null,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Age",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter age';
                        }
                        final age = int.tryParse(value);
                        if (age == null || age <= 0) {
                          return 'Enter a valid age';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: addressController,
                      decoration: InputDecoration(
                        labelText: "Address",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? 'Enter address'
                                  : null,
                    ),
                    const SizedBox(height: 40),
                    BlocBuilder<StudentCubit, StudentState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Student student = Student(
                                name: nameController.text,
                                age: int.parse(ageController.text),
                                address: addressController.text,
                              );
                              context.read<StudentBloc>().add(
                                addStudent(student),
                              );

                              nameController.clear();
                              ageController.clear();
                              addressController.clear();
                            }
                          },
                          child: const Text("Submit"),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              Expanded(
                child: BlocBuilder<StudentCubit, StudentState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state.lstStudent.isEmpty) {
                      return const Center(child: Text("No students found"));
                    } else {
                      return ListView.separated(
                        itemCount: state.lstStudent.length,
                        separatorBuilder: (_, __) => const Divider(),
                        itemBuilder: (context, index) {
                          final student = state.lstStudent[index];
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey.shade500),
                            ),
                            child: ListTile(
                              title: Text(student.name),
                              subtitle: Text(
                                '${student.age}, ${student.address}',
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("Delete?"),
                                        content: Text(
                                          "Are you sure you want to delete ${student.name}'s information?",
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              context
                                                  .read<StudentCubit>()
                                                  .deleteStudent(
                                                    index as Student,
                                                  );
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Yes"),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("No"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
