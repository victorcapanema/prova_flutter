import 'package:flutter/material.dart';

class CElevatedButton extends StatelessWidget {
  const CElevatedButton({
    required this.text,
    this.function,
    this.isEnabled = true,
    Key? key,
  }) : super(key: key);
  final String text;
  final VoidCallback? function;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? function : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF44BC6E),
      //  minimumSize: Size(width, 20),
        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        textStyle: const TextStyle(fontSize: 18),
      ),
      child: Text(text),
    );
  }
}
