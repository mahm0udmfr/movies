import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Auth/Login/cubit/login_interface.dart';
import 'package:movies/Auth/Login/cubit/login_screen_state.dart';
import 'package:movies/utils/api_manager.dart';

class LoginScreenViewModel extends Cubit<LoginState> {
  LoginScreenViewModel() : super(LoginInitial());

  late LoginInterface navigator;
  var userEmailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    emit(LoginLoading());
    navigator.showLoading("Loading...");

    try {
      var response = await ApiManager.loginByEmailAndPassword(
          userEmailController.text, passwordController.text);

      if (response!.message! == "Success Login") {
        emit(LoginSuccess());
        navigator.hideLoading();
        navigator.navigateToScreen();
      } else {
        emit(LoginFailure(response.message!));
        navigator.hideLoading();
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
      navigator.hideLoading();
    }
  }
}
