part of 'Formulario_bloc.dart';

sealed class FormEvent extends Equatable {
  const FormEvent();

  @override
  List<Object?> get props => [];
}

final class Calcular_Salario extends FormEvent {
  final String nombre;
  final String apellido;
  final double salario;
  final double bono;

  const Calcular_Salario({
    required this.nombre,
    required this.apellido,
    required this.salario,
    required this.bono,
  });

  @override
  List<Object?> get props => [nombre, apellido, salario, bono];
}
