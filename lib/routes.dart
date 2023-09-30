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
        return MaterialPageRoute(builder: (_) => StartScreen());
      case '/category':
        return MaterialPageRoute(builder: (_) => CategoryScreen());
      case '/cellphone':
        return MaterialPageRoute(builder: (_) => CellphoneScreen());
      case '/change_info_personal':
        return MaterialPageRoute(builder: (_) => ChangeInfoPersonalScreen());
      case '/change_school':
        return MaterialPageRoute(builder: (_) => ChangeSchoolScreen());
      case '/create_review':
        return MaterialPageRoute(builder: (_) => CreateReviewScreen());
      case '/info_menu':
        return MaterialPageRoute(builder: (_) => InfoMenuScreen());
      case '/info_personal':
        return MaterialPageRoute(builder: (_) => InfoPersonalScreen());
      case '/kakao_membership':
        return MaterialPageRoute(builder: (_) => KakaoMembershipScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/membership':
        return MaterialPageRoute(builder: (_) => MembershipScreen());
      case '/menu':
        return MaterialPageRoute(builder: (_) => MenuScreen());
      case '/onboarding':
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case '/order':
        return MaterialPageRoute(builder: (_) => OrderScreen());
      case '/order_list':
        return MaterialPageRoute(builder: (_) => OrderListScreen());
      case '/view_reviews':
        return MaterialPageRoute(builder: (_) => ViewReviewsScreen());
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
