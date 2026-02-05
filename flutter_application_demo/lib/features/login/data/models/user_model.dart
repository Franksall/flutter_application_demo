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
      //ID: Si viene nulo, ponemos '1'
      id: json['id']?.toString() ?? '1',
      //NUMERO: Buscamos 'documentNumber' O 'numDocumento'
      documentNumber:
          json['documentNumber']?.toString() ??
          json['numDocumento']?.toString() ??
          '',
      //TIPO: Buscamos 'documentType' O 'codDocumento'
      documentType:
          json['documentType']?.toString() ??
          json['codDocumento']?.toString() ??
          '',
      //NOMBRE: Si viene nulo, ponemos 'Usuario'
      name: json['name']?.toString() ?? 'Usuario OH',
      //  TOKEN: si falta, ponemos uno falso para que no explote.
      token: json['token']?.toString() ?? 'token-simulado-123',
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
