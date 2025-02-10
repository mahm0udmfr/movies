abstract class ProfileTabState {}

class ProfileLoadingState extends ProfileTabState {}

class ProfileErrorState extends ProfileTabState {
  String errorMessage;
  ProfileErrorState({required this.errorMessage});
}

class ProfileSuccessState extends ProfileTabState {}

