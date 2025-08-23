class Usuario {
  final String nombre;
  final String apellido;
  final double salario;
  final double bono;

  const Usuario({
    required this.nombre,
    required this.apellido,
    required this.salario,
    required this.bono,
  });

  // Convierte dinámicos a double soportando num y String
  static double _toDouble(dynamic clave) {
    if (clave is num) return clave.toDouble();
    if (clave is String) {

      // por si el backend manda "1,200.50" ó "1200,50"
      final normalized = clave.replaceAll(',', '.');
      return double.tryParse(normalized) ?? 0.0;
    }
    return 0.0;
    }

  factory Usuario.fromJson(Map<String, dynamic> dato) {
    return Usuario(
      nombre: (dato['nombre'] ?? '').toString(),
      apellido: (dato['apellido'] ?? '').toString(),
      salario: _toDouble(dato['salario']),
      bono: _toDouble(dato['bono']),
    );
  }

  Map<String, dynamic> toJson() => {
    'nombre': nombre,
    'apellido': apellido,
    'salario': salario,
    'bono': bono,
  };

  @override
  String toString() =>
      'Usuario(nombre: $nombre, apellido: $apellido, salario: $salario, bono: $bono)';
}
