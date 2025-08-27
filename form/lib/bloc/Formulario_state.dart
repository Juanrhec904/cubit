part of 'formulario_bloc.dart';

abstract class FormularioState extends Equatable {
  const FormularioState();

  @override
  List<Object?> get props => [];
}

class FormularioInitial extends FormularioState {}

class FormularioLoading extends FormularioState {}

class FormularioSuccess extends FormularioState {
  final Usuario usuario;

  const FormularioSuccess(this.usuario);

  @override
  List<Object?> get props => [usuario];
}

class FormularioFailure extends FormularioState {
  final String mensaje;

  const FormularioFailure(this.mensaje);

  @override
  List<Object?> get props => [mensaje];
}
