part of 'salario_cubit.dart';

sealed class SalarioState extends Equatable {
  const SalarioState();

  @override
  List<Object?> get props => [];
}

final class SalarioInitial extends SalarioState {}
final class SalarioLoading extends SalarioState {}

final class SalarioSuccess extends SalarioState {
  final Usuario usuario;
  final double total;

  const SalarioSuccess(this.usuario, this.total);

  @override
  List<Object?> get props => [usuario, total];
}

final class SalarioFailure extends SalarioState {
  final String error;
  const SalarioFailure(this.error);

  @override
  List<Object?> get props => [error];
}
