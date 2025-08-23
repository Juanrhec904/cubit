part of 'Formulario_bloc.dart';

sealed class FormEvent extends Equatable {
  const FormEvent();

  @override
  List<Object> get props => [];
}

//Evento para calcular el salario
final class Calcular_Salario extends FormEvent {
  final String nombre;
  final String apellido;
  final double salario;
  final double bono;
  Calcular_Salario({
    required this.nombre,
    required this.apellido,
    required this.salario,
    required this.bono,
  });
}
