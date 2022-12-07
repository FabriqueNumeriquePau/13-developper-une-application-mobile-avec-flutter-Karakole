import 'package:demoapp/services/store_service.dart';
import 'package:flutter/material.dart';

class ListCardView extends StatefulWidget {
  const ListCardView({super.key});

  @override
  State<ListCardView> createState() => _ListCardViewState();
}

class _ListCardViewState extends State<ListCardView> {
  static const titleStyle =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  static const subtitleStyle = TextStyle(fontSize: 14);

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
                  return Card(
                    child: ListTile(
                      leading: Image.network(
                          storeService.listDynamicAlbums[index]["image"]),
                      title: Padding(
                        padding: padding10,
                        child: Text(
                          storeService.listDynamicAlbums[index]["title"],
                          style: titleStyle,
                        ),
                      ),
                      subtitle: Padding(
                        padding: padding16,
                        child: Text(
                          storeService.listDynamicAlbums[index]["subtitle"]
                                  .substring(0, 100) +
                              '...',
                          style: subtitleStyle,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
