import 'package:flutter/material.dart';
import '../models/restaurant_info.dart';
import '../server/restaurant_service.dart';
import '../widgets/5_restaurant_widgets/restaurant_widget.dart';

class RestaurantScreen extends StatefulWidget {
  final int schoolIdx;
  final String token;

  const RestaurantScreen(
      {Key? key, required this.schoolIdx, required this.token})
      : super(key: key);

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  late List<Restaurant> restaurants = [];
  bool _isRestaurantsFetched = false;

  @override
  void initState() {
    super.initState();
    if (!_isRestaurantsFetched) {
      _fetchRestaurants();
      _isRestaurantsFetched = true;
    }
  }

  Future<void> _fetchRestaurants() async {
    try {
      restaurants = await RestaurantService.fetchRestaurantsBySchool(
          widget.schoolIdx, widget.token);
      setState(() {});
    } catch (e) {
      print('Error fetching restaurants: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: List.generate(
                restaurants.length,
                (index) => restaurantItem(
                  restaurantName: restaurants[index].restaurantName,
                  location: restaurants[index].locations,
                  info: restaurants[index].info,
                  imageOnLeft: index.isEven,
                  restaurantIdx: restaurants[index].restaurantIdx,
                  token: widget.token,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
