import 'package:demoapp/services/store_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const titleStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  static const subtitleStyle = TextStyle(fontSize: 16);

  static const padding16 = EdgeInsets.all(16);

  static const padding10 = EdgeInsets.all(10);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: storeService.listAlbums.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Image.network(storeService.listAlbums[index]["image"]),
              Padding(
                padding: padding10,
                child: Text(
                  storeService.listAlbums[index]["title"],
                  style: titleStyle,
                ),
              ),
              Padding(
                padding: padding16,
                child: Text(
                  storeService.listAlbums[index]["subtitle"],
                  style: subtitleStyle,
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          );
        });
  }
}
