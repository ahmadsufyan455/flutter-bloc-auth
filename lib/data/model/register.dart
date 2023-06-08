class Register {
  bool? error;
  String? message;

  Register({this.error, this.message});

  Register.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
  }
}

class RegisterRequest {
  String? name;
  String? email;
  String? password;

  RegisterRequest({this.name, this.email, this.password});

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
