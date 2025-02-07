abstract class ResetPasswordState {}

class ResetInitial extends ResetPasswordState {}

class ResetLoading extends ResetPasswordState {}

class ResetSuccess extends ResetPasswordState {}

class ResetFailure extends ResetPasswordState {
  final String message;

  ResetFailure(this.message);
}
