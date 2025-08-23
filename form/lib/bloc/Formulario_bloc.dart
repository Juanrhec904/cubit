import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form/modelo/modelo.dart';
part 'Formulario_event.dart';
part 'Formulario_state.dart';

class FormBloc extends Bloc<FormEvent, FormState> {
  FormBloc() : super(FormInitial()) {

    // aquí registramos el evento
    on<Calcular_Salario>(_onCalcularSalario);
  }

  Future<void> _onCalcularSalario(
    Calcular_Salario event,
    Emitter<FormState> emit,
  ) async {
    try {
      // Mostramos loading
      emit(FormLoading());

      // Simulamos petición a backend con un delay
      await Future.delayed(const Duration(seconds: 3));

      // Creamos el usuario
      final usuario = Usuario(
        nombre: "Juan", // luego lo traerás del form
        apellido: "Perez",
        salario: event.salario,
        bono: event.bono,
      );

      // Validación simple
      if (usuario.salario < 0 || usuario.bono < 0) {
        emit(FormFailure("Los valores no pueden ser negativos"));
        return;
      }

      // suma del salario y bono
      final total = usuario.salario + usuario.bono;

      // Emitimos success
      emit(FormSuccess(total));
    } catch (e) {
      emit(FormFailure("Ocurrió un error: $e"));
    }
  }
}
