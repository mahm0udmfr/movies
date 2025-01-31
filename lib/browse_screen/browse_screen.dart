import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies/browse_screen/moviesList.dart';
import 'package:movies/browse_screen/movies_category_widget.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/colors.dart';

class BrowseScreen extends StatefulWidget {
  static const String routeName = "Browse_screen";

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    List<String> movieCategories = [
      AppLocalizations.of(context)!.action,
      AppLocalizations.of(context)!.adventure,
      AppLocalizations.of(context)!.horror,
      AppLocalizations.of(context)!.fantasy,
      AppLocalizations.of(context)!.sci_fi,
      AppLocalizations.of(context)!.animation,
    ];
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: screenSize.height * .05,
          ),
          Container(
            height: screenSize.height * .06,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    selectedIndex = index;
                    setState(() {});
                  },
                  child: MoviesCategoryWidget(
                      categoryName: movieCategories[index],
                      isSelected: selectedIndex == index,
                      backgroundColor: AppColor.orange,
                      textSelectedStyle: AppStyles.bold20Black,
                      textUnSelectedStyle: AppStyles.bold20Orange),
                );
              },
              itemCount: movieCategories.length,
            ),
          ),
          SizedBox(
            height: screenSize.height * .02,
          ),
          Expanded(
            child: GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Movieslist();
                }),
          )
        ],
      ),
    );
  }
}
