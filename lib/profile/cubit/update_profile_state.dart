abstract class UpdateProfileState {}

class InitState extends UpdateProfileState {}

class UserData extends UpdateProfileState {

}

class ChangeAvatar extends UpdateProfileState {
  String newAvatar;
  ChangeAvatar({required this.newAvatar});
}
