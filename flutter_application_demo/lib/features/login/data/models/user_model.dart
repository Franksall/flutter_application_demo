import 'package:flutter_application_demo/features/login/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.documentNumber,
    required super.documentType,
    required super.name,
    required super.token,
    super.requiresFacialVerification = false,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      documentNumber: json['documentNumber'] as String,
      documentType: json['documentType'] as String,
      name: json['name'] as String,
      token: json['token'] as String,
      requiresFacialVerification:
          json['requiresFacialVerification'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'documentNumber': documentNumber,
      'documentType': documentType,
      'name': name,
      'token': token,
      'requiresFacialVerification': requiresFacialVerification,
    };
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      documentNumber: entity.documentNumber,
      documentType: entity.documentType,
      name: entity.name,
      token: entity.token,
      requiresFacialVerification: entity.requiresFacialVerification,
    );
  }
}
