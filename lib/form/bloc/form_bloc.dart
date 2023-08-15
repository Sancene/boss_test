import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_bloc.freezed.dart';
part 'form_event.dart';
part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FormState> {
  FormBloc() : super(const FormState.idle()) {
    on<_Started>(_onStarted);
  }

  void _onStarted(_Started event, Emitter<FormState> emit) {}
}
