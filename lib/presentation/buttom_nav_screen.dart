import 'package:fitness_app/core/ui/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'dashboard/dashboard.dart';

class MyHomePage extends StatelessWidget {
  final PersistentTabController _controller =
  PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      Center(child: DashboardWidget()),
      Center(child: Text("Activity")),
      Center(child: Text("Search")),
      Center(child: Text("Camera")),
      Center(child: Text("Profile")),
    ];
  }
  Widget gradientIcon(String assetPath) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: [AppConstants.kobi, AppConstants.perfume],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bounds);
      },
      child: SvgPicture.asset(
        assetPath,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn), // Ensures the gradient is applied
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: gradientIcon("assets/icons/Home.svg"),
        inactiveIcon: SvgPicture.asset(
          "assets/icons/Home.svg",
          colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
        ),
        activeColorPrimary: Colors.transparent, // Transparent to avoid conflicts.
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: gradientIcon("assets/icons/Activity.svg"),
        inactiveIcon: SvgPicture.asset(
          "assets/icons/Activity.svg",
          colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
        ),
        activeColorPrimary: Colors.transparent,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset("assets/icons/Search.svg"),
        inactiveIcon: SvgPicture.asset(
          "assets/icons/Search.svg",
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        activeColorPrimary: AppConstants.malibu,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: gradientIcon("assets/icons/Camera.svg"),
        inactiveIcon: SvgPicture.asset(
          "assets/icons/Camera.svg",
          colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
        ),
        activeColorPrimary: Colors.transparent,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: gradientIcon("assets/icons/Profile.svg"),
        inactiveIcon: SvgPicture.asset(
          "assets/icons/Profile.svg",
          colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
        ),
        activeColorPrimary: Colors.transparent,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      navBarStyle: NavBarStyle.style15,
    );
  }
}
