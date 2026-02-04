class TotpEntity {
  TotpEntity({
    required this.dateTime,
    this.formattedDateTime = '',
    required this.otp,
  });

  final DateTime dateTime;
  final String formattedDateTime;
  final String otp;
}
