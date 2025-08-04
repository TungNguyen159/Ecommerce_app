import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:shop_app/features/cart/presentation/pages/cart_page.dart';
import 'package:shop_app/features/product/presentation/pages/detailpage.dart';
import 'package:shop_app/features/product/presentation/pages/notifications.dart';
import 'package:shop_app/features/product/presentation/pages/product_page.dart';
import 'package:shop_app/features/product/presentation/pages/profile_page.dart';
import 'package:shop_app/routes/navigationbar.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    /// Route ngoài shell (không có navigation bar)
    // GoRoute(path: '/login', builder: (context, state) => const SignInPage()),
    // GoRoute(path: '/signup', builder: (context, state) => const SignUpPage()),
    // GoRoute(
    //   path: "/manage",
    //   pageBuilder: (context, state) =>
    //       buildFadePage(child: const ManageScreen()),
    // ),

    // GoRoute(
    //   path: "/manage/add",
    //   pageBuilder: (context, state) =>
    //       buildFadePage(child: const Add()),
    // ),
    // get detail by id
    GoRoute(
      path: "/home/detail/:id",
      pageBuilder: (context, state) {
        final productId = int.parse(state.pathParameters['id']!);
        return buildFadePage(
          child: DetailPage(productId: productId),
        );
      }     
    ),

    /// ShellRoute chứa NavigationBar
    ShellRoute(
      builder: (context, state, child) {
        return MainScreen(child: child); // chứa navigation bar và nội dung
      },
      routes: [
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) =>
              buildFadePage(child: const Homepage()),
        ),

        GoRoute(
          path: '/profile',
          pageBuilder: (context, state) =>
              buildFadePage(child: const ProfilePage()),
        ),

        GoRoute(
          path: '/label',
          pageBuilder: (context, state) =>
              buildFadePage(child: const CartPage()),
        ),

        GoRoute(
          path: '/notification',
          pageBuilder: (context, state) =>
              buildFadePage(child: const NotificationsPage()),
        ),
      ],
    ),
  ],
);
CustomTransitionPage<T> buildFadePage<T>({required Widget child}) {
  return CustomTransitionPage<T>(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}
