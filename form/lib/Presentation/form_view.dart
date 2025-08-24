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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Formulario")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<FormularioBloc, FormularioState>(
          listener: (context, state) {
            if (state is FormularioFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }

            if (state is FormularioSuccess) {
              context
                  .read<SalarioCubit>()
                  .cargarSalario(state.usuario, state.total);
            }
          },
          builder: (context, state) {
            if (state is FormularioLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is FormularioSuccess) {
              return BlocBuilder<SalarioCubit, SalarioState>(
                builder: (context, salarioState) {
                  if (salarioState is SalarioLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (salarioState is SalarioSuccess) {
                    return SalarioView(
                      usuario: salarioState.usuario,
                      total: salarioState.total,
                    );
                  }
                  return const SizedBox();
                },
              );
            }

            // Estado inicial con el formulario
            return _formularioWidget();
          },
        ),
      ),
    );
  }

  Widget _formularioWidget() {
    return SingleChildScrollView(
      child: Column(
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
              context.read<FormularioBloc>().add(
                    CalcularSalario(
                      nombre: _nombreController.text,
                      apellido: _apellidoController.text,
                      salario:
                          double.tryParse(_salarioController.text) ?? 0,
                      bono: double.tryParse(_bonoController.text) ?? 0,
                    ),
                  );
            },
            child: const Text("Calcular"),
          ),
        ],
      ),
    );
  }
}
