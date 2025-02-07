import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Auth/register/cubit/register_interface.dart';
import 'package:movies/Auth/register/cubit/register_screen_state.dart';
import 'package:movies/utils/api_manager.dart';

class RegisterScreenViewModel extends Cubit<RegisterState> {
  RegisterScreenViewModel() : super(RegisterInitial());

  late RegisterInterface navigator;

  var userNameController = TextEditingController(text: "mahmoud");
  var userEmailController =
      TextEditingController(text: "look.mahmoud172@gmail.com");
  var passwordController = TextEditingController(text: "Mahmoud172@");
  var confirmPasswordController = TextEditingController(text: "Mahmoud172@");
  var phoneController = TextEditingController(text: "+201032775681");
  int selectedAvatarId = 1;

  void selectAvatar(int id) {
    selectedAvatarId = id;
    print("Selected Avatar ID: $selectedAvatarId");
  }

  var formKey = GlobalKey<FormState>();

  void register() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    if (passwordController.text != confirmPasswordController.text) {
      emit(RegisterFailure("Passwords do not match"));
      return;
    }
    if (phoneController.text.length != 13) {
      emit(RegisterFailure("Phone number must be 11 digits"));
      return;
    }

    if (selectedAvatarId <= 0) {
      emit(RegisterFailure("Invalid avatar ID"));
      return;
    }

    emit(RegisterLoading());

    try {
      var response = await ApiManager.register(
          avaterId: selectedAvatarId,
          confirmPassword: confirmPasswordController.text,
          phone: phoneController.text,
          userEmail: userEmailController.text,
          userName: userNameController.text,
          userPassword: passwordController.text);

      if (response != null && response.message == "User created successfully") {
        emit(RegisterSuccess());
        navigator.navigateToScreen();
      } else {
        emit(RegisterFailure(response?.message ?? "Registration failed"));
      }
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    } finally {
      navigator.hideLoading();
    }
  }
}
