import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies/Auth/Login/cubit/login_interface.dart';
import 'package:movies/Auth/Login/cubit/login_screen_state.dart';
import 'package:movies/services.dart';
import 'package:movies/utils/api_manager.dart';

class LoginScreenViewModel extends Cubit<LoginState> {
  LoginScreenViewModel() : super(LoginInitial());

  late LoginInterface navigator;
  var userEmailController =
      TextEditingController(text: "look.mahmoud172@gmail.com");
  var passwordController = TextEditingController(text: "Mahmoud172@");
  var formKey = GlobalKey<FormState>();
  GoogleSignInAccount? userData;
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
        MyServices.setString("Token", response.data!);
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

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<GoogleSignInAccount?> loginWithGoogle() async {
    final user = await _googleSignIn.signIn();
    if (user != null) {
      userData = user;
      //loginsuccess
      emit(LoginFailure(user.email));
    }
    return null;
  }
}
