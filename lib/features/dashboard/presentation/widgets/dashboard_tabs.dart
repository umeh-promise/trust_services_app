import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trust_services_app/core/theme/colors.dart';
import 'package:trust_services_app/features/dashboard/presentation/pages/dashboard.dart';
import 'package:trust_services_app/features/dashboard/presentation/pages/profile.dart';

class DashboardTabs extends StatefulWidget {
  const DashboardTabs({super.key});

  @override
  State<DashboardTabs> createState() => _DashboardTabsState();
}

class _DashboardTabsState extends State<DashboardTabs> {
  int _activePageIdx = 0;

  static const List<Widget> _pages = [
    DashboardScreen(),
    Center(child: Text('Hi')),
    ProfileScreen(),
  ];

  void _setActivePageIdx(int idx) {
    setState(() {
      _activePageIdx = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppPallete.grey50,
        selectedItemColor: AppPallete.primaryColor,
        unselectedItemColor: AppPallete.blackColor,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        currentIndex: _activePageIdx,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_text),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            label: 'Profile',
          ),
        ],
        onTap: (idx) => _setActivePageIdx(idx),
      ),
      body: _pages[_activePageIdx],
    );
  }
}
