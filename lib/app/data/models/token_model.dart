import '../../domain/entities/token_entity.dart';

class TokenModel extends TokenEntity {
  TokenModel({required super.token});

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      token: json['token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TokenModel && other.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}
