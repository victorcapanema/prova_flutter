import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CDeleteAlertDialog extends StatelessWidget {
  const CDeleteAlertDialog({required this.functionDelete, this.id = '', Key? key})
      : super(key: key);
  final void Function() functionDelete;
  final String id;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(10.0))),
      title: const Text('ATENÇÃO!', style: TextStyle(color: Colors.red)),
      content: RichText(
          text: const TextSpan(children: [
            TextSpan(text: 'Você deseja ',style: TextStyle(color: Colors.black)),
            TextSpan(text: 'DELETAR ', style: TextStyle(color: Colors.red)),
            TextSpan(text: 'o texto?',style: TextStyle(color: Colors.black))
          ])),
      actions: <Widget>[
        TextButton(
          style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.grey)),
          onPressed: () => Modular.to.pop(),
          child: const Text('Não', style: TextStyle(color: Colors.black)),
        ),
        TextButton(
          style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.grey)),
          onPressed: () => {functionDelete(), Modular.to.pop()},
          child: const Text('Sim', style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
