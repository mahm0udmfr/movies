import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/profile/cubit/update_profile_interface.dart';
import 'package:movies/profile/cubit/update_profile_state.dart';
import 'package:movies/tabs/profileTab/cubit/profile_tab_view_model.dart';
import 'package:movies/utils/api_manager.dart';
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
  late UpdateProfileInterface navigator;
  var formKey = GlobalKey<FormState>();
  late String currentAvatar;
  TextEditingController userName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  void getUserDetails() {
    currentAvatar = avatarsList[viewModel.userData.avaterId!];
    userName.text = viewModel.userData.name!;
    phoneNumber.text = viewModel.userData.phone!;
  }

  void updateProfile() async {
    if (!formKey.currentState!.validate()) return;

    emit(UpdateProfileLoadingState());
    navigator.showLoading("Loading...");

    try {
      final response = await ApiManager.updateUserNameAndPhone(
        userName: userName.text,
        phone: phoneNumber.text,
        avaterId: avatarsList.indexOf(currentAvatar),
      );

      if (response?.message == "Profile updated successfully") {
        emit(UpdateProfileSuccessState());
        viewModel.getUserData();
        navigator.navigateToScreen();
      } else {
        emit(UpdateProfileErrorState(
            message: response?.message ?? "Unknown error"));
      }
    } catch (e) {
      emit(UpdateProfileErrorState(message: e.toString()));
    } finally {
      navigator.hideLoading();
    }
  }

  void deleteProfile() async {
    emit(UpdateProfileLoadingState());
    navigator.showLoading("Loading...");

    try {
      final response = await ApiManager.deleteProfile();

      if (response?.message == "Profile deleted successfully") {
        emit(UpdateProfileSuccessState());
        navigator.exitApp();
        
      } else {
        emit(UpdateProfileErrorState(
            message: response?.message ?? "Unknown error"));
      }
    } catch (e) {
      emit(UpdateProfileErrorState(message: e.toString()));
    } finally {
      navigator.hideLoading();
    }
  }

  void changeAvatar(String newAvatar) {
    emit(ChangeAvatar(newAvatar: newAvatar));
    return;
  }
}
