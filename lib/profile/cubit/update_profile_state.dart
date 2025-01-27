abstract class UpdateProfileState {}

class LoadingProfile extends UpdateProfileState {}

class UserData extends UpdateProfileState {
  String currentAvatar;
  String userName;
  String userPhone;
  UserData(
      {required this.currentAvatar,
      required this.userName,
      required this.userPhone});
}

class ChangeAvatar extends UpdateProfileState {
  String newAvatar;
  ChangeAvatar({required this.newAvatar});
}
