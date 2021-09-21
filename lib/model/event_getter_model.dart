
import 'package:flutter/material.dart';


abstract class EventInterface {
  DateTime getDate();
  String getTitle();
  int getId();
  String getDescription();
}

class EventModel implements EventInterface {
  final DateTime date;
  final String title;
  final int id;
  final String description;

  EventModel({
    required this.id,
    required this.date,
    required this.title,
    required this.description,
  });

  @override
  bool operator ==(dynamic other) {
    return this.date == other.date &&
        this.title == other.title &&
        this.description == other.description &&
        this.id == other.id;
  }

  @override
  int get hashCode => hashValues(date, title, id, description);

  @override
  DateTime getDate() {
    return date;
  }
  @override
  int getId() {
    return id;
  }
  @override
  String getTitle() {
    return title;
  }
  @override
  String getDescription() {
    return description;
  }
}
