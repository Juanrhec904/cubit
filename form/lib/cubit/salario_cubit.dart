import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form/modelo/modelo.dart';
import 'package:form/services/api.dart';

part 'salario_state.dart';

class SalarioCubit extends Cubit<SalarioState> {
  final SalarioService api;

  SalarioCubit(this.api) : super(SalarioInitial());

   Future<void> cargarSalario(Usuario usuario) async {
   try {
    emit(SalarioLoading());
    await Future.delayed(const Duration(seconds: 3));
    final total = usuario.salario + usuario.bono;

    emit(SalarioSuccess(usuario, total));
  } catch (e) {
    emit(SalarioFailure("Error calculando salario: $e"));
  }
}


  void reset() => emit(SalarioInitial());
}
