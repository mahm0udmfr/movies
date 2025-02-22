import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/model/home_tab_model.dart';
import 'package:movies/tabs/hometab/movie_widget.dart';
import 'package:movies/tabs/movie_details/cubit/movie_details_view_model.dart';
import 'package:movies/tabs/movie_details/movie_details.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'cubit/ListCategoryCubit.dart';

class ListCategoryWidget extends StatefulWidget {
  final List<Movies> availableNowList;

  const ListCategoryWidget({super.key, required this.availableNowList});

  @override
  ListCategoryWidgetState createState() => ListCategoryWidgetState();
}

class ListCategoryWidgetState extends State<ListCategoryWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final cubit = context.read<ListCategoryViewModel>();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.action,
              style: AppStyles.regular20RobotoWhite,
            ),
            InkWell(
              onTap: cubit.scrollToEnd,
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.see_more,
                    style: AppStyles.regular16RobotoOrange,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: AppColor.orange,
                    size: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: screenSize.height * 0.25,
          child: ListView.separated(
            controller: cubit.state,
            separatorBuilder: (context, index) =>
                SizedBox(width: screenSize.width * 0.05),
            itemCount: widget.availableNowList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return MovieWidget(
                onTap: () {
                  MovieDetailsViewModel.instance.getMovieById(
                      widget.availableNowList[index].id!.toString());
                  Navigator.of(context).pushNamed(MovieDetailsScreen.routeName);
                },
                imageUrl: widget.availableNowList[index].mediumCoverImage ?? "",
                ratingText: widget.availableNowList[index].rating.toString(),
              );
            },
          ),
        ),
      ],
    );
  }
}