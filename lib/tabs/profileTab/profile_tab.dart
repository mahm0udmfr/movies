import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/profile/updateprofile.dart';
import 'package:movies/tabs/profileTab/cubit/profile_tab_state.dart';
import 'package:movies/tabs/profileTab/cubit/profile_tab_view_model.dart';
import 'package:movies/utils/app_styles.dart';

class ProfileTab extends StatefulWidget {
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
              return Center(
                child: Column(
                  children: [
                    Text(viewModel.userData.name!,style: AppStyles.bold20Orange,),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(Updateprofile.routename);
                        },
                        child: Text("Edit Profile")),
                  ],
                ),
              );
            }
            return SizedBox();
          }),
    );
  }
}
