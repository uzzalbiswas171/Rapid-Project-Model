import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';
import 'package:rapid_super_market/Core/Const/image_const.dart';
import 'package:rapid_super_market/Views/Screen/BottomNavBar/CartScreen/cart_creen.dart';
import 'package:rapid_super_market/Views/Screen/BottomNavBar/FavoriteScreen/favorite_screen.dart';
import 'package:rapid_super_market/Views/Screen/BottomNavBar/OfferScreen/OfferScreen.dart';
import 'package:rapid_super_market/Views/Screen/BottomNavBar/Profile/profile.dart' show ProfileScreen;
import 'HomeScreen/home_screen.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _currentIndex = 0;

  final _navItems = const [
    _NavItem(icon: Icons.home_outlined,label:"Home", widget: HomeScreen()),
    _NavItem(icon: Icons.favorite_border,label:"Favorites", widget: FavoriteScreen()),
    _NavItem(icon: Icons.shopping_cart_outlined,label:"Cart", widget: CartScreen()),
    _NavItem(icon: Icons.person,label:"Profile", widget: ProfileScreen()),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  PopScope(
      canPop: false,
      // onPopInvokedWithResult: (didPop, result) {
      //
      // },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[100],
        body: Center(child:_currentIndex==4?OfferScreen(): _navItems[_currentIndex].widget),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _currentIndex = 4; // Navigate to Cart when FAB is pressed
            });
          },
          backgroundColor: ColorConst.baseColor,
          elevation: 4,
          shape: const CircleBorder(),
          child: Image.asset(ImageConst.historyPer,fit: BoxFit.fill,height: 28,width: 28,),
        ),
        bottomNavigationBar: Material(
          elevation: 10,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          clipBehavior: Clip.antiAlias,
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 0,
            padding: EdgeInsets.only(top: 0.5),
            color: Colors.grey.withValues(alpha: 0.3),
            child: Container(
              color: Colors.white,
              height: 70, // ✅ Updated height
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(_navItems.length + 1, (index) {
                  if (index == 2) return const SizedBox(width: 50);
                  final navIndex = index > 2 ? index - 1 : index;
                  return _buildNavItem(navIndex);
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    final item = _navItems[index];
    final isSelected = _currentIndex == index;

    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(item.icon, color: isSelected ? ColorConst.baseColor : Colors.grey),
            const SizedBox(height: 4),
            Text(
              item.label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? ColorConst.baseColor : Colors.grey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  final Widget widget;

  const _NavItem({required this.icon,required this.label, required this.widget});

}
