part of 'form_bloc.dart';

@Freezed(map: FreezedMapOptions.none)
class FormEvent with _$FormEvent {
  const factory FormEvent.validateFirstAddress(String address) = _ValidateFirstAddressEvent;

  const factory FormEvent.firstAddressChanged() = _FirstAddressChangedEvent;

  const factory FormEvent.validateSecondAddress(String address) = _ValidateSecondAddressEvent;

  const factory FormEvent.secondAddressChanged() = _SecondAddressChangedEvent;

  const factory FormEvent.submit() = _SubmitEvent;
}
