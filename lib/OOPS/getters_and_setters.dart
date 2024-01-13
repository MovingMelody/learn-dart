// ignore_for_file: avoid_setters_without_getters, unnecessary_raw_strings, use_late_for_private_fields_and_variables

/*
* Created on 23 September 2023
* 
* @author Sai Sumanth
*/

/*

~~~~~~~~~ 🧢 GETTERS & SETTERS IN DART 🧢 ~~~~~~~~

In dart, getters and setters are the specials methods used to access and modify the private fields

They are useful for controlling and encapsulating access to class fields,
which helps maintain data integrity, implement validation logic.

[Encapsulation]: Getters and setters can help you to encapsulate your class fields, 
which means that they can only be accessed and modified through the getters and setters.

*/

///
/// class [PasswordManager]
///
class PasswordManager {
  /// Private variables for storing the encrypted password and password strength status.
  String? _encryptedPassword;
  bool _isPasswordStrongEnough = false;

  /// Password Getter
  String get getPassword {
    try {
      return _encryptedPassword!.split('.').first;
    } catch (e) {
      /// If an error occurs, log the error and throw a FormatException.
      print('Error occurred while accessing password $e');
      throw const FormatException(
          'Set password for your account before accessing');
    }
  }

  /// getter with return type [bool]
  bool get isStrongPassword => _isPasswordStrongEnough;

  /// Password Setter
  set setPassword(String newPassword) {
    if (newPassword.length >= 5) {
      /// encrypting given password
      _encryptedPassword = '$newPassword.sha256';

      /// Update the password strength status.
      updatePasswordStrengthStatus(pass: newPassword);
    } else {
      throw ArgumentError('Password length should be atlease 5 characters');
    }
  }

  void updatePasswordStrengthStatus({required String pass}) {
    print('updating password status');

    /// password should contain atleast one numeric value to be a strong password
    _isPasswordStrongEnough = pass.contains(RegExp(r'[0-9]'));

    try {
      dynamic foo = true;
      foo = 100;
      foo = _isPasswordStrongEnough;
      print(foo++); // Runtime Error
    } catch (e) {
      print(
          'updatePasswordStrengthStatus() partially handled ${e.runtimeType}.');
      rethrow; // Allow callers to see the exception.
    }
  }
}

/// 🏁 Entry Point
void main(List<String> args) {
  /// create instance
  final passManager = PasswordManager();
  try {
    /// trying to access password before setting, throws [FormatException]
    print(passManager.getPassword);
  } catch (e) {
    print(e); // FormatException: Set password for your account before accessing
  }

  try {
    passManager.setPassword = '123StrongDeveloper';
  } catch (e) {
    print(e);
  }
  print(passManager.getPassword); // 123StrongDeveloper
  print(passManager.isStrongPassword); // true

  try {
    passManager.setPassword = 'WeakPassword';
  } catch (e) {
    print(e);
  }
  print(passManager.getPassword); // WeakPassword
  print(passManager.isStrongPassword); // false
}
