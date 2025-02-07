import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/profile/cubit/update_profile_state.dart';
import 'package:movies/tabs/profileTab/cubit/profile_tab_view_model.dart';
import 'package:movies/utils/imageassets.dart';

class UpdateProfileViewModel extends Cubit<UpdateProfileState> {
  UpdateProfileViewModel() : super(InitState());

  ProfileTabViewModel viewModel = ProfileTabViewModel();
  static List avatarsList = [
    ImageAssets.avatar1,
    ImageAssets.avatar2,
    ImageAssets.avatar3,
    ImageAssets.avatar4,
    ImageAssets.avatar5,
    ImageAssets.avatar6,
    ImageAssets.avatar7,
    ImageAssets.avatar8,
    ImageAssets.avatar9,
  ];

  late String currentAvatar;
  TextEditingController userName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  void getUserDetails() {
    currentAvatar = avatarsList[viewModel.userData.avaterId!];
    userName.text = viewModel.userData.name!;
    phoneNumber.text = viewModel.userData.phone!;
  }

  void changeAvatar(String newAvatar) {
    emit(ChangeAvatar(newAvatar: newAvatar));
    return;
  }
}
