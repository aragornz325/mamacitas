import 'package:desde_cero/pages/alertDialogs/block_suscripcion/bloc_suscripcion.dart';
import 'package:desde_cero/pages/goyetera/la_otra_goyetera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(
      const MiApp(),
    );

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocSuscripcionBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'mi app',
        home: Inicio(),
      ),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cuerpo(context),
    );
  }
}

Widget cuerpo(context) {
  return AnimatedContainer(
    duration: const Duration(
      seconds: 1,
    ),
    decoration: const BoxDecoration(
      image: DecorationImage(
          image: NetworkImage(
            'https://www.angelesmex.com/wp-content/uploads/2022/02/Aguerridas-putas-Mexico.jpg',
          ),
          fit: BoxFit.cover),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          nombre(),
          campoUsuario(),
          campoContrasena(),
          boton(context),
        ],
      ),
    ),
  );
}

Widget nombre() {
  return const Padding(
    padding: EdgeInsets.all(
      8.0,
    ),
    child: Text(
      'mamaCITAS',
      style: TextStyle(
        color: Colors.white,
        fontSize: 35.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget boton(context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PaginaGoyetera(),
        ),
      );
    },
    child: const Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          'Metele',
          style: TextStyle(fontSize: 18.0),
        ),
        SizedBox(
          width: 9.0,
        ),
        Icon(Icons.ads_click_outlined),
      ],
    ),
  );
}

Widget campoUsuario() {
  return AnimatedContainer(
    duration: Duration(
      seconds: 1,
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 3,
    ),
    child: const TextField(
      decoration: InputDecoration(
        hintText: "user",
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}

Widget campoContrasena() {
  return AnimatedContainer(
    duration: Duration(
      seconds: 1,
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 3,
    ),
    child: const TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: "password",
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}
