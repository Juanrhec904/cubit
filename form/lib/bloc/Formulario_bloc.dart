import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form/bloc/formulario_bloc.dart';
import 'package:form/modelo/modelo.dart';
import 'package:meta/meta.dart';

part 'formulario_event.dart';
part 'formulario_state.dart';

class FormularioBloc extends Bloc<FormularioEvent, FormularioState> {
  FormularioBloc() : super(FormularioInitial()) {
    on<CalcularSalario>(_onCalcularSalario);
  }

  Future<void> _onCalcularSalario(
    CalcularSalario event,
    Emitter<FormularioState> emit,
  ) async {
    try {
      emit(FormularioLoading());

      await Future.delayed(const Duration(seconds: 2));

      final usuario = Usuario(
        nombre: event.nombre,
        apellido: event.apellido,
        salario: event.salario,
        bono: event.bono,
      );

      if (usuario.salario < 0 || usuario.bono < 0) {
        emit(FormularioFailure("Los valores no pueden ser negativos"));
        return;
      }

      final total = usuario.salario + usuario.bono;

      emit(FormularioSuccess(total));
    } catch (e) {
      emit(FormularioFailure("Ocurrió un error: $e"));
    }
  }
}
