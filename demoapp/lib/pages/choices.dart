import 'package:demoapp/services/store_service.dart';
import 'package:flutter/material.dart';

class ChoicesPage extends StatefulWidget {
  const ChoicesPage({super.key});

  @override
  State<ChoicesPage> createState() => _ChoicesPageState();
}

class _ChoicesPageState extends State<ChoicesPage> {
  static const titleStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  static const subtitleStyle = TextStyle(fontSize: 16);

  static const padding16 = EdgeInsets.all(16);

  static const padding10 = EdgeInsets.all(10);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: storeService.getFireAlbums(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: storeService.listDynamicAlbums.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      Image.network(
                          storeService.listDynamicAlbums[index]["image"]),
                      Padding(
                        padding: padding10,
                        child: Text(
                          storeService.listDynamicAlbums[index]["title"],
                          style: titleStyle,
                        ),
                      ),
                      Padding(
                        padding: padding16,
                        child: Text(
                          storeService.listDynamicAlbums[index]["subtitle"],
                          style: subtitleStyle,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
