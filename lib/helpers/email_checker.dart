class EmailChecker {
  static bool isNotValid(String email) {
    return !RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static bool checkIfEmailNull(String? email) {
    return email!.isEmpty;
  }

  static bool checkIfPassNull(String? pass) {
    return pass!.isEmpty;
  }

  static String checkIfIsUsername(String? email) {
    String? usr;
    if (isNotValid(email!) && email.length >= 6) {
      usr = "username";
    } else if (email.length <= 5) {
      usr = "short";
    } else {
      usr = "email";
    }
    return usr;
  }
}
