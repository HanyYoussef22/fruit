class AppRegex {
  static bool isEmailValid(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);
  }

  static bool isPasswordValid( password) {
    return RegExp(
        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
        .hasMatch(password);
  }
  static bool isNameValid(String name) {
    final namePattern = r"^[a-zA-Z\u0600-\u06FF]+(?: [a-zA-Z\u0600-\u06FF-]+)*$";
    return RegExp(namePattern).hasMatch(name) && name.length >= 2 && name.length <= 50;
  }
  static bool isNumberValid(String number) {
    final numberPattern = r"^\d+$";  // يسمح فقط بالأرقام
    return RegExp(numberPattern).hasMatch(number) && number.length >= 2 && number.length <= 10;
  }
  static bool isDescriptionValid(String description) {
    final descriptionPattern = r"^[a-zA-Z\u0600-\u06FF0-9 .,!?()-]+$";
    return RegExp(descriptionPattern).hasMatch(description) && description.length >= 5 && description.length <= 200;
  }


  static bool isPhoneNumberValid(String phoneNumber) {
    return RegExp(r'^(010|011|012|015)[0-9]{8}$').hasMatch(phoneNumber);
  }

  static bool hasLowerCase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return RegExp(r'^(?=.*?[#?!@$%^&*-])').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return RegExp(r'^(?=.{8,})').hasMatch(password);
  }
  static bool isPasswordMatch(String password, String confirmPassword) {
    return password == confirmPassword;
  }
}
