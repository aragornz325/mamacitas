import 'package:flutter/material.dart';

Widget DrawerPrincipal(BuildContext context) {
  return Drawer(
    backgroundColor: Colors.cyan,
    child: Column(
      children: <Widget>[
        LineasDrawer(
          texto: 'configura mamaCitas',
          icono: Icons.settings,
        ),
        LineasDrawer(
          texto: "tu saldo",
          icono: Icons.monetization_on,
        ),
      ],
    ),
  );
}

Widget LineasDrawer({
  required String texto,
  required IconData icono,
}) {
  return Padding(
    padding: const EdgeInsets.all(3.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Icon(icono), Text(texto)],
    ),
  );
}
