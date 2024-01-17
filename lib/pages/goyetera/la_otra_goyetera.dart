import 'package:desde_cero/pages/alertDialogs/alert_dialogs.dart';
import 'package:desde_cero/pages/consumirApi/consumir_api.dart';
import 'package:desde_cero/pages/consumirApi/consumir_con_http.dart';
import 'package:flutter/material.dart';

class PaginaGoyetera extends StatelessWidget {
  const PaginaGoyetera({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'menu de ejemplos',
        ),
        backgroundColor: const Color.fromARGB(
          255,
          81,
          143,
          235,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://static2.bigstockphoto.com/9/1/2/large1500/219537391.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                botonGeneral(
                  context,
                  titulo: 'Alert Dialogs',
                  paginaDestino: () => const AlertDialogs(),
                ),
                botonGeneral(
                  context,
                  titulo: 'las mamaCITAS',
                  paginaDestino: () => const ConsumirApi(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                botonGeneral(
                  context,
                  titulo: "HttpCitas",
                  paginaDestino: () => const ConsumirConHttp(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget botonGeneral(
  context, {
  required String titulo,
  required Widget Function() paginaDestino,
}) {
  return Padding(
    padding: const EdgeInsets.all(
      8.0,
    ),
    child: SizedBox(
      height: 50,
      width: 150,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.blueAccent,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => paginaDestino(),
            ),
          );
        },
        child: Text(
          titulo,
          style: const TextStyle(
            fontSize: 14.0,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
