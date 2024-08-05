import 'package:flutter/material.dart';

class PincayNickNuevoUsuario extends StatelessWidget {
  const PincayNickNuevoUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nuevo Usuario',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
