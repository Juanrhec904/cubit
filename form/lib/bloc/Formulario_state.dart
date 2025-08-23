part of 'Formulario_bloc.dart';

sealed class FormularioState extends Equatable {
  const FormularioState();

  @override
  List<Object?> get props => [];
}

final class FormularioInitial extends FormularioState {}

final class FormularioSuccess extends FormularioState {
  final double total;
  const FormularioSuccess(this.total);

  @override
  List<Object?> get props => [total];
}

final class FormularioLoading extends FormularioState {
  const FormularioLoading();
}

final class FormularioFailure extends FormularioState {
  final String error;
  const FormularioFailure(this.error);

  @override
  List<Object?> get props => [error];
}
