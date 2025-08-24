import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:form/modelo/modelo.dart';

class SalarioApi {
  final String baseUrl = "https://jsonkeeper.com/b/6RMTG"; 

  Future<double> calcularSalario(Usuario usuario) async {
    final url = Uri.parse("$baseUrl/salario");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "nombre": usuario.nombre,
        "apellido": usuario.apellido,
        "salario": usuario.salario,
        "bono": usuario.bono,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data["total"] as num).toDouble(); // total viene de la API
    } else {
      throw Exception("Error en la API: ${response.statusCode}");
    }
  }
}