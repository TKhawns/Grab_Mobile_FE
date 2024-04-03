// ignore_for_file: depend_on_referenced_packages, no_leading_underscores_for_local_identifiers

import 'package:fe_grab_mobile/module/home/homepage.dart';
import 'package:fe_grab_mobile/module/activity/activity_page.dart';
import 'package:fe_grab_mobile/module/message/message_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../module/payment/payment_page.dart';

class BottomNavigatorBar extends StatelessWidget {
  const BottomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildScreens() {
      return [
        const HomePage(),
        const ActivityPage(),
        const PaymentPage(),
        MessagePage(),
        const ActivityPage(),
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          iconSize: 24,
          textStyle: GoogleFonts.inter(fontSize: 11),
          icon: const Icon(Icons.home),
          title: ("Trang chủ"),
          activeColorPrimary: Colors.green,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          iconSize: 24,
          textStyle: GoogleFonts.inter(fontSize: 11),
          icon: const Icon(Icons.feed),
          title: ("Hoạt động"),
          activeColorPrimary: Colors.green,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          iconSize: 24,
          textStyle: GoogleFonts.inter(fontSize: 11),
          icon: const Icon(Icons.account_balance_wallet_outlined),
          title: ("Thanh toán"),
          activeColorPrimary: Colors.green,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          iconSize: 24,
          textStyle: GoogleFonts.inter(fontSize: 11),
          icon: const Icon(Icons.message_outlined),
          title: ("Tin nhắn"),
          activeColorPrimary: Colors.green,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          iconSize: 24,
          textStyle: GoogleFonts.inter(fontSize: 11),
          icon: const Icon(Icons.account_circle_rounded),
          title: ("Tài khoản"),
          activeColorPrimary: Colors.green,
          inactiveColorPrimary: Colors.grey,
        ),
      ];
    }

    PersistentTabController _controller;
    _controller = PersistentTabController(initialIndex: 0);

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      //padding: NavBarPadding.only(top: 10),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: const NavBarDecoration(
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}
