import 'package:flutter/material.dart';
import 'package:movies/tabs/browse_screen/browse_screen.dart';
import 'package:movies/tabs/hometab/cubit/tab_cubit.dart';
import 'package:movies/tabs/hometab/home_tab.dart';
import 'package:movies/tabs/profileTab/profile_tab.dart';
import 'package:movies/tabs/searchTab/search_tab.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/imageassets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const String routename = 'homescreen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabCubit(),
      child: Scaffold(
        body: BlocBuilder<TabCubit, int>(
          builder: (context, selectedIndex) {
            return IndexedStack(
              index: selectedIndex,
              children: [
                MoviesTab(),
                SearchTab(),
                BrowseScreen(),
                ProfileTab(),
              ],
            );
          },
        ),
        bottomNavigationBar: BlocBuilder<TabCubit, int>(
          builder: (context, selectedIndex) {
            return BottomNavigationBar(
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
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(ImageAssets.searchIcon),
                  ),
                  label: "Search",
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(ImageAssets.browseIcon),
                  ),
                  label: "Browse",
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(ImageAssets.profileIcon),
                  ),
                  label: "profile",
                ),
              ],
              showUnselectedLabels: false,
              onTap: (index) {
                context.read<TabCubit>().changeTab(index);
              },
            );
          },
        ),
      ),
    );
  }
}
