import 'package:flutter/material.dart';
import 'package:simple_tic_tac_toe/view/export_view.dart';

class RouteHandle {
  static PageRoute _goToPage(Widget screen) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => screen,
      transitionDuration: const Duration(seconds: 0),
    );
  }

  static toHomePage(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        _goToPage(
          const HomePage(),
        ),
        (route) => false);
  }

  static toGamePlay(BuildContext context) {
    Navigator.push(
      context,
      _goToPage(const GamePlayPage()),
    );
  }

  static toAboutDeveloper(BuildContext context) {
    Navigator.push(
      context,
      _goToPage(const AboutDeveloperPage()),
    );
  }
}
