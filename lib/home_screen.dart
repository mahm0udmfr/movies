import 'package:flutter/material.dart';
import 'package:movies/tabs/browse_screen/browse_screen.dart';
import 'package:movies/tabs/hometab/home_tab.dart';
import 'package:movies/tabs/profileTab/profile_tab.dart';
import 'package:movies/tabs/searchTab/search_tab.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/imageassets.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = 'homescreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> tabs = [
    MoviesTab(),
    SearchTab(),
    BrowseScreen(),
    ProfileTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: tabs,
      ),
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
                AssetImage(ImageAssets.browseIcon),
              ),
              label: "Browse"),
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
