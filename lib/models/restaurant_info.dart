class Restaurant {
  final int restaurantIdx;
  final String restaurantName;
  final String locations;
  final String info;

  Restaurant({
    required this.restaurantIdx,
    required this.restaurantName,
    required this.locations,
    required this.info,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      restaurantIdx: json['idx'],
      restaurantName: json['restaurantName'],
      locations: json['locations'],
      info: json['info'],
    );
  }
}
