import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form/modelo/modelo.dart';
import 'package:form/services/api.dart';

part 'salario_state.dart';

class SalarioCubit extends Cubit<SalarioState> {
  final SalarioApi api;

  SalarioCubit(this.api) : super(SalarioInitial());

  Future<void> cargarSalario(Usuario usuario) async {
    try {
      emit(SalarioLoading());
      final total = await api.calcularSalario(usuario);
      emit(SalarioSuccess(usuario, total));
    } catch (e) {
      emit(SalarioFailure("Error obteniendo salario: $e"));
    }
  }

  void reset() => emit(SalarioInitial());
}
