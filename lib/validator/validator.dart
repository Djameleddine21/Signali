class Validator {
  ///email regular expression
  static RegExp _mailRegExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  ///phone regular expression
  static RegExp _phoneRegExp = RegExp(r"^(?:\+?)(?:[0-9] ?){6,14}[0-9]$");

  static RegExp _numberRegExp = RegExp(r'^[0-9]$');

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

  ///validate names input (first / last Name)
  static String validateString(String input) {
    if (input.isEmpty) {
      return "* Obligatoire";
    } else if (input.length < 3) {
      return "trop court";
    }
    return null;
  }

  ///validate phone numbers
  static String validatePhone(String phone) {
    if (phone.isEmpty) {
      return "* Obligatoire";
    } else if (!_phoneRegExp.hasMatch(phone)) {
      return "Non valide";
    }
    return null;
  }

  ///validate numbers only
  static String validateNumbers(String number) {
    if (number.isEmpty) {
      return "* Obligatoire";
    }
    return null;
  }
}
