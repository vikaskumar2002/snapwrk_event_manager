
import 'package:intl/intl.dart';

var months = [
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "Jun",
  "Jul",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec"
];

bool leapYear(int year) {
  bool leapYear = false;

  bool leap = ((year % 100 == 0) && (year % 400 != 0));
  if (leap == true)
    leapYear = false;
  else if (year % 4 == 0) leapYear = true;

  return leapYear;
}


int daysInMonth(final int monthNum, final int year) {

   var count = 0;

    if(monthNum == 0 || monthNum == 2 || monthNum == 4 || monthNum == 6 || monthNum == 7 || monthNum == 9 || monthNum == 11 )
    {
      count = 31;
    }
    else if(monthNum == 3 || monthNum == 8 || monthNum == 5 || monthNum == 10)
    {
      count = 30;
    }
    else{
      if (leapYear(year) == true)
        count = 29;
      else
        count = 28;
    }

  return count;
}

