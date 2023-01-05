
String? emailValidation(String? x) {
  if (x == null || x.isEmpty) {
    return "Email is required";
  }

  if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(x)) {
    return "Enter a valid email address";
  }
  return null;
}


String? passwordValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is Required';
  }
  if (value.length < 6) {
    return 'Password Must be greater than 6 characters';
  }
  return null;
}

String? generalValidation(String? value, {String fieldName = 'Field'}) {
  if (value == null || value.isEmpty) {
    return '$fieldName is Required';
  }
  return null;
}
