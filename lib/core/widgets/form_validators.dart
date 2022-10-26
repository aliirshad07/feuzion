String? nameValidator(String? value) {
  if (value!.isEmpty) {
    return "Please enter your name";
  }
  return null;
}

String? emailValidator(String? value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  if (value!.isEmpty) {
    return "Please enter a email";
  } else if (!regex.hasMatch(value)) {
    return 'Email format is invalid';
  }
  return null;
}

String? bdayValidator(String? value) {
  if (value!.isEmpty) {
    return "Please enter your name";
  }
  return null;
}

String? passwordValidator(String? value) {
  String pattern = r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}';
  RegExp regex = RegExp(pattern);
  if (value!.isEmpty) {
    return "Please enter a password";
  } else if (!regex.hasMatch(value)) {
    return 'Password must contain the following:\n8 to 16 characters\nA lowercase letter\nA uppercase letter\nA number';
  }
  return null;
}

String? cardValidator(String value) {
  // String pattern = r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}';
  // RegExp regex = RegExp(pattern);
  if (value.length < 16) {
    return "Please enter 16 Digit Card Number";
  }
  // } else if (!regex.hasMatch(value)) {
  //   return 'Password must contain the following:\n8 to 16 characters\nA lowercase letter\nA uppercase letter\nA number';
  // }
  return null;
}

String? cvvValidator(String value) {
  // String pattern = r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}';
  // RegExp regex = RegExp(pattern);
  if (value.length < 3) {
    return "Please enter 3 Digit ";
  }
  return null;
}

String? heightValidator(String? value) {
  // String pattern = r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}';
  // RegExp regex = RegExp(pattern);
  if (value!.isEmpty) {
    return "Please enter Height ";
  }
  return null;
}

String? ageValidator(String? value) {
  // String pattern = r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}';
  // RegExp regex = RegExp(pattern);
  if (value!.isEmpty) {
    return "Please enter Age ";
  }
  return null;
}

String? weightValidator(String? value) {
  // String pattern = r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}';
  // RegExp regex = RegExp(pattern);
  if (value!.isEmpty) {
    return "Please enter Wight ";
  }
  return null;
}

String? positionValidator(String? value) {
  if (value!.isEmpty) {
    return "Please enter player"
        "\nposition";
  }
  return null;
}

String? commentsValidator(String? value) {
  if (value!.isEmpty) {
    return "Comment is empty!";
  }
  if (value.length < 5) {
    return "Comment is too short!";
  }
  return null;
}
