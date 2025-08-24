import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form/bloc/formulario_bloc.dart';
import 'package:form/cubit/salario_cubit.dart';
import 'package:form/Presentation/salario_view.dart';

class FormView extends StatefulWidget {
  const FormView({super.key});

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _salarioController = TextEditingController();
  final _bonoController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _apellidoController.dispose();
    _salarioController.dispose();
    _bonoController.dispose();
    super.dispose();
  }

  // 👉 Widget del formulario
  Widget _formularioWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _nombreController,
          decoration: const InputDecoration(labelText: "Nombre"),
        ),
        TextField(
          controller: _apellidoController,
          decoration: const InputDecoration(labelText: "Apellido"),
        ),
        TextField(
          controller: _salarioController,
          decoration: const InputDecoration(labelText: "Salario"),
          keyboardType: TextInputType.number,
        ),
        TextField(
          controller: _bonoController,
          decoration: const InputDecoration(labelText: "Bono"),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            final nombre = _nombreController.text;
            final apellido = _apellidoController.text;
            final salario = double.tryParse(_salarioController.text) ?? 0;
            final bono = double.tryParse(_bonoController.text) ?? 0;

            // 👉 dispara el evento al BLoC
            context.read<FormularioBloc>().add(
                  CalcularSalario(
                    nombre: nombre,
                    apellido: apellido,
                    salario: salario,
                    bono: bono,
                  ),
                );
          },
          child: const Text("Calcular"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bloc y Cubit")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 👉 Parte superior: Formulario
            Expanded(
              flex: 1,
              child: BlocConsumer<FormularioBloc, FormularioState>(
                listener: (context, state) {
                  if (state is FormularioFailure) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.error)));
                  }

                  if (state is FormularioSuccess) {
                    // cuando el formulario se llena con éxito → dispara el cálculo del salario
                    context.read<SalarioCubit>().cargarSalario(state.usuario);
                  }
                },
                builder: (context, state) {
                  if (state is FormularioLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  // estado inicial o cuando hay error → mostramos formulario
                  return _formularioWidget();
                },
              ),
            ),

            const Divider(),

            // 👉 Parte inferior: Resultado del salario
            Expanded(
              flex: 1,
              child: BlocBuilder<SalarioCubit, SalarioState>(
                builder: (context, salarioState) {
                  if (salarioState is SalarioLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (salarioState is SalarioSuccess) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SalarioView(
                          usuario: salarioState.usuario,
                          total: salarioState.total,
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  } else if (salarioState is SalarioFailure) {
                    return Center(child: Text(salarioState.error));
                  }
                  return const Center(child: Text("Ingrese los datos arriba"));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
