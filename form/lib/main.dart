import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/formulario_bloc.dart';
import 'cubit/salario_cubit.dart';
import 'Presentation/form_view.dart';
import 'services/api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final api = SalarioApi('https://jsonkeeper.com/b/6RMTG');
    
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FormularioBloc()),
        BlocProvider(create: (context) => SalarioCubit(api)),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FormView(),
      ),
    );
  }
}
