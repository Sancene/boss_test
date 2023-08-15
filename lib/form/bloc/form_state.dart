part of 'form_bloc.dart';

@Freezed()
class BossFormState with _$BossFormState {
  const BossFormState._();

  const factory BossFormState.idle({required bool addressValid}) = _IdleState;

  const factory BossFormState.submitting({required bool addressValid}) = _SubmittingState;

  const factory BossFormState.processingAddress({required bool addressValid}) = _ProcessingAddressState;

  const factory BossFormState.success({required bool addressValid}) = _SuccessState;

  const factory BossFormState.failure({required bool addressValid}) = _FailureState;
}
