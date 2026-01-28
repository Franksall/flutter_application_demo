import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String documentNumber;
  final String documentType;
  final String name;
  final String token;
  final bool requiresFacialVerification;

  const UserEntity({
    required this.id,
    required this.documentNumber,
    required this.documentType,
    required this.name,
    required this.token,
    this.requiresFacialVerification = false,
  });

  @override
  List<Object?> get props => [
        id,
        documentNumber,
        documentType,
        name,
        token,
        requiresFacialVerification,
      ];
}
