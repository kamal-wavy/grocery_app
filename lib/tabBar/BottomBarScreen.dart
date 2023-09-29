import 'package:flutter/material.dart';
import 'package:testapp/Cart/MyCartScreen.dart';
import 'package:testapp/Favourite/favouriteScreen.dart';
import 'package:testapp/account/accountScreen.dart';
import 'package:testapp/constWidget/constWidgetType.dart';
import 'package:testapp/explore/ExploreScreen.dart';
import 'package:testapp/home/homeScreen.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int currentIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const ExploreScreen(),
    const MyCartScreen(),
    const FavouriteScreen(),
    const AccountScreen(),
  ];
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  _pages[currentIndex],
      bottomNavigationBar: Container(

        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            selectedItemColor: ConstWidgetType.greenColor,
            unselectedItemColor: const Color(0xFF181725),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: (index){
              setState(() {
                currentIndex = index;
              });
            }, items: const [
              BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/icons/shopImage.png')),label: 'Shop'),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/icons/exploreImage.png')),label: 'Explore'),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/icons/cartImage.png')),label: 'Cart'),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/icons/FavouriteImage.png')),label: 'Favourite'),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/icons/accountImage.png')),label: 'Account'),
          ],
          ),
        ),
      ),
    );
  }
}
