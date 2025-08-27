import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:form/modelo/modelo.dart';

class SalarioService {
  final String baseUrl =
      "https://mocki.io/v1/85f90582-8563-4c42-911d-1865e5f3ed9c";

  Future<double?> obtenerSalario(String nombre, String apellido) async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      try {
        final usuario = data.firstWhere(
          (u) => u["nombre"] == nombre && u["apellido"] == apellido,
        );
        final salario = (usuario["salario"] as num).toDouble();
        final bono = (usuario["bono"] as num).toDouble();

        return salario + bono;
      } catch (e) {
        return null;
      }
    } else {
      throw Exception("Error en la API: ${response.statusCode}");
    }
  }
}
