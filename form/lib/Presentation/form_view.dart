import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/Formulario_bloc.dart';

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
    // metodo para controlador de texto
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
        child: BlocConsumer<FormBloc, FormularioState>(
          listener: (context, state) {
            if (state is FormularioFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            if (state is FormularioLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is FormularioSuccess) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "✅ Cálculo exitoso",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Total: ${state.total.toStringAsFixed(2)}",
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Reinicia el formulario volviendo al estado inicial
                        context.read<FormBloc>().emit(FormularioInitial());
                      },
                      child: const Text("Nuevo cálculo"),
                    ),
                  ],
                ),
              );
            }

            // Estado inicial con el formulario
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
                      // Se dispara el evento
                      context.read<FormBloc>().add(
                            Calcular_Salario(
                              nombre: _nombreController.text,
                              apellido: _apellidoController.text,
                              salario:
                                  double.tryParse(_salarioController.text) ?? 0,
                              bono:
                                  double.tryParse(_bonoController.text) ?? 0,
                            ),
                          );
                    },
                    child: const Text("Calcular"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
