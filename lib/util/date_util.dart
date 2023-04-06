import 'package:intl/intl.dart';

String parseDate(String? date) {
  //2023-04-01T17:39:37.276+0000
  String outputDate = "--";
  if (date != null) {
    DateTime parseDate =  DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(date);
    var inputDate = DateTime.parse(parseDate.toString()+'Z').toLocal();
    var outputFormat = DateFormat('hh:mm a');
    outputDate = outputFormat.format(inputDate);
    print(outputDate);
  }
  return outputDate;
}