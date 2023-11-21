import 'package:flutter/material.dart';
import '../shared/models/card_model.dart';

class CardText extends StatelessWidget {
  const CardText({required this.card, required this.onTapEdit, required this.onTapDelete, this.isEdit = false, super.key});

  final CardModel card;
  final void Function()? onTapEdit;
  final void Function()? onTapDelete;
  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isEdit ? Colors.green : Colors.white,
        border: Border.all(color: Colors.black,width: 1.5),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          Text(card.text, style: const TextStyle(fontSize: 18), maxLines: 1, overflow: TextOverflow.ellipsis),
          const Spacer(),
          InkWell(onTap: onTapEdit, child: Ink(child: const Icon(Icons.edit))),
          const SizedBox(width: 20),
          InkWell(
              onTap: onTapDelete,
              child: Ink(
                  child: const Icon(
                Icons.delete_forever,
                color: Colors.red,
              ))),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
