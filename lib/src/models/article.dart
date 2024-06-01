import 'package:cloud_firestore/cloud_firestore.dart';

import 'category.dart';

class Article {
  final String? id;
  final String name;
  final String description;
  final String picture;
  final int price;
  final Timestamp date;
  final ArticleCategory category;

  Article({
    this.id,
    required this.name,
    required this.description,
    required this.picture,
    required this.price,
    required this.date,
    required this.category,
  });

  static Article fromJson(Map<String, dynamic> json) {
    return Article(
      // id: json['id'],
      name: json['name'],
      description: json['descriptin'],
      picture: json['picture'],
      price: json['price'],
      date: json['date'],
      category: ArticleCategory.fromJson(json['category']),
    );
  }

  static Map<String, dynamic> toJson(Article article) {
    return {
      // 'id': article.id,
      'name': article.name,
      'descriptin': article.description,
      'picture': article.picture,
      'price': article.price,
      'date': article.date,
      'category': ArticleCategory.toJson(article.category),
    };
  }

  static Article fromSnaps(QueryDocumentSnapshot<Map<String, dynamic>> snap) =>
      Article(
        // id: snap.id,
        name: snap.data()['name'],
        description: snap.data()['description'],
        picture: snap.data()['picture'],
        price: snap.data()['price'],
        date: snap.data()['date'],
        category: ArticleCategory.fromJson(snap.data()['category']),
      );
}
