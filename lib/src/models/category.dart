import 'package:cloud_firestore/cloud_firestore.dart';

class ArticleCategory {
  final String? id;
  final String title;
  final Timestamp date;

  ArticleCategory({
    this.id,
    required this.title,
    required this.date,
  });

  static ArticleCategory fromJson(Map<String, dynamic> json) {
    return ArticleCategory(title: json['title'], date: json['date']);
  }

  static Map<String, dynamic> toJson(ArticleCategory articlecategory) {
    return {'title': articlecategory.title, 'date': articlecategory.date};
  }

  static ArticleCategory fromSnaps(
          QueryDocumentSnapshot<Map<String, dynamic>> snap) =>
      ArticleCategory(
        id: snap.id,
        title: snap.data()['title'],
        date: snap.data()['date'],
      );
}
