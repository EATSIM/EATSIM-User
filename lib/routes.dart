import 'package:flutter/material.dart';
import 'screens/5_restaurant.dart';
import 'screens/6_category.dart';
import 'screens/cellphone.dart';
import 'screens/8_meun_info.dart';
import 'screens/kakao_membership.dart';
import 'screens/login.dart';
import 'screens/membership.dart';
import 'screens/7_meun.dart';
import 'screens/1_onboarding.dart';
import 'screens/4_first.dart';
import 'screens/11_cart.dart';
import 'screens/12_view_reviews.dart';
import 'screens/13_order_list.dart';
import 'screens/14_create_review.dart';
import 'screens/15_info_personal.dart';
import 'screens/16_change_info_personal.dart';
import 'screens/17_change_shool.dart';
import 'models/foods.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/first':
        return MaterialPageRoute(builder: (_) => const FirstScreen());
      case '/Restaurant':
        return MaterialPageRoute(builder: (_) {
          final Map<String, dynamic> args =
              ModalRoute.of(_)!.settings.arguments as Map<String, dynamic>;
          final schoolIdx = args['schoolIdx'] ?? 0;
          final token = args['token'] ?? '';
          return RestaurantScreen(schoolIdx: schoolIdx, token: token);
        });
      case '/category':
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (_) => CategoryScreen(
                  restaurantName: args['restaurantName'],
                  restaurantIdx: args['restaurantIdx'],
                  token: args['token'],
                ));

      case '/cellphone':
        return MaterialPageRoute(builder: (_) => const CellphoneScreen());

      case '/info_menu':
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (_) => InfoMenuScreen(
                  foodName: args['foodName'],
                  foodCosts: args['foodCost'],
                  foodInfo: args['foodInfo'],
                  allCategoryFoods: args['allCategoryFoods'],
                  restaurantName: args['restaurantName'],
                  token: args['token'],
                  categoryIdx: args['categoryIds'],
                  foodIdx: args['foodIdx'] as int,
                  restaurantIdx: args['restaurantIdx'] as int,
                ));

      case '/kakao_membership':
        return MaterialPageRoute(builder: (_) => const KakaoMembershipScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/membership':
        String phoneNumber = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => MembershipScreen(phoneNumber: phoneNumber));

      case '/menu':
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => MenuScreen(
            restaurantName: args['restaurantName'],
            restaurantIdx: args['restaurantIdx'] as int, // Add this line
            categoryNames: args['categoryNames'] as List<String>,
            categoryIdxs: args['categoryIdxs'] as List<int>,
            selectedCategory: args['selectedCategory'] as String,
            token: args['token'],
            allCategoryFoods:
                args['allCategoryFoods'] as Map<int, List<Foodmodel>>,
          ),
        );

      case '/onboarding':
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case '/order':
        return MaterialPageRoute(builder: (_) => OrderScreen());

      case '/view_reviews':
        return MaterialPageRoute(builder: (_) => const ViewReviewsScreen());
      case '/order_list':
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => OrderListScreen(
            userInfo: args['userInfo'],
            token: args['token'],
          ),
        );

      case '/create_review':
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (_) => CreateReviewScreen(menuName: args['menuName']));
      case '/info_personal':
        return MaterialPageRoute(builder: (_) => const InfoPersonalScreen());
      case '/change_info_personal':
        return MaterialPageRoute(
            builder: (_) => const ChangeInfoPersonalScreen());
      case '/change_school':
        return MaterialPageRoute(builder: (_) => const ChangeSchoolScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
