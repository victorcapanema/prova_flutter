import 'dart:convert';
import '../services/shared_preferences_service.dart';
import '../shared/models/card_model.dart';

class LocalStorage {
  final SharedPreferenceService storageService;

  LocalStorage({required this.storageService});

  Future<void> saveNewCard(CardModel card) async {
    card.id = await getNewId();
    List<String> resp = await storageService.readUserData();
    resp.add(json.encode(card));
    await storageService.saveUserData(resp, id: int.parse(card.id));
  }

  Future<void> updateCard(CardModel card) async {
    List<String> resp = await storageService.readUserData();
    List<CardModel> listCards = resp.map((e) => CardModel.fromJson(json.decode(e))).toList();
    int index = listCards.indexWhere((e) => e.id == card.id);
    resp[index] = json.encode(card);
    await storageService.saveUserData(resp);
  }

  Future<void> deleteCard(String id) async {
    List<String> resp = await storageService.readUserData();
    List<CardModel> listCards = resp.map((e) => CardModel.fromJson(json.decode(e))).toList();
    resp.removeAt(listCards.indexWhere((e) => e.id == id));
    await storageService.saveUserData(resp);
  }

  Future<List<CardModel>> getListCards() async {
    var resp = await storageService.readUserData();
    return resp.isNotEmpty ? resp.map((e) => CardModel.fromJson(json.decode(e))).toList() : [];
  }

  Future<String> getNewId() async {
    return (await storageService.readLastId() + 1).toString();
  }

  Future<void> deleteAll() async {
    await storageService.deleteAll();
  }
}
