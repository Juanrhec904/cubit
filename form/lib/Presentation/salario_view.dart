import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form/bloc/formulario_bloc.dart';
import 'package:form/cubit/salario_cubit.dart';
import 'package:form/modelo/modelo.dart';

class SalarioView extends StatelessWidget {
  final Usuario usuario;
  final double total;

  const SalarioView({
    super.key,
    required this.usuario,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("👤 ${usuario.nombre} ${usuario.apellido}",
            style: const TextStyle(fontSize: 20)),
        const SizedBox(height: 10),
        Text("💰 Salario: ${usuario.salario.toStringAsFixed(2)}"),
        Text("🎁 Bono: ${usuario.bono.toStringAsFixed(2)}"),
        Text("✅ Total: $total",
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Reinicia el bloc enviando un nuevo evento
            context.read<FormularioBloc>().add(ResetFormulario());

            // Reinicia el cubit con un método
            context.read<SalarioCubit>().reset();
          },
          child: const Text("Nuevo cálculo"),
        ),
      ],
    );
  }
}
