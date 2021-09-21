
import 'package:event_manager_app/model/event_getter_model.dart';
import 'package:flutter/material.dart';

class EventInfo extends StatelessWidget {
  EventInfo(this.event);
  final EventModel event;

  @override
  Widget build(BuildContext context) {

    final decoration = const BoxDecoration(
      border: Border(
        left: BorderSide(color: Colors.blueGrey),
      ),
    );

    final content = [
      Row(
        children: <Widget>[
          Expanded(
            child: Text(
              event.title == ' ' ? '' : event.title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 4.0),
      Row(
        children: <Widget>[

          Flexible(
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Text(
                  event.description.toString() == '' ? '' : event.description.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 4.0),
    ];

    return Expanded(
      child: Container(
        decoration: decoration,
        margin: const EdgeInsets.only(left: 12.0),
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: content,
        ),
      ),
    );
  }
}