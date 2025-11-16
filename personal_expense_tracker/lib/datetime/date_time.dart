//convert dateTime obj to string
String convertDateTimeToString(DateTime dateTime) {
  //year
  String year = dateTime.year.toString();

  //month
  String month = dateTime.month.toString();
    //append 0 for single digits
    if (month.length == 1) {
      month = '0$month';
    }

  //day
  String day = dateTime.day.toString();
    //appense 0 for single digits
    if (day.length == 1) {
      day = '0$day';
    }

  //format
  String yyyymmdd = year + month + day;

  return yyyymmdd;
}