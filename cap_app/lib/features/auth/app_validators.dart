abstract class AppValidators {
  String? Function(String?)? getValidator();
}

class EmailValidator implements AppValidators {
  @override
  String? Function(String?)? getValidator() {
    return (String? email) {
      if (email == null || email.isEmpty) {
        return 'Email cannot be empty';
      }
      final emailRegex =
          RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
      if (!emailRegex.hasMatch(email)) {
        return 'Invalid email format';
      }
      if (email.length > 25) {
        return "Email is too long";
      }
      return null;
    };
  }
}

class NameValidator implements AppValidators {
  @override
  String? Function(String?)? getValidator() {
    return (String? name) {
      if (name == null || name.isEmpty) {
        return "Name cannot be empty";
      }
      if (name.length > 25) {
        return "Name is too long";
      }
      return null;
    };
  }
}

class PasswordValidatr implements AppValidators {
  @override
  String? Function(String?)? getValidator() {
    return (String? pass) {
      if (pass == null || pass.isEmpty) {
        return "Password cannot be empty";
      }
      if (pass.length > 20) {
        return "Password is too long";
      }
      if (pass.length < 7) {
        return "Password is too short";
      }
      return null;
    };
  }
}
