import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_page_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController pwController = TextEditingController();

  bool get isValidated => formKey.currentState!.validate();

  void trimText(){
    userController.text = userController.text.trim();
  }
}