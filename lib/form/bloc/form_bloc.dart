import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_bloc.freezed.dart';
part 'form_event.dart';
part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, BossFormState> {
  FormBloc() : super(const BossFormState.idle(addressValid: false)) {
    on<_ValidateAddressEvent>(_onStarted);
  }

  Future<void> _onStarted(_ValidateAddressEvent event, Emitter<BossFormState> emit) async {
    emit(BossFormState.processingAddress(addressValid: state.addressValid));
    await Future.delayed(const Duration(milliseconds: 500));
    if (event.address.length < 5) {
      emit(const BossFormState.idle(addressValid: false));
      return;
    }
    emit(const BossFormState.idle(addressValid: true));
  }
}
