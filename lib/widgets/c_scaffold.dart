import 'package:flutter/material.dart';

class CScaffold extends StatelessWidget {
  const CScaffold({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1E4E62),
              Color(0xFF2D948D),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(padding: const EdgeInsets.fromLTRB(50, 0, 50, 0), child: child),
        ),
      ),
    );
  }
}
