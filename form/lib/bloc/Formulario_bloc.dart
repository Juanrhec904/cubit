import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form/modelo/modelo.dart';

part 'formulario_event.dart';
part 'formulario_state.dart';

class FormularioBloc extends Bloc<FormularioEvent, FormularioState> {
  FormularioBloc() : super(FormularioInitial()) {
    on<CalcularSalario>((event, emit) async {
      emit(FormularioLoading());
      await Future.delayed(const Duration(seconds: 1));

      if (event.salario <= 0) {
        emit(FormularioFailure("El salario debe ser mayor a 0"));
      } else {
        final usuario = Usuario(
          nombre: event.nombre,
          apellido: event.apellido,
          salario: event.salario,
          bono: event.bono,
        );

        final total = event.salario + event.bono; 

        emit(FormularioSuccess(usuario, total)); 
      }
    });

    on<ResetFormulario>((event, emit) async {
      emit(FormularioLoading());
      await Future.delayed(const Duration(seconds: 1)); // ⏳ loading antes de resetear
      emit(FormularioInitial());
    });
  }
}
