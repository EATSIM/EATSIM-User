import 'package:flutter/material.dart';
import 'screens/restaurant.dart';
import 'screens/category.dart';
import 'screens/cellphone.dart';
import 'screens/meun_info.dart';
import 'screens/kakao_membership.dart';
import 'screens/login.dart';
import 'screens/membership.dart';
import 'screens/meun.dart';
import 'screens/onboarding.dart';
import 'screens/first.dart';
import 'screens/11_order.dart';
import 'screens/12_view_reviews.dart';
import 'screens/13_order_list.dart';
import 'screens/14_create_review.dart';
import 'screens/15_info_personal.dart';
import 'screens/16_change_info_personal.dart';
import 'screens/17_change_shool.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/first':
        return MaterialPageRoute(builder: (_) => const firstScreeon());
      case '/Restaurant':
        return MaterialPageRoute(builder: (_) => RestaurantScreen());
      case '/category':
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (_) =>
                CategoryScreen(cafeteriaName: args['cafeteriaName']));
      case '/cellphone':
        return MaterialPageRoute(builder: (_) => const CellphoneScreen());
      case '/info_menu':
        return MaterialPageRoute(builder: (_) => const InfoMenuScreen());
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
            builder: (_) => MenuScreen(cafeteriaName: args['cafeteriaName']));
      case '/onboarding':
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case '/order':
        return MaterialPageRoute(builder: (_) => const OrderScreen());
      case '/view_reviews':
        return MaterialPageRoute(builder: (_) => const ViewReviewsScreen());
      case '/order_list':
        return MaterialPageRoute(builder: (_) => const OrderListScreen());
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
