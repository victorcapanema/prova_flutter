import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../shared/constants/validator.dart';
import '../../../widgets/c_button_privacy_policy.dart';
import '../../../widgets/c_elevated_button.dart';
import '../../../widgets/c_scaffold.dart';
import '../../../widgets/c_text_form_field.dart';
import '../controller/login_page_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    return CScaffold(
      child: Form(
        key: loginController.formKey,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 200),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
                    child: Text(
                      'Usuário',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  CTextFormField(
                    prefixIcon: const Icon(Icons.person),
                    controller: loginController.userController,
                    validator: Validator.validateUser,
                    inputFormatter: Validator.inputTextField(),
                    autofocus: false,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 0, 5),
                    child: Text(
                      'Senha',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  CTextFormField(
                    prefixIcon: const Icon(Icons.lock),
                    controller: loginController.pwController,
                    validator: Validator.validatePassword,
                    inputFormatter: Validator.inputPW(),
                    obscureText: true,
                    autofocus: false,
                  ),
                  const SizedBox(height: 20),
                  Center(
                      child: CElevatedButton(
                    text: 'Entrar',
                    function: () {
                      loginController.trimText();
                      if (loginController.isValidated) {
                        Modular.to.pushNamed('/saveTextPage');
                      }
                    },
                  )),
                  const Spacer(),
                  CButtonPrivacyPolicy(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
