import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form/bloc/formulario_bloc.dart';
import 'package:form/modelo/modelo.dart';
import 'package:meta/meta.dart';

part 'formulario_event.dart';
part 'formulario_state.dart';

class FormularioBloc extends Bloc<FormularioEvent, FormularioState> {
  FormularioBloc() : super(FormularioInitial()) {
    on<ResetFormulario>((event, emit) {
      emit(FormularioInitial());
    });

    void _onCalcularSalario(
      CalcularSalario event,
      Emitter<FormularioState> emit,
    ) {
      try {
        emit(FormularioLoading());

        final usuario = Usuario(
          nombre: event.nombre,
          apellido: event.apellido,
          salario: event.salario,
          bono: event.bono,
        );

        final total = usuario.salario + usuario.bono;

        emit(FormularioSuccess(usuario, total));
      } catch (e) {
        emit(FormularioFailure("Error al calcular salario: $e"));
      }
    }
  }
}
