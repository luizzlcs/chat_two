import 'dart:io';

enum AuthMode { Login, Signup }

class AuthFormData {
  String name = '';
  String email = '';
  String password = '';
  File? image;

  AuthMode _mode = AuthMode.Login;

  bool get isLogin {
    return _mode == AuthMode.Login;
  }

  bool get isSignup {
    return _mode == AuthMode.Signup;
  }

  void toggleAuthMode() {
    //       condicional ? valor se condicional for vdd: se cond for false
    //_mode = isLogin ? AuthMode.Signup : AuthMode.Login;

    if (isLogin) {
      _mode = AuthMode.Signup;
      return;
    }
    _mode = AuthMode.Login;
  }
}
