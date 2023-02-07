import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:traveling_app_ui/components/custom_icon.dart';

import '../view/home.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOption = [
    const HomeView(),
    const Center(child: Text('Search')),
    const Center(child: Text('Tickets')),
    const Center(child: Text('Profile')),
  ];
  void _onTapItems(int index) {
    setState(() {
      HapticFeedback.selectionClick();
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueGrey,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          _widgetOption[_selectedIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10.0,
                  sigmaY: 10.0,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black12.withOpacity(0.3),
                  ),
                  padding: const EdgeInsets.only(bottom: 30, top: 10),
                  child: BottomNavigationBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    currentIndex: _selectedIndex,
                    onTap: _onTapItems,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    type: BottomNavigationBarType.fixed,
                    items: [
                      BottomNavigationBarItem(
                          icon: CustomIcons(iconName: 'home'),
                          activeIcon: CustomIcons(iconName: 'home-alt'),
                          label: ''),
                      BottomNavigationBarItem(
                          icon: CustomIcons(iconName: 'explore'),
                          activeIcon: CustomIcons(iconName: 'explore-alt'),
                          label: ''),
                      BottomNavigationBarItem(
                          icon: CustomIcons(iconName: 'favorite'),
                          activeIcon: CustomIcons(iconName: 'favorite-alt'),
                          label: ''),
                      BottomNavigationBarItem(
                          icon: CustomIcons(iconName: 'user'),
                          activeIcon: CustomIcons(iconName: 'user-alt'),
                          label: ''),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
