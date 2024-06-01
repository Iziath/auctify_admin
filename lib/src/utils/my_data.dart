import 'package:ab_admin/src/models/faune.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyData {
  static List<Faune> fauneSpecies = [
    Faune(
      name: "name",
      date: Timestamp.now(),
      classification: Classification(
        regne: "regne",
        embranchement: "embranchement",
        classe: "classe",
        ordre: "ordre",
        famille: "famille",
      ),
      scienceName: "scienceName",
      vernacularName: "vernacularName",
      localeNames: [],
      conservationStatus: "conservationStatus",
      habit: "habit",
      presenceSites: [],
      feuilles: "feuilles",
      fruits: "fruits",
      usage: "usage",
      bibliography: ["bibliography"],
      images: [],
    ),
  ];
}
