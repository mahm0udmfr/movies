import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/main_screen/cubit/home_screen_states.dart';
import 'package:movies/main_screen/cubit/home_screen_view_model.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/imageassets.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = 'homescreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel viewModel = HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeScreenStates>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
            body: IndexedStack(
              index: viewModel.selectedIndex,
              children: viewModel.tabs,
            ),
            bottomNavigationBar: BottomNavigationBar(
                unselectedItemColor: AppColor.white,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: AppColor.orange,
                currentIndex: viewModel.selectedIndex,
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
                  viewModel.bottomNavOnTab(index);
                }));
      },
    );
  }
}
