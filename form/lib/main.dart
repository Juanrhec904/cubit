import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/formulario_bloc.dart';
import 'cubit/salario_cubit.dart';
import 'presentation/form_view.dart'; 
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => FormBloc()),
        BlocProvider(create: (_) => SalarioCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App con Bloc y Cubit',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const FormView(), 
      ),
    );
  }
}
