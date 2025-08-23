part of 'Formulario_bloc.dart';

sealed class FormState extends Equatable {
  const FormState();

  @override
  List<Object?> get props => [];
}

final class FormInitial extends FormState {}

final class FormSuccess extends FormState {
  final double total;
  const FormSuccess(this.total);

  @override
  List<Object?> get props => [total];
}

final class FormLoading extends FormState {
  const FormLoading();
}

final class FormFailure extends FormState {
  final String error;
  const FormFailure(this.error);

  @override
  List<Object?> get props => [error];
}
