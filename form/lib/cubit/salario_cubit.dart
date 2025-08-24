import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form/modelo/modelo.dart';

part 'salario_state.dart';

class SalarioCubit extends Cubit<SalarioState> {
  SalarioCubit() : super(SalarioInitial());

  void cargarSalario(Usuario usuario, double total) async {
    emit(SalarioLoading());
    await Future.delayed(const Duration(seconds: 3)); // Simulación
    emit(SalarioSuccess(usuario, total));
  }
  void reset()=> emit(SalarioInitial());
}

