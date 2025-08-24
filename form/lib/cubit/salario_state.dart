part of 'salario_cubit.dart';

abstract class SalarioState extends Equatable {
  const SalarioState();

  @override
  List<Object?> get props => [];
}

class SalarioInitial extends SalarioState {}

class SalarioLoading extends SalarioState {}

class SalarioSuccess extends SalarioState {
  final Usuario usuario;
  final double total;

  const SalarioSuccess(this.usuario, this.total);

  @override
  List<Object?> get props => [usuario, total];
}

class SalarioFailure extends SalarioState {
  final String error;

  const SalarioFailure(this.error);

  @override
  List<Object?> get props => [error];
}
