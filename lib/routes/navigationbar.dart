import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.child});

  final Widget child;



  static const List<String> routes = [
    '/home',
    '/label',
    '/notification',
    '/profile',
  ];

  int _locationToIndex(String location) {
    return routes.indexWhere((r) => location.startsWith(r));
  }

  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    final int currentIndex = _locationToIndex(location);

    return Scaffold(
      body: child, // 👈 RẤT QUAN TRỌNG: hiển thị phần nội dung
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(routes.length, (index) {
            final isActive = currentIndex == index;
            final iconData = [
              Icons.home,
              Icons.label,
              Icons.notifications,
              Icons.person,
            ][index];

            return IconButton(
              icon: Icon(
                iconData,
                color: isActive
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).textTheme.bodySmall?.color,
              ),
              onPressed: () => context.go(routes[index]),
            );
          }),
        ),
      ),
    );
  }

}