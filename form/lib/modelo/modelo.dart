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
  Map<String, dynamic> toJson() => {
    'nombre': nombre,
    'apellido': apellido,
    'salario': salario,
    'bono': bono,
  };
}
