import 'package:all_in_one/bloc/arithematic_bloc.dart';
import 'package:all_in_one/bloc/arithematic_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AirthematicBlocView extends StatelessWidget {
  const AirthematicBlocView({super.key});

  @override
  Widget build(BuildContext context) {
    final firstContoller = TextEditingController();
    final secondController = TextEditingController();
    // final _formKey = GlobalKey<FormState>() ;

    return Scaffold(
      appBar: AppBar(title: Text("Arithematic Bloc")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: firstContoller,
                decoration: InputDecoration(labelText: "First number"),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: secondController,
                decoration: InputDecoration(labelText: "Second number"),
              ),
              SizedBox(height: 20),
              BlocBuilder<ArithematicBloc, int>(
                builder: (context, state) {
                  return Text(
                    '$state',
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // context.read<AirthematicCubit>().add(int.parse(firstContoller.text), int.parse(secondController.text)) ;
                  final first = int.parse(firstContoller.text);
                  final second = int.parse(secondController.text);
                  context.read<ArithematicBloc>().add(AddEvent(first, second));
                },
                child: Text("Add"),
              ),

              // ElevatedButton(
              //   onPressed: () {
              //     // context.read<AirthematicCubit>().div(int.parse(firstContoller.text), int.parse(secondController.text)) ;
              //     final first = int.parse(firstContoller.text);
              //     final second = int.parse(secondController.text);
              //     context.read<ArithematicBloc>().add(SubEvent(first, second));
              //   },
              //   child: Text("Divison"),
              // ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  // context.read<AirthematicCubit>().mul(int.parse(firstContoller.text), int.parse(secondController.text)) ;
                  final first = int.parse(firstContoller.text);
                  final second = int.parse(secondController.text);
                  context.read<ArithematicBloc>().add(
                    MultiplyEvent(first, second),
                  );
                },
                child: Text("Multiply"),
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  // context.read<AirthematicCubit>().sub(int.parse(firstContoller.text), int.parse(secondController.text)) ;

                  final first = int.parse(firstContoller.text);
                  final second = int.parse(secondController.text);
                  context.read<ArithematicBloc>().add(SubEvent(first, second));
                },
                child: Text("Subtact"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
