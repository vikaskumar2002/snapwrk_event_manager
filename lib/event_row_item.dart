
import 'package:event_manager_app/model/event_getter_model.dart';
import 'package:event_manager_app/row_itemlist_tile.dart';
import 'package:flutter/material.dart';

class EventRowItem extends StatelessWidget{
  final EventModel events;
  final String day, month;
  final VoidCallback onPressed;
  //BuildContext context;

  EventRowItem({required this.events,required this.day,required this.month, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    //this.context = context;
    return InkWell(
      onTap: onPressed == null ? () {} : onPressed,
      child: Card(
        elevation: 1.0,
        child: RowItemListTile(events,day,month),
      ),
    );
  }

}