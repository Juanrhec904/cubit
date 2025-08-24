part of 'formulario_bloc.dart';

sealed class FormularioEvent extends Equatable {
  const FormularioEvent();

  @override
  List<Object?> get props => [];
}

class CalcularSalario extends FormularioEvent {
  final String nombre;
  final String apellido;
  final double salario;
  final double bono;

  const CalcularSalario({
    required this.nombre,
    required this.apellido,
    required this.salario,
    required this.bono,
  });

  @override
  List<Object?> get props => [nombre, apellido, salario, bono];
}
