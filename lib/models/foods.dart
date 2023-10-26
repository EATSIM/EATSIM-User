class Foodmodel {
  final int foodIdx;
  final String foodName;
  final String foodCost;
  final String foodInfo;

  Foodmodel(
      {required this.foodIdx,
      required this.foodName,
      required this.foodCost,
      required this.foodInfo});

  factory Foodmodel.fromJson(Map<String, dynamic> json) {
    return Foodmodel(
        foodIdx: json['idx'],
        foodName: json['foodName'],
        foodCost: json['foodCost'],
        foodInfo: json['foodInfo']);
  }
}
