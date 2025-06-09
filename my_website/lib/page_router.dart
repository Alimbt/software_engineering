import 'package:flutter/material.dart';
import 'package:my_website/screens/Authorization/authorization.dart';
import 'package:my_website/screens/call_with_us_screen.dart';
import 'package:my_website/screens/my_project_screen.dart';
import 'screens/home_screen/home_screen.dart';


class PageRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/projects':
        return MaterialPageRoute(builder: (_) => const MyProjectScreen());
      case '/contact':
        return MaterialPageRoute(builder: (_) => const CallWithUsScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) =>  AuthScreen());
      default:
      // صفحه خطا برای مسیرهای نامعتبر
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('خطا: صفحه "${settings.name}" یافت نشد!'),
            ),
          ),
        );
    }
  }
}