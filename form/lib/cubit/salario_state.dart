part of 'salario_cubit.dart';

sealed class SalarioState extends Equatable {
  const SalarioState();

  @override
  List<Object> get props => [];
}

final class SalarioInitial extends SalarioState {}
