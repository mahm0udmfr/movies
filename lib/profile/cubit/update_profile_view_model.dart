import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/profile/cubit/update_profile_state.dart';
import 'package:movies/utils/imageassets.dart';

class UpdateProfileViewModel extends Cubit<UpdateProfileState> {
  UpdateProfileViewModel() : super(LoadingProfile());

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
  String currentAvatar = avatarsList[0];

  void getUserDetails() {
    emit(LoadingProfile());
    emit(UserData(
        currentAvatar: currentAvatar,
        userName: "Mahmoud Ramadan",
        userPhone: "01111111111"));
    return;
  }

  void changeAvatar(String newAvatar) {
    emit(ChangeAvatar(newAvatar: newAvatar));
    return;
  }
}
