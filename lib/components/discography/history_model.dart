/// model class of discography from firestore.

class DiscographModel {
  List<HistoryModel> history = [];
}

class HistoryModel {
  HistoryModel(
    this.career,
    this.name,
    this.order,
  );
  List<CareerModel> career;
  String name;
  String order;
}

class CareerModel {
  CareerModel(
    this.from,
    this.overview,
    this.position,
    this.skills,
    this.to,
  );
  String from;
  String overview;
  String position;
  List<String> skills;
  String to;
}
