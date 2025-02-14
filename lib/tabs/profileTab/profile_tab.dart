import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies/Auth/Login/loginscreen.dart';
import 'package:movies/profile/updateprofile.dart';
import 'package:movies/tabs/profileTab/cubit/profile_tab_state.dart';
import 'package:movies/tabs/profileTab/cubit/profile_tab_view_model.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/imageassets.dart';
import 'package:movies/widget/custom_elevated_button.dart';

import '../browse_screen/movies_list.dart';

class ProfileTab extends StatefulWidget {
   static const String routename = "profileTab";
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  ProfileTabViewModel viewModel = ProfileTabViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.getUserData();
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
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProfileErrorState) {
              return Center(
                child: Text(state.errorMessage),
              );
            }
            if (state is ProfileSuccessState) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      color: AppColor.grey,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(viewModel
                                .avatarsList[viewModel.userData.avaterId!]),
                          ),
                          SizedBox(height: 10),
                          Text(
                            viewModel.userData.name!,
                            style: AppStyles.regular20RobotoWhite,
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "12",
                                    style: AppStyles.bold24White,
                                  ),
                                  Text(
                                    "Wish List",
                                    style: AppStyles.bold24White,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "10",
                                    style: AppStyles.bold24White,
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!.history,
                                    style: AppStyles.bold24White,
                                  ),
                                ],
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
                                  text: AppLocalizations.of(context)!
                                      .edit_profile,
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
                                      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                                  },
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Column(
                                  children: [
                                    Image.asset(ImageAssets.watchListIcon,
                                        width: width * 0.2),
                                    SizedBox(height: height * 0.01),
                                    Text("Watch List",
                                        style: AppStyles.regular20RobotoWhite),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Column(
                                  children: [
                                    Image.asset(ImageAssets.historyIcon,
                                        width: width * 0.1),
                                    SizedBox(height: height * 0.01),
                                    Text(AppLocalizations.of(context)!.history,
                                        style: AppStyles.regular20RobotoWhite),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 7,
                        mainAxisSpacing: 7,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Movieslist();
                      },
                    ),
                  ],
                ),
              );
            }
            return SizedBox();
          }),
    );
  }
}
