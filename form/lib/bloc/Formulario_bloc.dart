import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form/modelo/modelo.dart';
import 'package:form/services/api.dart'; 
part 'formulario_event.dart';
part 'formulario_state.dart';

class FormularioBloc extends Bloc<FormularioEvent, FormularioState> {
  final SalarioService  _service = SalarioService();

  FormularioBloc() : super(FormularioInitial()) {
    // Evento para calcular salario consultando la API
    on<CalcularSalario>((event, emit) async {
      emit(FormularioLoading());
      await Future.delayed(const Duration(seconds: 1));

      try {
        final total = await _service.obtenerSalario(
          event.nombre,
          event.apellido,
        );

        if (total == null) {
          emit(FormularioFailure("❌ Usuario no encontrado en la base de datos"));
        } else {
          // creamos el usuario para mostrarlo en el success
          final usuario = Usuario(
            nombre: event.nombre,
            apellido: event.apellido,
            salario: total, 
            bono: 0,
          );

          emit(FormularioSuccess(usuario));
        }
      } catch (e) {
        emit(FormularioFailure("⚠️ Error"));
      }
    });

    // Evento para resetear el formulario
    on<ResetFormulario>((event, emit) async {
      emit(FormularioLoading());
      await Future.delayed(const Duration(seconds: 1));
      emit(FormularioInitial());
    });
  }
}
