import 'package:intl/intl.dart';

String dateFormatter(String isoDate) {
  DateTime date = DateTime.parse(isoDate.substring(0, 10));
  String formattedDate = DateFormat("dd MMMM yyyy").format(date);
  return formattedDate;
}
