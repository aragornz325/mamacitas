import 'package:desde_cero/pages/alertDialogs/block_suscripcion/bloc_suscripcion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlertDialogs extends StatelessWidget {
  const AlertDialogs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(
          255,
          81,
          143,
          235,
        ),
        title: const Text(
          'alert dialogs',
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://wallpapers.com/images/hd/hot-girls-and-sexy-photos-green-bikini-woman-lhfl5y2vdn3qb0ax.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Center(
                heightFactor: 5.0,
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Centrar contenido en Row
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(
                              255,
                              236,
                              16,
                              0,
                            ),
                          ),
                        ),
                        onPressed: () {
                          _mostrarAlerta(
                            context,
                            () {
                              context.read<BlocSuscripcionBloc>().add(
                                    const BlocSuscripcionEventSuscribirse(
                                      flagSuscripcion: true,
                                    ),
                                  );
                              Navigator.pop(context);
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                          child: BlocBuilder<BlocSuscripcionBloc,
                              BlocSuscripcionState>(
                            builder: (context, state) {
                              return Text(
                                state.flagSuscripcion
                                    ? 'suscripto a mamaCITAS'
                                    : 'Suscribirse a mamaCITAS',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    BlocBuilder<BlocSuscripcionBloc, BlocSuscripcionState>(
                      builder: (context, state) {
                        return Text(
                          state.flagSuscripcion ? 'suscripto' : 'no suscripto',
                          style: const TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(), // Empuja el botón hacia abajo
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'volver',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Tu método _mostrarAlerta se mantiene igual:
void _mostrarAlerta(
  BuildContext context,
  VoidCallback suscribirse,
) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog(
      title: const Text(
        'Como te gusta!!!!',
        style: TextStyle(fontSize: 24),
      ),
      content: const Text('dale que estan todas buenas!'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('cacelar'),
        ),
        TextButton(
          onPressed: suscribirse,
          child: const Text('mavaleeee!'),
        ),
      ],
    ),
  );
}
