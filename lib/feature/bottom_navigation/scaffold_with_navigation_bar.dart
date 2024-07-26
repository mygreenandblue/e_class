import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class ScaffoldWithNavigationBar extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const ScaffoldWithNavigationBar({
    super.key,
    required this.navigationShell,
  });

  @override
  State<ScaffoldWithNavigationBar> createState() =>
      ScaffoldWithNavigationBarState();
}

class ScaffoldWithNavigationBarState extends State<ScaffoldWithNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        elevation: 3,
        backgroundColor: theme.colorScheme.surface,
        selectedIndex: widget.navigationShell.currentIndex,
        onDestinationSelected: (index) {
          widget.navigationShell.goBranch(
            index,
            initialLocation: index == widget.navigationShell.currentIndex,
          );
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: Icon(
              Icons.home,
              color: theme.primaryColor,
            ),
            label: 'Trang chủ',
          ),
          _toggleDestination(
            NavigationDestination(
              icon: const Icon(Icons.contact_emergency_outlined),
              selectedIcon: Icon(
                Icons.contact_emergency_outlined,
                color: theme.primaryColor,
              ),
              label: 'Liên hệ',
            ),
            disableWhen: false,
          ),
          _toggleDestination(
            NavigationDestination(
              icon: const Icon(Icons.school_outlined),
              selectedIcon: Icon(
                Icons.school_outlined,
                color: theme.primaryColor,
              ),
              label: 'Lớp học',
            ),
            disableWhen: false,
          ),
          _toggleDestination(
            NavigationDestination(
              icon: const Icon(Icons.notifications_on_outlined),
              selectedIcon: Icon(
                Icons.notifications_on_outlined,
                color: theme.primaryColor,
              ),
              label: 'Thông báo',
            ),
            disableWhen: false,
          ),
          _toggleDestination(
            NavigationDestination(
              icon: const Icon(Icons.settings_outlined),
              selectedIcon: Icon(
                Icons.settings_outlined,
                color: theme.primaryColor,
              ),
              label: 'Cài đặt',
            ),
            disableWhen: false,
          ),
        ],
      ),
      body: widget.navigationShell,
    );
  }

  Widget _toggleDestination(
    Widget destination, {
    required bool disableWhen,
  }) {
    final disabledColor = Theme.of(context).disabledColor;

    final disabledTheme = Theme.of(context).navigationBarTheme.copyWith(
          labelTextStyle: MaterialStatePropertyAll(
            Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: disabledColor),
          ),
          iconTheme: MaterialStatePropertyAll(
            Theme.of(context).iconTheme.copyWith(color: disabledColor),
          ),
        );
    if (disableWhen) {
      return AbsorbPointer(
        child: Theme(
          data: Theme.of(context).copyWith(navigationBarTheme: disabledTheme),
          child: destination,
        ),
      );
    }
    return destination;
  }
}
