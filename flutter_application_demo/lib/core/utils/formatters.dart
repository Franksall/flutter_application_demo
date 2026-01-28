import 'package:intl/intl.dart';

class Formatters {
  Formatters._();

  static String formatCurrency(double amount, {String currency = 'PEN'}) {
    final formatter = NumberFormat.currency(
      locale: 'es_PE',
      symbol: currency == 'PEN' ? 'S/ ' : '\$ ',
      decimalDigits: 2,
    );
    return formatter.format(amount);
  }

  static String formatDate(DateTime date) {
    final formatter = DateFormat('dd/MM/yyyy', 'es_PE');
    return formatter.format(date);
  }

  static String formatDateTime(DateTime dateTime) {
    final formatter = DateFormat('dd/MM/yyyy, HH:mm a.', 'es_PE');
    return formatter.format(dateTime);
  }

  static String formatTime(DateTime time) {
    final formatter = DateFormat('HH:mm a.', 'es_PE');
    return formatter.format(time);
  }

  static String formatAccountNumber(String accountNumber) {
    if (accountNumber.length <= 4) return accountNumber;

    final segments = <String>[];
    for (var i = 0; i < accountNumber.length; i += 3) {
      final end = (i + 3 < accountNumber.length) ? i + 3 : accountNumber.length;
      segments.add(accountNumber.substring(i, end));
    }
    return segments.join('-');
  }

  static String obscureAccountNumber(String accountNumber) {
    if (accountNumber.length <= 4) return accountNumber;
    final lastFour = accountNumber.substring(accountNumber.length - 4);
    final obscured = '*' * (accountNumber.length - 4);
    return '$obscured$lastFour';
  }
}
