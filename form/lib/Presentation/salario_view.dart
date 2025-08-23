import 'package:flutter/material.dart';

class SalarioView extends StatelessWidget {
  const SalarioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Salario"),
      ),
      body: const Center(
        child: Text("Aquí va la lógica del salario con Cubit"),
      ),
    );
  }
}

