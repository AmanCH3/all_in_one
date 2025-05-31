import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/airthematic_cubit.dart';



class AirthematicView extends StatelessWidget {
  const AirthematicView({super.key});

  @override
  Widget build(BuildContext context) {
    final firstContoller = TextEditingController() ;
    final secondController = TextEditingController() ;
    final _formKey = GlobalKey<FormState>() ;

    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: firstContoller,
              decoration: InputDecoration(
                  labelText: "First number"
              ),

            ) ,
            SizedBox(height: 16,),
            TextFormField(
              controller: secondController,
              decoration: InputDecoration(
                  labelText: "Second number"
              ),
            ),
            SizedBox(height: 20,),
            BlocBuilder<AirthematicCubit , int>(builder: (context , state){
              return Text(
                '$state'  ,
                style: const TextStyle(
                    fontSize: 48 ,
                    fontWeight: FontWeight.bold
                ),

              ) ;
            }) ,
            ElevatedButton(onPressed: (){
              context.read<AirthematicCubit>().add(int.parse(firstContoller.text), int.parse(secondController.text)) ;


            }, child: Text("Add")) ,


            ElevatedButton(onPressed: (){
              context.read<AirthematicCubit>().div(int.parse(firstContoller.text), int.parse(secondController.text)) ;

            }, child: Text("Divison")) ,

            ElevatedButton(onPressed: (){
              context.read<AirthematicCubit>().mul(int.parse(firstContoller.text), int.parse(secondController.text)) ;

            }, child: Text("Multiply")) ,

            ElevatedButton(onPressed: (){
              context.read<AirthematicCubit>().sub(int.parse(firstContoller.text), int.parse(secondController.text)) ;


            }, child: Text("Subtact"))

          ],



        ),
      )
      ),

    ) ;
  }
}