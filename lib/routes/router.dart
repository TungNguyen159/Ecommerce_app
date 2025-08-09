import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:shop_app/features/auth/pages/forgot_page.dart';
import 'package:shop_app/features/auth/pages/signin_page.dart';
import 'package:shop_app/features/auth/pages/signup_page.dart';
import 'package:shop_app/features/auth/pages/splash_page.dart';
import 'package:shop_app/features/cart/pages/cart_page.dart';
import 'package:shop_app/features/order/pages/confirmation.dart';
import 'package:shop_app/features/order/pages/checkout.dart';
import 'package:shop_app/features/product/pages/detailpage.dart';
import 'package:shop_app/features/product/pages/home_page.dart';
import 'package:shop_app/features/product/pages/category.dart';
import 'package:shop_app/features/profile/pages/profile_detail.dart';
import 'package:shop_app/features/profile/pages/profile_page.dart';

import 'package:shop_app/routes/navigationbar.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/signin',
  routes: [
    /// Route ngoài shell (không có navigation bar)
    GoRoute(path: '/signin', builder: (context, state) => const Signinpage()),
    GoRoute(path: '/signup', builder: (context, state) => const Signuppage()),
    GoRoute(path: '/forgot', builder: (context, state) => const ForgotPage()),
    GoRoute(path: '/splash', builder: (context, state) => const SplashPage()),
    GoRoute(
      path: '/profile/detail',
      builder: (context, state) => const ProfileDetail(),
    ),
    GoRoute(
      path: "/checkout",
      pageBuilder: (context, state) =>
          buildFadePage(child: const CheckoutPage()),
    ),
    GoRoute(
      path: "/confirmation",
      pageBuilder: (context, state) =>
          buildFadePage(child: const ConfirmationPage()),
    ),

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
        return buildFadePage(child: DetailPage(productId: productId));
      },
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
          path: '/cart',
          pageBuilder: (context, state) =>
              buildFadePage(child: const CartPage()),
        ),

        GoRoute(
          path: '/category',
          pageBuilder: (context, state) =>
              buildFadePage(child: const CategoryPage()),
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
