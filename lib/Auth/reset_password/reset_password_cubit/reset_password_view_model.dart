import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Auth/reset_password/reset_password_cubit/reset_password_interface.dart';
import 'package:movies/Auth/reset_password/reset_password_cubit/reset_password_states.dart';

import '../../../utils/api_manager.dart';

class ResetPasswordViewModel extends Cubit<ResetPasswordState> {
  ResetPasswordViewModel() : super(ResetInitial());

  late ResetPasswordInterface navigator;
  var oldPasswordController = TextEditingController(text: "Ahmed@55");
  var newPasswordController = TextEditingController(text: "Ahmed@555");
  var formKey = GlobalKey<FormState>();

  void resetPassword() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    emit(ResetLoading());
    navigator.showLoading("Loading...");

    try {
      var response = await ApiManager.resetPassword(
          oldPass: oldPasswordController.text,
          newPass: newPasswordController.text);

      if (response!.message! == "Password updated successfully") {
        emit(ResetSuccess());
        navigator.hideLoading();
        navigator.showMessage("password has been changed successfully");
      } else {
        emit(ResetFailure(response.message!));
        navigator.hideLoading();
        navigator.showMessage("${response.message}");
      }
    } catch (e) {
      emit(ResetFailure(e.toString()));
      navigator.hideLoading();
    }
  }
}
