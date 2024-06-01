import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Faune {
  final String? id;
  final String name;
  final String habit;
  final String usage;
  final String fruits;
  final String feuilles;
  final String scienceName;
  final String vernacularName;
  final String conservationStatus;
  final Timestamp date;
  final Classification classification;
  final List<LocaleName> localeNames;
  final List<String> presenceSites;
  final List<String> bibliography;
  final List<String> images;

  Faune({
    this.id,
    required this.date,
    required this.name,
    required this.classification,
    required this.scienceName,
    required this.vernacularName,
    required this.localeNames,
    required this.conservationStatus,
    required this.habit,
    required this.presenceSites,
    required this.feuilles,
    required this.fruits,
    required this.usage,
    required this.bibliography,
    required this.images,
  });

  factory Faune.fromRawJson(String str) => Faune.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Faune.fromJson(Map<String, dynamic> json) => Faune(
        id: json["id"],
        name: json["name"],
        date: json["date"],
        classification: Classification.fromJson(json["classification"]),
        scienceName: json["science_name"],
        vernacularName: json["vernacular_name"],
        localeNames: List<LocaleName>.from(
            json["locale_names"].map((x) => LocaleName.fromJson(x))),
        conservationStatus: json["conservation_status"],
        habit: json["habit"],
        presenceSites: List<String>.from(json["presence_sites"].map((x) => x)),
        feuilles: json["feuilles"],
        fruits: json["fruits"],
        usage: json["usage"],
        bibliography: List<String>.from(json["bibliography"].map((x) => x)),
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "name": name,
        "classification": classification.toJson(),
        "science_name": scienceName,
        "vernacular_name": vernacularName,
        "locale_names": List<dynamic>.from(localeNames.map((x) => x.toJson())),
        "conservation_status": conservationStatus,
        "habit": habit,
        "presence_sites": List<dynamic>.from(presenceSites.map((x) => x)),
        "feuilles": feuilles,
        "fruits": fruits,
        "usage": usage,
        "bibliography": List<dynamic>.from(bibliography.map((x) => x)),
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}

class Classification {
  final String regne;
  final String embranchement;
  final String classe;
  final String ordre;
  final String famille;

  Classification({
    required this.regne,
    required this.embranchement,
    required this.classe,
    required this.ordre,
    required this.famille,
  });

  factory Classification.fromRawJson(String str) =>
      Classification.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Classification.fromJson(Map<String, dynamic> json) => Classification(
        regne: json["regne"],
        embranchement: json["embranchement"],
        classe: json["classe"],
        ordre: json["ordre"],
        famille: json["famille"],
      );

  Map<String, dynamic> toJson() => {
        "regne": regne,
        "embranchement": embranchement,
        "classe": classe,
        "ordre": ordre,
        "famille": famille,
      };
}

class LocaleName {
  final String content;
  final String language;

  LocaleName({required this.content, required this.language});

  factory LocaleName.fromRawJson(String str) =>
      LocaleName.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocaleName.fromJson(Map<String, dynamic> json) => LocaleName(
        content: json["content"],
        language: json["language"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "language": language,
      };
}
