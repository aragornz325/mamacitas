import 'dart:convert';

import 'package:desde_cero/models/gif.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// The class ConsumirConHttp is a Dart class that is used for consuming HTTP requests.
class ConsumirConHttp extends StatefulWidget {
  const ConsumirConHttp({super.key});

  @override
  State<ConsumirConHttp> createState() => _ConsumirConHttpState();
}

class _ConsumirConHttpState extends State<ConsumirConHttp> {
  Future<List<Gif>> _listadoDeGifts = Future<List<Gif>>.value([]);
  final url = Uri.parse(
      "https://api.giphy.com/v1/gifs/trending?api_key=TcEX2BZXhqud8oP06Ju1bZYNUlazhaLA&limit=10&offset=0&rating=g&bundle=messaging_non_clips");
  Future<List<Gif>> _getGift() async {
    final response = await http.get(url);

    List<Gif> listaDeGifs = [];
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);

      for (var item in jsonData['data']) {
        listaDeGifs.add(Gif(item['title'], item['images']['original']['url']));
      }
      print(listaDeGifs);
    } else {
      throw Exception('fallo la conexion');
    }
    return listaDeGifs;
  }

  @override
  void initState() {
    super.initState();
    _listadoDeGifts = _getGift();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Las mamaCITAS'),
          backgroundColor: const Color.fromARGB(255, 81, 143, 235),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return FutureBuilder<List<Gif>>(
              future: _listadoDeGifts,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListTile(
                    title: Text(
                      snapshot.data![index].nombre,
                      style: TextStyle(
                          fontSize: 24.0,
                          textBaseline: TextBaseline.alphabetic),
                    ),
                    subtitle: Image.network(snapshot.data![index].url),
                  );
                } else if (snapshot.hasError) {
                  return const Text('error');
                }
                return const CircularProgressIndicator();
              },
            );
          },
        ));
  }
}
