import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prova/widgets/c_text_form_field.dart';
import '../../../shared/constants/validator.dart';
import '../../../widgets/c_button_privacy_policy.dart';
import '../../../widgets/c_scaffold.dart';
import '../../../widgets/card_text.dart';
import '../../../widgets/delete_alert_dialog.dart';
import '../../../widgets/widget_selector.dart';
import '../controller/save_text_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SaveTextPage extends StatefulWidget {
  const SaveTextPage({super.key});

  @override
  State<SaveTextPage> createState() => _SaveTextPageState();
}

class _SaveTextPageState extends State<SaveTextPage> {
  final saveTextController = Modular.get<SaveTextController>();

  @override
  void initState() {
    super.initState();
    saveTextController.initPage();
  }

  @override
  Widget build(BuildContext context) {
    return CScaffold(
      child: Form(
        key: saveTextController.formKey2,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Container(
                      height: 300,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                      ),
                      child: Observer(
                        builder: (_) => WidgetSelector(
                          errorMessage: 'Erro ao recuperar informações!',
                          state: saveTextController.pageState,
                          widget: ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: saveTextController.listCards.length,
                            itemBuilder: (context, i) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                                child: CardText(
                                  isEdit: saveTextController.editCardId == saveTextController.listCards[i].id,
                                  card: saveTextController.listCards[i],
                                  onTapEdit: () {
                                    saveTextController.editText(saveTextController.listCards[i]);
                                  },
                                  onTapDelete: () {
                                    showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) => CDeleteAlertDialog(functionDelete: () {
                                              saveTextController.deleteText(saveTextController.listCards[i].id);
                                            }));
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    CTextFormField(
                      focusNode: saveTextController.dataFocus,
                      controller: saveTextController.dataController,
                      hintText: 'Digite seu texto',
                      maxLines: null,
                      validator: Validator.validateData,
                      textInputAction: TextInputAction.go,
                      onFieldSubmitted: (value) {
                        if (saveTextController.isValidated) {
                          saveTextController.saveText();
                        }
                      },
                    ),
                    const SizedBox(height: 50),
                    const Spacer(),
                    CButtonPrivacyPolicy(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
