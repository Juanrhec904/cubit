import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'salario_state.dart';

class SalarioCubit extends Cubit<SalarioState> {
  SalarioCubit() : super(SalarioInitial());
}
