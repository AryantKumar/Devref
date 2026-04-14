import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../shared/docking_bar.dart';

class AppShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AppShell({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          // Main Content
          Positioned.fill(
            child: navigationShell,
          ),
          
          // Floating Docking Bar
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: DockingBar(
                  currentIndex: navigationShell.currentIndex,
                  icons: const [
                    Icons.dashboard_rounded,
                    Icons.grid_view_rounded,
                    Icons.psychology_rounded,
                    Icons.bookmark_rounded,
                    Icons.alt_route_rounded,
                  ],
                  onTap: (index) {
                    navigationShell.goBranch(
                      index,
                      initialLocation: index == navigationShell.currentIndex,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
