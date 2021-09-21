
import 'package:event_manager_app/date_info_screen.dart';
import 'package:event_manager_app/event_info_screen.dart';
import 'package:event_manager_app/model/event_getter_model.dart';
import 'package:flutter/material.dart';

class RowItemListTile extends StatelessWidget {
  RowItemListTile(
      this.events,this.day,this.month
      ) : key = Key('$events');

  final EventModel events;
  final Key key;
  final String day, month;

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 16.0,
      ),
      child: Row(
        children: [
          DateInfo(day,month),
          EventInfo(events),
        ],
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(top: 1.0),
      child: Material(
        child: content,
      ),
    );
  }
}