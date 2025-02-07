import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/model/user_model.dart';
import 'package:movies/tabs/profileTab/cubit/profile_tab_state.dart';
import 'package:movies/utils/api_manager.dart';
import 'package:movies/utils/imageassets.dart';

class ProfileTabViewModel extends Cubit<ProfileTabState> {
  static final ProfileTabViewModel _instance = ProfileTabViewModel._internal();

  factory ProfileTabViewModel() {
    return _instance;
  }

  ProfileTabViewModel._internal() : super(ProfileLoadingState());
  late UserData userData;

   List avatarsList = [
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
  void getUserData() async {
    try {
      emit(ProfileLoadingState());
      var response = await ApiManager.getUserData();
      if (response == null) {
        emit(ProfileErrorState(errorMessage: "Failed to fetch user data."));
        return;
      }

      if (response.message == 'Profile fetched successfully' &&
          response.userdata != null) {
        userData = response.userdata!;
        emit(ProfileSuccessState());
        return;
      } else {
        emit(ProfileErrorState(errorMessage: response.message!));
        return;
      }
    } catch (e) {
      // Handle error here if needed
    }
  }
}
