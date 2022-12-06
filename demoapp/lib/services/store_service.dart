import 'package:cloud_firestore/cloud_firestore.dart';

/// Create a Singleton to manage datastore
class StoreService {
  static final StoreService _instance = StoreService._internal();

  factory StoreService() => _instance;

  StoreService._internal();

  /// Initialize the connection with firebase
  final db = FirebaseFirestore.instance;

  /// Static list of items
  List<Map<String, dynamic>> listAlbums = [
    {
      "title": "L'entourloop - Chickens in your town",
      "image": "https://i.ytimg.com/vi/IHo5USijhWE/hqdefault.jpg",
      "subtitle":
          "Élevés en plein air depuis 1964, Sir Johnny et King James sont les figures de proue du mystérieux collectif : L’Entourloop."
    },
    {
      "title": "The Architect - Foundations",
      "image":
          "https://i.scdn.co/image/ab67616d0000b2738bb5212bb67e8f9502863c98",
      "subtitle":
          "A symbolic album. Linked to a strongly radicalized culture and environment, but with universal facets, decidedly modern and capable of being appreciated."
    },
    {
      "title": "Brothers moving - Minnie the moocher",
      "image":
          "https://i.pinimg.com/originals/7c/38/6d/7c386dcf29ad49c1412301f925553807.jpg",
      "subtitle":
          "Brothers Moving is a Danish band formed in New York City in 2008 by brothers Esben Knoblauch (lead vocals, guitar, kazoo), Aske Knoblauch (lead vocals, lead guitar) and Simon Knoblauch (cajón) along with Nils Sørensen (bass)."
    },
  ];

  /// Dynamic list of items
  List<Map<String, dynamic>> listDynamicAlbums = [];

  /// Fetch datas from firebase
  Future<List<dynamic>> getFireAlbums() async {
    listDynamicAlbums.clear();
    var fireAlbums = await db.collection("albums").get();

    for (var album in fireAlbums.docs) {
      listDynamicAlbums.add({"id": album.id, ...album.data()});
    }
    return listDynamicAlbums;
  }

  /// End of class StoreService
}

final storeService = StoreService();
