class AuthExceptions implements Exception {}

class UserNotFoundAuthException implements AuthExceptions {
  @override
  String toString() {
    return "Incorrect Email or Password";
  }
}

class EmailAlreadyInUseAuthException implements AuthExceptions {
  @override
  String toString() {
    return "Email Already exists";
  }
}

class WeakPasswordAuthException implements AuthExceptions {
  @override
  String toString() {
    return "Weak password, it needs to have capital and small letters and numbers";
  }
}

class InvalidEmailAuthException implements AuthExceptions {
  @override
  String toString() {
    return "Invalid Email format";
  }
}

class ChannelNotFoundAuthException implements AuthExceptions {
  @override
  String toString() {
    return "Please fill in Password and Email";
  }
}

class GenericAuthException implements AuthExceptions {
  @override
  String toString() {
    return "Something went wrong";
  }
}

class UserNotLoggedInAuthException implements AuthExceptions {
  @override
  String toString() {
    return "User not logged in";
  }
}

class InternetConnectionAuthException implements AuthExceptions {
  @override
  String toString() {
    return "Please check internet connection";
  }
}
