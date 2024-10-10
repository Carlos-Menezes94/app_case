import '../../domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({required super.email, required super.password});

  // Método para converter um JSON em LoginModel
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }

  // Método para converter o LoginModel em um JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginModel &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
