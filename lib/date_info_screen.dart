

import 'package:flutter/material.dart';

class DateInfo extends StatelessWidget{

  DateInfo(this.day,this.month);
  final String day;
  final String month;

  @override
  Widget build(BuildContext context) {

    var dateWidget = Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
            day == '' ? ' ': day,
            style: TextStyle(
            fontSize: 32.0,
            color: Colors.black)
        ),

        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            month == ' ' ? '' : month,
            style: TextStyle(fontSize: 12.0,
              color: Colors.black  ,
                fontWeight: FontWeight.bold          ),),
        )
      ],
    );

    return Column(
      children: [
        dateWidget,
        const SizedBox(height: 4.0),
      ],
    );
  }

}
