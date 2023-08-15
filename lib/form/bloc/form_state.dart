part of 'form_bloc.dart';

@Freezed()
class FormState with _$FormState {
  const FormState._();

  const factory FormState.idle({bool addressValid}) = _IdleState;

  const factory FormState.loading() = _LoadingState;

  const factory FormState.success() = _SuccessState;

  const factory FormState.failure() = _FailureState;
}
