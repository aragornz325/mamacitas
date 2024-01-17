import 'package:flutter/material.dart';

Widget DrawerPrincipal(BuildContext context) {
  return Drawer(
    backgroundColor: Colors.cyan,
    child: ListView(
      children: <Widget>[
        LineasDrawer(
          texto: 'configura mamaCitas',
          icono: Icons.settings,
        ),
        LineasDrawer(
          texto: "tu saldo",
          icono: Icons.monetization_on,
        ),
        SizedBox(height: 16), // Espacio entre las dos primeras líneas y la última
        Container(
          color: Colors.grey,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text('todos los derechos reservados'),
            ),
          ),
        )
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
