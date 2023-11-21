import 'package:flutter/services.dart';

class Validator {

  static String? validatePassword(String? valuePassword) {
    if (valuePassword == null || valuePassword.isEmpty) {
      return 'Por favor, informe a senha.';
    }
    if (valuePassword.length < 2){
      return 'Por favor, informe uma senha válida.';
    }
    return null;
  }

  static String? validateUser(String? valueUser) {
    if (valueUser == null || valueUser.isEmpty) {
      return 'Por favor, informe o Usuário.';
    }
    return null;
  }

  static String? validateData(String? valueUser) {
    if (valueUser == null || valueUser.isEmpty) {
      return 'Por favor, informe um texto.';
    }
    return null;
  }

  static List<TextInputFormatter> inputTextField() {
    return <TextInputFormatter>[
      LengthLimitingTextInputFormatter(20),
    ];
  }

  static List<TextInputFormatter> inputPW() {
    return <TextInputFormatter>[
      FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
      LengthLimitingTextInputFormatter(20),
    ];
  }

}