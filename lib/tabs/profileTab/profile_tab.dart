import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies/Auth/Login/loginscreen.dart';
import 'package:movies/profile/updateprofile.dart';
import 'package:movies/services.dart';
import 'package:movies/tabs/hometab/movie_widget.dart';
import 'package:movies/tabs/movie_details/cubit/movie_details_view_model.dart';
import 'package:movies/tabs/movie_details/movie_details.dart';
import 'package:movies/tabs/profileTab/cubit/profile_tab_state.dart';
import 'package:movies/tabs/profileTab/cubit/profile_tab_view_model.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/imageassets.dart';
import 'package:movies/widget/custom_elevated_button.dart';
import 'cubit/history_state.dart';
import 'cubit/history_view_model.dart';
import 'cubit/watch_list_state.dart';
import 'cubit/watch_list_view_model.dart';

class ProfileTab extends StatefulWidget {
  static const String routename = "profileTab";
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab>
    with SingleTickerProviderStateMixin {
  ProfileTabViewModel viewModel = ProfileTabViewModel();
  WatchListViewModel watchListViewModel = WatchListViewModel();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    viewModel.getUserData();
    String? token = MyServices.getString("Token");
    if (token != null) {
      watchListViewModel.getAllFavoriteMovies(token: token);
    }

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocBuilder<ProfileTabViewModel, ProfileTabState>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is ProfileLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is ProfileErrorState) {
            return Center(child: Text(state.errorMessage));
          }
          if (state is ProfileSuccessState) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: height * .05, bottom: height * .05),
                    color: AppColor.grey,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(viewModel
                              .avatarsList[viewModel.userData.avaterId ?? 0]),
                        ),
                        SizedBox(height: 10),
                        Text(
                          viewModel.userData.name ?? "User",
                          style: AppStyles.regular20RobotoWhite,
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  watchListViewModel.allFavoritesList?.length
                                          .toString() ??
                                      "0",
                                  style: AppStyles.bold24White,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.watch_list,
                                  style: AppStyles.bold24White,
                                ),
                              ],
                            ),
                            BlocBuilder<HistoryViewModel, HistoryState>(
                              bloc: context.read<HistoryViewModel>(),
                              builder: (context, state) {
                                return Column(
                                  children: [
                                    Text(
                                      state is HistorySuccessState
                                          ? state.historyMovies.length
                                              .toString()
                                          : "0",
                                      style: AppStyles.bold24White,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!.history,
                                      style: AppStyles.bold24White,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.02),
                        Wrap(
                          alignment: WrapAlignment.spaceEvenly,
                          spacing: width * 0.05,
                          runSpacing: height * 0.02,
                          children: [
                            SizedBox(
                              width: width * 0.4,
                              child: CustomElevatedButton(
                                text:
                                    AppLocalizations.of(context)!.edit_profile,
                                textStyle: AppStyles.regular20RobotoBlack,
                                backgroundColor: AppColor.orange,
                                center: true,
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(Updateprofile.routename);
                                },
                              ),
                            ),
                            SizedBox(
                              width: width * 0.4,
                              child: CustomElevatedButton(
                                text: AppLocalizations.of(context)!.exit,
                                textStyle: AppStyles.regular20RobotoWhite,
                                suffixIconButton: Icon(Icons.exit_to_app,
                                    color: AppColor.white),
                                backgroundColor: AppColor.red,
                                center: true,
                                onPressed: () {
                                  MyServices.removeData(key: "Token");
                                  Navigator.of(context).pushReplacementNamed(
                                      LoginScreen.routeName);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  TabBar(
                    dividerColor: AppColor.transparent,
                    indicatorColor: AppColor.orange,
                    controller: _tabController,
                    tabs: [
                      Tab(
                        height: height * 0.09,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(ImageAssets.watchListIcon,
                                width: width * 0.05),
                            SizedBox(height: height * 0.01),
                            Text(
                              AppLocalizations.of(context)!.watch_list,
                              style: AppStyles.regular14RobotoWhite,
                            ),
                          ],
                        ),
                      ),
                      Tab(
                        height: height * 0.09,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              ImageAssets.historyIcon,
                              width: width * 0.05,
                            ),
                            SizedBox(height: height * 0.01),
                            Text(
                              AppLocalizations.of(context)!.history,
                              style: AppStyles.regular14RobotoWhite,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.6,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        BlocBuilder<WatchListViewModel, WatchListState>(
                          bloc: watchListViewModel,
                          builder: (context, state) {
                            if (state is WatchListLoadingState) {
                              return Center(child: CircularProgressIndicator());
                            } else if (state is WatchListErrorState) {
                              return Center(child: Text(state.errorMessage));
                            } else if (watchListViewModel.allFavoritesList ==
                                    null ||
                                watchListViewModel.allFavoritesList!.isEmpty) {
                              return Center(
                                child:
                                    Image.asset(ImageAssets.emptyListProfile),
                              );
                            }
              
                            ///favorite
                            return GridView.builder(
                                itemCount:
                                    watchListViewModel.allFavoritesList!.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 10,
                                        childAspectRatio: 2 / 3,
                                        mainAxisSpacing: 10),
                                itemBuilder: (context, index) {
                                  return MovieWidget(
                                    onTap: () {
                                      MovieDetailsViewModel.instance
                                          .getMovieById(watchListViewModel
                                              .allFavoritesList![index].movieId!
                                              .toString());
                                      Navigator.of(context).pushNamed(
                                          MovieDetailsScreen.routeName);
                                    },
                                    imageUrl: watchListViewModel
                                            .allFavoritesList![index]
                                            .imageURL ??
                                        "",
                                    ratingText: watchListViewModel
                                        .allFavoritesList![index].rating
                                        .toString(),
                                  );
                                });
                          },
                        ),
              
                        ///history
                        BlocBuilder<HistoryViewModel, HistoryState>(
                          bloc: context.read<HistoryViewModel>(),
                          builder: (context, state) {
                            if (state is HistoryLoadingState) {
                              return Center(child: CircularProgressIndicator());
                            } else if (state is HistoryErrorState) {
                              return Center(child: Text(state.errorMessage));
                            } else if (state is HistorySuccessState) {
                              if (state.historyMovies.isEmpty) {
                                return Center(
                                    child: Image.asset(
                                        ImageAssets.emptyListProfile));
                              } else {
                                return GridView.builder(
                                    itemCount: state.historyMovies.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 10,
                                            childAspectRatio: 2 / 3,
                                            mainAxisSpacing: 10),
                                    itemBuilder: (context, index) {
                                      return MovieWidget(
                                        onTap: () {
                                          MovieDetailsViewModel.instance
                                              .getMovieById(state
                                                  .historyMovies[index].id!
                                                  .toString());
                                          Navigator.of(context).pushNamed(
                                              MovieDetailsScreen.routeName);
                                        },
                                        imageUrl: state.historyMovies[index]
                                                .largeCoverImage ??
                                            "",
                                        ratingText: state
                                            .historyMovies[index].rating
                                            .toString(),
                                      );
                                    });
                              }
                            }
                            return SizedBox();
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
