class CardModel {
  String id;
  String text;

  CardModel({required this.id, required this.text});

  @override
  String toString() {
    return 'id: $id, text: $text ';
  }

  CardModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        text = json['text'];

  Map<String, dynamic> toJson() => {"id": id, "text": text};
}
