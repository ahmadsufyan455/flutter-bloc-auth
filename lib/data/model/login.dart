class Login {
  bool? error;
  String? message;
  LoginResult? loginResult;

  Login({
    this.error,
    this.message,
    this.loginResult,
  });

  Login.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    loginResult = LoginResult.fromJson(json['loginResult']);
  }
}

class LoginResult {
  String? userId;
  String? name;
  String? token;

  LoginResult({this.userId, this.name, this.token});

  LoginResult.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    token = json['token'];
  }
}

class LoginRequest {
  String? email;
  String? password;

  LoginRequest({this.email, this.password});

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
