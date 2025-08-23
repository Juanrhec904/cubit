import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form/modelo/modelo.dart';

part 'Formulario_event.dart';
part 'Formulario_state.dart';

class FormBloc extends Bloc<FormEvent, FormularioState> {
  FormBloc() : super(FormularioInitial()) {
    on<Calcular_Salario>(_onCalcularSalario);
  }

  Future<void> _onCalcularSalario(
    Calcular_Salario event,
    Emitter<FormularioState> emit,
  ) async {
    
    try {
      // loading
      emit(FormularioLoading());

      // simular petición
      await Future.delayed(const Duration(seconds: 3));

      // datos del usuario desde el evento
      final usuario = Usuario(
        nombre: event.nombre,
        apellido: event.apellido,
        salario: event.salario,
        bono: event.bono,
      );

      // validación
      if (usuario.salario < 0 || usuario.bono < 0) {
        emit(const FormularioFailure('Los valores no pueden ser negativos'));
        return;
      }

      // cálculo
      final total = usuario.salario + usuario.bono;

      // success
      emit(FormularioSuccess(total));
    } catch (e) {
      emit(FormularioFailure('Ocurrió un error: $e'));
    }
  }
}
