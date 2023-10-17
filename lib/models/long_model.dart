class LongCarModel {}

class AutomativeExpertModel {
  String tilte;
  bool? isHealthy;
  String description;

  AutomativeExpertModel({
    required this.tilte,
    required this.isHealthy,
    required this.description,
  });
}

class BodyAndChassis extends AutomativeExpertModel {
  BodyAndChassis(
      {required super.tilte,
      required super.isHealthy,
      required super.description});
}

class Technical extends AutomativeExpertModel {
  Technical(
      {required super.tilte,
      required super.isHealthy,
      required super.description});
}

class Options extends AutomativeExpertModel {
  Options(
      {required super.tilte,
      required super.isHealthy,
      required super.description});
}

class RimsAndTries extends AutomativeExpertModel {
  RimsAndTries(
      {required super.tilte,
      required super.isHealthy,
      required super.description});
}

class Documents extends AutomativeExpertModel {
  Documents(
      {required super.tilte,
      required super.isHealthy,
      required super.description});
}
