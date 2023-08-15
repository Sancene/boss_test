part of 'form_bloc.dart';

@Freezed()
class BossFormState with _$BossFormState {
  const BossFormState._();

  const factory BossFormState.idle({
    required bool firstAddressValid,
    required bool firstAddressProcessing,
    required bool secondAddressValid,
    required bool secondAddressProcessing,
  }) = _IdleState;

  const factory BossFormState.submitting({
    required bool firstAddressValid,
    required bool firstAddressProcessing,
    required bool secondAddressValid,
    required bool secondAddressProcessing,
  }) = _SubmittingState;

  const factory BossFormState.success({
    required bool firstAddressValid,
    required bool firstAddressProcessing,
    required bool secondAddressValid,
    required bool secondAddressProcessing,
  }) = _SuccessState;

  const factory BossFormState.failure({
    required bool firstAddressValid,
    required bool firstAddressProcessing,
    required bool secondAddressValid,
    required bool secondAddressProcessing,
  }) = _FailureState;
}
