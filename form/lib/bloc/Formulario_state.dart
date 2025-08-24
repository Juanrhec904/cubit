part of 'formulario_bloc.dart';

import 'package:form/modelo/modelo.dart';

sealed class FormularioState extends Equatable {
  const FormularioState();

  @override
  List<Object?> get props => [];
}

final class FormularioInitial extends FormularioState {}

final class FormularioLoading extends FormularioState {}

final class FormularioSuccess extends FormularioState {
  final Usuario usuario;
  final double total;
  const FormularioSuccess(this.usuario,this.total);

  @override
  List<Object?> get props => [total];
}

final class FormularioFailure extends FormularioState {
  final String error;
  const FormularioFailure(this.error);

  @override
  List<Object?> get props => [error];
}
