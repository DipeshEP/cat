import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndzdogapi/src/cubit/dog_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DogCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final _cubit = DogCubit();

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: BlocBuilder<DogCubit, DogState>(
        bloc: _cubit,
        builder: (context, state) {

         if(state is DogLoading){
           return CircularProgressIndicator();
         }

         else if(state is DogError){
           return Icon(Icons.error);
         }

         else if(state is DogLoaded){
           return Column(

             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Image.network(state.data),
               Text(state.data1)
             ],
           );
         }


         else{
           return Container();
         }
        },
      ),
    );
  }
}
