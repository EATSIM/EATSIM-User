import 'package:flutter/material.dart';
import 'screens/start.dart';
import 'screens/category.dart';
import 'screens/cellphone.dart';
import 'screens/change_info_personal.dart';
import 'screens/change_shool.dart';
import 'screens/create_review.dart';
import 'screens/info_meun.dart';
import 'screens/info_personal.dart';
import 'screens/kakao_membership.dart';
import 'screens/login.dart';
import 'screens/membership.dart';
import 'screens/meun.dart';
import 'screens/onboarding.dart';
import 'screens/order.dart';
import 'screens/order_list.dart';
import 'screens/view_reviews.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/start':
        return MaterialPageRoute(builder: (_) => const StartScreen());
      case '/category':
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (_) =>
                CategoryScreen(cafeteriaName: args['cafeteriaName']));
      case '/cellphone':
        return MaterialPageRoute(builder: (_) => const CellphoneScreen());
      case '/change_info_personal':
        return MaterialPageRoute(
            builder: (_) => const ChangeInfoPersonalScreen());
      case '/change_school':
        return MaterialPageRoute(builder: (_) => const ChangeSchoolScreen());
      case '/create_review':
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (_) => CreateReviewScreen(menuName: args['menuName']));

      case '/info_menu':
        return MaterialPageRoute(builder: (_) => const InfoMenuScreen());
      case '/info_personal':
        return MaterialPageRoute(builder: (_) => const InfoPersonalScreen());
      case '/kakao_membership':
        return MaterialPageRoute(builder: (_) => const KakaoMembershipScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/membership':
        return MaterialPageRoute(builder: (_) => const MembershipScreen());
      case '/menu':
        return MaterialPageRoute(builder: (_) => const MenuScreen());
      case '/onboarding':
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case '/order':
        return MaterialPageRoute(builder: (_) => const OrderScreen());
      case '/order_list':
        return MaterialPageRoute(builder: (_) => const OrderListScreen());
      case '/view_reviews':
        return MaterialPageRoute(builder: (_) => const ViewReviewsScreen());
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
