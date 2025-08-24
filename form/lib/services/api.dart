import 'dart:convert';
import 'package:http/http.dart' as http;

class SalarioService {
  final String baseUrl = "https://jsonkeeper.com/b/IZW4A";

  Future<double> obtenerSalario() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final saldo = (data["saldo"] as num).toDouble();
      final bono = (data["bono"] as num).toDouble();

      return saldo + bono;
    } else {
      throw Exception("Error en la API: ${response.statusCode}");
    }
  }
}
