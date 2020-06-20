class Validator {
  static RegExp _mailRegExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  /// validate email input
  static String validateEmail(String email) {
    if (email.isEmpty) {
      return "* Obligatoire";
    } else if (!_mailRegExp.hasMatch(email)) {
      return "Email n'est pas validé";
    }
    return null;
  }

  ///validate password input
  static String validatePassword(String password) {
    if (password.isEmpty) {
      return "* Obligatoire";
    } else if (password.length < 6) {
      return "Mot de passe trop court";
    }
    return null;
  }
}
