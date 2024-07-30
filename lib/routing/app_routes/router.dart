// ignore_for_file: use_build_context_synchronously

import 'package:eclass/core/local/auth_local.dart';
import 'package:eclass/feature/bottom_navigation/scaffold_with_navigation_bar.dart';
import 'package:eclass/feature/classroom/view/classroom_page.dart';
import 'package:eclass/feature/contact/contact_page.dart';
import 'package:eclass/feature/home/view/home_page.dart';
import 'package:eclass/feature/login/cubit/auth_cubit.dart';
import 'package:eclass/feature/login/view/login_page.dart';
import 'package:eclass/feature/notification/view/notification_page.dart';
import 'package:eclass/feature/setting/setting_page.dart';
import 'package:eclass/routing/routes.dart';
import 'package:eclass/routing/navigation_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

Page getPage({
  required Widget child,
  required GoRouterState state,
}) {
  return MaterialPage(
    key: state.pageKey,
    child: child,
  );
}

final router = GoRouter(
  initialLocation: AppRouter.homePath,
  navigatorKey: rootNavigatorKey,
  // redirect: (BuildContext context, GoRouterState state) async {
  //   final token = await AuthLocal.getAccessToken();
  //   if (state.matchedLocation == AppRouter.loginPath && token != null) {
  //     final isExpired = context.read<AuthCubit>().isTokenExpired(token);

  //     if (isExpired) {
  //       return AppRouter.loginPath;
  //     } else {
  //       return AppRouter.homePath;
  //     }
  //   }
  //   return null;
  // },
  routes: [
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: rootNavigatorKey,
      branches: [
        StatefulShellBranch(
          navigatorKey: homeNavigatorKey,
          routes: [
            GoRoute(
              path: AppRouter.homePath,
              pageBuilder: (context, GoRouterState state) {
                return getPage(
                  child: const HomePage(),
                  state: state,
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: contactNavigatorKey,
          routes: [
            GoRoute(
              path: AppRouter.contactPath,
              pageBuilder: (context, state) {
                return getPage(
                  child: const ContactPage(),
                  state: state,
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: classNavigatorKey,
          routes: [
            GoRoute(
              path: AppRouter.classPath,
              pageBuilder: (context, state) {
                return getPage(
                  child: const ClassroomPage(),
                  state: state,
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: notificationNavigatorKey,
          routes: [
            GoRoute(
              path: AppRouter.notiPath,
              pageBuilder: (context, state) {
                return getPage(
                  child: const NotificationPage(),
                  state: state,
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: settingNavigatorKey,
          routes: [
            GoRoute(
              path: AppRouter.settingPath,
              pageBuilder: (context, state) {
                return getPage(
                  child: const SettingPage(),
                  state: state,
                );
              },
            ),
          ],
        ),
      ],
      pageBuilder: (
        BuildContext context,
        GoRouterState state,
        StatefulNavigationShell navigationShell,
      ) {
        return getPage(
          child: ScaffoldWithNavigationBar(
            navigationShell: navigationShell,
          ),
          state: state,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: AppRouter.loginPath,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: LoginPage()),
    ),
  ],
);
