abstract class UpdateProfileState {}

class InitState extends UpdateProfileState {}

class UpdateProfileLoadingState extends UpdateProfileState {}

class UpdateProfileErrorState extends UpdateProfileState {
  String message;
  UpdateProfileErrorState({required this.message});
}

class UpdateProfileSuccessState extends UpdateProfileState {}

class ChangeAvatar extends UpdateProfileState {
  String newAvatar;
  ChangeAvatar({required this.newAvatar});
}
