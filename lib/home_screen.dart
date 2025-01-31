import 'package:flutter/material.dart';
import 'package:movies/tabs/homeTab/homeTab.dart';
import 'package:movies/tabs/profileTab/profileTab.dart';
import 'package:movies/tabs/searchTab/searchTab.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/imageassets.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = 'homescreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> tabs = [HomeTab(), SearchTab(), ProfileTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey,
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: AppColor.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColor.orange,
        currentIndex: selectedIndex,
        elevation: 0,
        backgroundColor: AppColor.darkGrey,
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(ImageAssets.homeIcon),
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(ImageAssets.searchIcon),
              ),
              label: "Search"),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(ImageAssets.browsIcon),
              ),
              label: "Brows"),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(ImageAssets.profileIcon),
              ),
              label: "profile"),
        ],
        showUnselectedLabels: false,
        // showSelectedLabels: false,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}