class Category {
  final int categoryIdx;
  final String categoryName;
  // final Restaurant restaurant;

  Category({
    required this.categoryIdx,
    required this.categoryName,
    // required this.restaurant,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryIdx: json['idx'],
      categoryName: json['categoryName'],
      // restaurant: Restaurant.fromJson(json['restaurant']),
    );
  }
}
