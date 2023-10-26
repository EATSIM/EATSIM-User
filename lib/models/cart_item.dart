class CartItem {
  final String foodName;
  final String foodCost;
  final String restaurantName;
  final int foodIdx;
  final int restaurantIdx;
  final int categoryIdx;
  int quantity;

  CartItem({
    required this.foodName,
    required this.foodCost,
    required this.restaurantName,
    required this.foodIdx,
    required this.restaurantIdx,
    required this.categoryIdx,
    this.quantity = 1,
  });
}
