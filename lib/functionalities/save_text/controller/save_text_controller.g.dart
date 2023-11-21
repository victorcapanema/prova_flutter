// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_text_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SaveTextController on _SaveTextController, Store {
  late final _$editCardIdAtom =
      Atom(name: '_SaveTextController.editCardId', context: context);

  @override
  String get editCardId {
    _$editCardIdAtom.reportRead();
    return super.editCardId;
  }

  @override
  set editCardId(String value) {
    _$editCardIdAtom.reportWrite(value, super.editCardId, () {
      super.editCardId = value;
    });
  }

  late final _$listCardsAtom =
      Atom(name: '_SaveTextController.listCards', context: context);

  @override
  ObservableList<CardModel> get listCards {
    _$listCardsAtom.reportRead();
    return super.listCards;
  }

  @override
  set listCards(ObservableList<CardModel> value) {
    _$listCardsAtom.reportWrite(value, super.listCards, () {
      super.listCards = value;
    });
  }

  late final _$pageStateAtom =
      Atom(name: '_SaveTextController.pageState', context: context);

  @override
  LoadState get pageState {
    _$pageStateAtom.reportRead();
    return super.pageState;
  }

  @override
  set pageState(LoadState value) {
    _$pageStateAtom.reportWrite(value, super.pageState, () {
      super.pageState = value;
    });
  }

  late final _$loadCardsAsyncAction =
      AsyncAction('_SaveTextController.loadCards', context: context);

  @override
  Future<void> loadCards() {
    return _$loadCardsAsyncAction.run(() => super.loadCards());
  }

  late final _$changePageStateAsyncAction =
      AsyncAction('_SaveTextController.changePageState', context: context);

  @override
  Future<void> changePageState(LoadState state) {
    return _$changePageStateAsyncAction.run(() => super.changePageState(state));
  }

  late final _$_SaveTextControllerActionController =
      ActionController(name: '_SaveTextController', context: context);

  @override
  void editText(CardModel card) {
    final _$actionInfo = _$_SaveTextControllerActionController.startAction(
        name: '_SaveTextController.editText');
    try {
      return super.editText(card);
    } finally {
      _$_SaveTextControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
editCardId: ${editCardId},
listCards: ${listCards},
pageState: ${pageState}
    ''';
  }
}
