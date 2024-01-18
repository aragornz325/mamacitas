import 'package:flutter/material.dart';

Widget drawerPrincipal(BuildContext context) {
  return Drawer(
    backgroundColor: Colors.white.withOpacity(0.7),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SizedBox(
          height: 50.0,
        ),
        Expanded(
          child: Column(children: [
            lineasDrawer(
              context,
              texto: 'Configura mamaCitas',
              icono: Icons.settings,
            ),
            lineasDrawer(
              context,
              texto: "Tu saldo",
              icono: Icons.monetization_on,
            ),
            lineasDrawer(
              context,
              texto: "Chatea con nosotros",
              icono: Icons.chat,
            )
          ]),
        ),

        // Espacio entre las dos primeras líneas y la última
        Container(
          color: Colors.grey,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              textAlign: TextAlign.center,
              'todos los derechos reservados',
            ),
          ),
        )
      ],
    ),
  );
}

Widget lineasDrawer(
  context, {
  required String texto,
  required IconData icono,
}) {
  return Padding(
    padding: const EdgeInsets.all(3.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          icono,
          size: 30.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
          child: GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text(texto),
                        content: const Text(
                          'esta feature esta en camino pa!',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              'Cerrar',
                            ),
                          )
                        ],
                      ));
            },
            child: Text(
              texto,
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
