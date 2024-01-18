import 'package:flutter/material.dart';

Widget bottonNavigationBar(BuildContext context) {
  return BottomNavigationBar(
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'perfil',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'configuración',
      ),
    ],
  );
}
