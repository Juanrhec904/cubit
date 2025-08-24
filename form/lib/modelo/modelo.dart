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

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      nombre: json["nombre"],
      apellido: json["apellido"],
      salario: json["salario"],
      bono: json["bono"],
    );
  }
}
