import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../../repositories/storage_repository.dart';
import '../../../shared/constants/enum.dart';
import '../../../shared/models/card_model.dart';

part 'save_text_controller.g.dart';

class SaveTextController = _SaveTextController with _$SaveTextController;

abstract class _SaveTextController with Store {
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  final TextEditingController dataController = TextEditingController();
  final LocalStorage localStorage = Modular.get<LocalStorage>();
  final FocusNode dataFocus = FocusNode();

  @observable
  String editCardId = '';

  @observable
  ObservableList<CardModel> listCards = ObservableList<CardModel>.of([]);

  @observable
  LoadState pageState = LoadState.success;

  bool get isValidated => formKey2.currentState!.validate();

  @action
  Future<void> loadCards() async {
    List<CardModel> auxList = await localStorage.getListCards();
    listCards = ObservableList<CardModel>.of([]);
    for (var i in auxList) {
      listCards.add(i);
    }
    await Future.delayed(const Duration(milliseconds: 1500));
  }

  @action
  Future<void> changePageState(LoadState state) async {
    pageState = state;
  }

  @action
  void editText(CardModel card) {
    editCardId = card.id;
    dataController.text = card.text;
    listCards = ObservableList<CardModel>.of(listCards.toList()); // Apenas para trigar o observer
    dataFocus.requestFocus();
  }

  Future<void> initPage() async {
    changePageState(LoadState.loading);
    editCardId = '';
    dataController.text = '';
    await loadCards();
    changePageState(LoadState.success);
    dataFocus.requestFocus();
  }

  Future<void> saveText() async {
    changePageState(LoadState.loading);
    if (editCardId == '') {
      CardModel card = CardModel(id: '', text: dataController.text);
      await localStorage.saveNewCard(card);
    } else {
      CardModel card = CardModel(id: editCardId, text: dataController.text);
      await localStorage.updateCard(card);
    }
    await initPage();
    changePageState(LoadState.success);
    dataFocus.requestFocus();
  }

  Future<void> deleteText(String id) async {
    changePageState(LoadState.loading);
    await localStorage.deleteCard(id);
    editCardId = '';
    dataController.text = '';
    loadCards();
    changePageState(LoadState.success);
    dataFocus.requestFocus();
  }
}
