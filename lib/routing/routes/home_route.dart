import 'package:eclass/feature/booking/booking_page.dart';
import 'package:eclass/feature/booking_calendar/booking_calendar_page.dart';
import 'package:eclass/feature/home/view/home_page.dart';
import 'package:eclass/routing/navigation_keys.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomesBranch extends StatefulShellBranchData {
  static final GlobalKey<NavigatorState> $navigatorKey = homeNavigatorKey;
  const HomesBranch();
}

class HomesRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

class BookingRoute extends GoRouteData {
  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      outerShellNavigatorKey;

  const BookingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const BookingPage();
  }
}

class BookingCalendarRoute extends GoRouteData {
  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      outerShellNavigatorKey;

  const BookingCalendarRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const BookingCalendarPage();
  }
}
