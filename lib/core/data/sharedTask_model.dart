// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

part 'sharedTask_model.g.dart';
@HiveType(typeId: 1)
class SharedtaskModel {
  @HiveField(0)
  int color;
   @HiveField(1)
  String title;
   @HiveField(2)
  String date;
   @HiveField(3)
  String description;
   @HiveField(4)
  String time;
   @HiveField(5)
   String status;
  SharedtaskModel({
    required this.color,
    required this.title,
    required this.date,
    required this.description,
    required this.time,
    required this.status,
  });
}
