import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_bloc.freezed.dart';

part 'form_event.dart';

part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, BossFormState> {
  FormBloc()
      : super(
          const BossFormState.idle(
            firstAddressProcessing: false,
            firstAddressValid: false,
            secondAddressProcessing: false,
            secondAddressValid: false,
          ),
        ) {
    on<_ValidateFirstAddressEvent>(_onFirstAddressValidation, transformer: restartable());
    on<_FirstAddressChangedEvent>(_onFirstAddressChanged, transformer: restartable());
    on<_SecondAddressChangedEvent>(_onSecondAddressChanged, transformer: restartable());
    on<_ValidateSecondAddressEvent>(_onSecondAddressValidation, transformer: restartable());
    on<_SubmitEvent>(_onSubmit);
  }

  Future<void> _onSubmit(_SubmitEvent event, Emitter<BossFormState> emit) async {
    emit(
      BossFormState.submitting(
        firstAddressProcessing: state.firstAddressProcessing,
        firstAddressValid: state.firstAddressValid,
        secondAddressProcessing: state.secondAddressProcessing,
        secondAddressValid: state.secondAddressValid,
      ),
    );
    await Future.delayed(const Duration(seconds: 1));
    final rand = Random().nextBool();
    if (rand) {
      emit(
        BossFormState.success(
          firstAddressProcessing: state.firstAddressProcessing,
          firstAddressValid: state.firstAddressValid,
          secondAddressProcessing: state.secondAddressProcessing,
          secondAddressValid: state.secondAddressValid,
        ),
      );
    } else {
      emit(
        BossFormState.failure(
          firstAddressProcessing: state.firstAddressProcessing,
          firstAddressValid: state.firstAddressValid,
          secondAddressProcessing: state.secondAddressProcessing,
          secondAddressValid: state.secondAddressValid,
        ),
      );
    }
  }

  Future<void> _onFirstAddressChanged(_FirstAddressChangedEvent event, Emitter<BossFormState> emit) async {
    emit(
      BossFormState.idle(
        firstAddressProcessing: state.firstAddressProcessing,
        firstAddressValid: false,
        secondAddressProcessing: state.secondAddressProcessing,
        secondAddressValid: state.secondAddressValid,
      ),
    );
  }

  Future<void> _onSecondAddressChanged(_SecondAddressChangedEvent event, Emitter<BossFormState> emit) async {
    emit(
      BossFormState.idle(
        firstAddressProcessing: state.firstAddressProcessing,
        firstAddressValid: state.firstAddressValid,
        secondAddressProcessing: state.secondAddressProcessing,
        secondAddressValid: false,
      ),
    );
  }

  Future<void> _onSecondAddressValidation(_ValidateSecondAddressEvent event, Emitter<BossFormState> emit) async {
    emit(
      BossFormState.idle(
        firstAddressProcessing: state.firstAddressProcessing,
        firstAddressValid: state.firstAddressValid,
        secondAddressProcessing: true,
        secondAddressValid: state.secondAddressValid,
      ),
    );
    await Future.delayed(const Duration(milliseconds: 500));
    //Какая то логика проверки с бека
    if (event.address != 'address2') {
      emit(
        BossFormState.idle(
          secondAddressProcessing: false,
          secondAddressValid: false,
          firstAddressProcessing: state.firstAddressProcessing,
          firstAddressValid: state.firstAddressValid,
        ),
      );
      return;
    }
    emit(
      BossFormState.idle(
        secondAddressProcessing: false,
        secondAddressValid: true,
        firstAddressProcessing: state.firstAddressProcessing,
        firstAddressValid: state.firstAddressValid,
      ),
    );
  }

  Future<void> _onFirstAddressValidation(_ValidateFirstAddressEvent event, Emitter<BossFormState> emit) async {
    emit(
      BossFormState.idle(
        firstAddressProcessing: true,
        firstAddressValid: state.firstAddressValid,
        secondAddressProcessing: state.secondAddressProcessing,
        secondAddressValid: state.secondAddressValid,
      ),
    );
    await Future.delayed(const Duration(milliseconds: 500));
    //Какая то логика проверки с бека
    if (event.address != 'qwerty123') {
      emit(
        BossFormState.idle(
          firstAddressProcessing: false,
          firstAddressValid: false,
          secondAddressProcessing: state.secondAddressProcessing,
          secondAddressValid: state.secondAddressValid,
        ),
      );
      return;
    }
    emit(
      BossFormState.idle(
        firstAddressProcessing: false,
        firstAddressValid: true,
        secondAddressProcessing: state.secondAddressProcessing,
        secondAddressValid: state.secondAddressValid,
      ),
    );
  }
}
