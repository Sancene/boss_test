part of 'form_bloc.dart';

@Freezed(map: FreezedMapOptions.none)
class FormEvent with _$FormEvent {
  const factory FormEvent.validateAddress() = _ValidateAddressEvent;

  const factory FormEvent.submit() = _SubmitEvent;
}
