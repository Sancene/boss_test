// An example of validator with different error codes (they can also be done with enums to get messages later through localization)
class Validator {
  static String? addressValidator(String address) {
    if (address.length < 5) {
      return 'Address is too short';
    }
    if (address == 'qwerty') {
      return 'This address is unavailable';
    }
    if (address.length > 12) {
      return 'This address is too long';
    }
    return null;
  }
}
