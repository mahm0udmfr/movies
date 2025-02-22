import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCategoryViewModel extends Cubit<ScrollController> {
  ListCategoryViewModel() : super(ScrollController());

  void scrollToEnd() {
    state.animateTo(
      state.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  @override
  Future<void> close() {
    state.dispose();
    return super.close();
  }
}