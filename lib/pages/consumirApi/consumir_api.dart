import 'package:flutter/material.dart';

class ConsumirApi extends StatefulWidget {
  const ConsumirApi({super.key});

  @override
  State<ConsumirApi> createState() => _ConsumirApiState();
}

class _ConsumirApiState extends State<ConsumirApi> {
  List<MamaCita> mamacitas = [
    MamaCita(
        'https://pbs.twimg.com/profile_images/641661554820190208/0pekIUcN_400x400.jpg',
        'Angelina',
        'Jolie',
        '52',
        '5555555555'),
    MamaCita(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBRDduv7hrViPn4uqKRunPkP4uWBxkhDwqRSRoqXYnQdVdoprk5JQYX-pR2_AhmbUgv2M&usqp=CAU',
        'Lupita',
        'Perez',
        '25',
        '5555555555'),
    MamaCita(
        'https://pbs.twimg.com/profile_images/614135843477921792/ZFXvUOn1_400x400.png',
        'Marta',
        'Gomez',
        '63',
        '5555555555'),
    MamaCita(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWK7NQtOmQv4_jlLeVG9Jhzw2jTjWGg8C58_NfAJbJAsGKWi601jSiDaLYBmsu8Lqu9Ts&usqp=CAU',
        'Maria',
        'Jimenez',
        '26',
        '5555555555'),
    MamaCita(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQM-Ees3AQyRqXWu92RhcKTUXZTXeKxR8TY5luBfgz-X_PZWX78Y28NRsl9_H3Ku9eC&usqp=CAU',
        'Linda',
        'Hamilton',
        '19',
        '5555555555'),
    MamaCita(
        'https://b.thumbs.redditmedia.com/9ESHL1mhquayV_RqLEugDrvMlowUCMXzhpstOW2z41E.png',
        'Jessica',
        'Alba',
        '25',
        '5555555555'),
    MamaCita(
        'https://pbs.twimg.com/profile_images/712209354695450624/B5yERjA1_400x400.jpg',
        'Marisa',
        'Alvarez',
        '25',
        '5555555555'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Las mamaCITAS'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://myhotposters.com/cdn/shop/products/mC0308_50e9cf72-8362-434e-86fa-b87eaae97274_1024x1024.jpg?v=1571444632',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: mamacitas.length,
          itemBuilder: (context, index) {
            return ListTile(
              onLongPress: () {
                _borrarMamaCita(
                  context,
                  mamacitas,
                );
              },
              title: Text(
                mamacitas[index].name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                  fontSize: 24.0,
                ),
              ),
              subtitle: Text(
                mamacitas[index].lastName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 24.0,
                ),
              ),
              leading: CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(
                  mamacitas[index].avatar,
                  headers: {"Accept": "application/json"},
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/detalle',
                    arguments: mamacitas[index]);
              },
            );
          },
        ),
      ),
    );
  }

  _borrarMamaCita(context, mamacitas) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text(
          textAlign: TextAlign.center,
          'Contactar la mamaCita!',
        ),
        content: const Text(
          textAlign: TextAlign.center,
          ' vos podes!, vas a contactar a la mamaCita',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(
                context,
              );
            },
            child: const Text(
              'Cancelar',
            ),
          ),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => teLaCreiste(),
              );
            },
            child: const Text(
              'venga el numero!',
            ),
          ),
        ],
      ),
    );
  }
}

Widget teLaCreiste() {
  return const AlertDialog(
    title: Text(
      'Segui participando',
    ),
    content: Text(
      'estas en la version FREE... paga laucha',
    ),
  );
}

class MamaCita {
  String avatar;
  String name;
  String lastName;
  String age;
  String phone;

  MamaCita(this.avatar, this.name, this.lastName, this.age, this.phone);
}


// List<MamaCita> mamacitas = [
//     MamaCita(
//         'https://pbs.twimg.com/profile_images/641661554820190208/0pekIUcN_400x400.jpg',
//         'Angelina',
//         'Jolie',
//         '52',
//         '5555555555'),
//     MamaCita(
//         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBRDduv7hrViPn4uqKRunPkP4uWBxkhDwqRSRoqXYnQdVdoprk5JQYX-pR2_AhmbUgv2M&usqp=CAU',
//         'Lupita',
//         'Perez',
//         '25',
//         '5555555555'),
//     MamaCita(
//         'https://pbs.twimg.com/profile_images/614135843477921792/ZFXvUOn1_400x400.png',
//         'Marta',
//         'Gomez',
//         '63',
//         '5555555555'),
//     MamaCita(
//         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWK7NQtOmQv4_jlLeVG9Jhzw2jTjWGg8C58_NfAJbJAsGKWi601jSiDaLYBmsu8Lqu9Ts&usqp=CAU',
//         'Maria',
//         'Jimenez',
//         '26',
//         '5555555555'),
//     MamaCita(
//         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQM-Ees3AQyRqXWu92RhcKTUXZTXeKxR8TY5luBfgz-X_PZWX78Y28NRsl9_H3Ku9eC&usqp=CAU',
//         'Linda',
//         'Hamilton',
//         '19',
//         '5555555555'),
//     MamaCita(
//         'https://b.thumbs.redditmedia.com/9ESHL1mhquayV_RqLEugDrvMlowUCMXzhpstOW2z41E.png',
//         'Jessica',
//         'Alba',
//         '25',
//         '5555555555'),
//     MamaCita(
//         'https://pbs.twimg.com/profile_images/712209354695450624/B5yERjA1_400x400.jpg',
//         'Marisa',
//         'Alvarez',
//         '25',
//         '5555555555'),
//   ]