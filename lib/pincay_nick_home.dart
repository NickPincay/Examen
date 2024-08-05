import 'package:flutter/material.dart';
import 'package:pincay_nick_examen/pincay_nick_consultar_usuario.dart';
import 'package:pincay_nick_examen/pincay_nick_nuevo_usuario.dart';
import 'package:pincay_nick_examen/pincay_nick_principal.dart';

class PincayNickHome extends StatefulWidget {
  const PincayNickHome({super.key});

  @override
  State<PincayNickHome> createState() => _PincayNickHomeState();
}

class _PincayNickHomeState extends State<PincayNickHome> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber.shade50,
        backgroundColor: Colors.orange.shade400,
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            label: 'Usuario',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person_search,
              color: Colors.black,
            ),
            label: 'Consulta',
          )
        ],
      ),
      body: [
        const PincayNickPrincipal(),
        const PincayNickNuevoUsuario(),
        const PincayNickConsultaUsuario(),
      ][currentPageIndex],
    );
  }
}
