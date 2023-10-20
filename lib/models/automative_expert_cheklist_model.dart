// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:hive/hive.dart';
part 'automative_expert_cheklist_model.g.dart';

@HiveType(typeId: 0)
class Car {
  @HiveField(1)
  String name;
  @HiveField(2)
  String other;
  @HiveField(3)
  String fullDescription;
  @HiveField(4)
  Map<String, List<AutomativeExpertModel>> expert;
  @HiveField(5)
  List trueCounter;
  @HiveField(6)
  List falseCounter;

  // AutomativeExpertModel automativeExpertModel;
  Car({
    required this.falseCounter,
    required this.trueCounter,
    required this.expert,
    required this.name,
    required this.fullDescription,
    required this.other,
  });
}

@HiveType(typeId: 1)
class AutomativeExpertModel {
  @HiveField(1)
  String title;
  @HiveField(2)
  bool? isHealthy;
  @HiveField(3)
  List<String> description;
  AutomativeExpertModel({
    required this.title,
    required this.isHealthy,
    required this.description,
  });
}
