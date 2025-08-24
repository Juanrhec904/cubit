import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:form/modelo/modelo.dart';

class SalarioApi {
  final String baseUrl;
  SalarioApi(this.baseUrl);

  Future<double> calcularSalario(Usuario usuario) async {
    final url = Uri.parse("$baseUrl/salario");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(usuario.toJson()),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data["total"] as num).toDouble();
    } else {
      throw Exception("Error en la API: ${response.statusCode}");
    }
  }
}
