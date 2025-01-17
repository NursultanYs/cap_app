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
      return null;
    };
  }
}


