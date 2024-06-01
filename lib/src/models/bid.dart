import 'package:cloud_firestore/cloud_firestore.dart';

import 'article.dart';
import 'bidder.dart';
import 'my_user.dart';

class Bid {
  final String? id;
  final String title;
  final Timestamp startDate, endDate;
  final Timestamp? validateAt;
  final BidStatus status;
  final MyUser publishedBy;
  final Article article;
  final List<Bidder> bidders;
  final bool validated;

  Bid({
    this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.publishedBy,
    required this.article,
    required this.bidders,
    required this.validateAt,
    required this.validated,
  });

  static Bid fromJson(Map<String, dynamic> json) {
    return Bid(
      // id: json['id'],
      title: json['title'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      status: BidStatus.values.firstWhere((e) => e.name == json['status']),
      publishedBy: MyUser.fromJson(json['publishedBy']),
      article: Article.fromJson(json['article']),
      bidders: json['bidders'].map<Bidder>((b) => Bidder.fromJson(b)).toList(),
      validated: json['validated'],
      validateAt: json['validateAt'],
    );
  }

  static Map<String, dynamic> toJson(Bid bid) {
    return {
      // 'id': bid.id,
      'title': bid.title,
      'startDate': bid.startDate,
      'endDate': bid.endDate,
      'status': bid.status.name,
      'publishedBy': MyUser.toJson(bid.publishedBy),
      'article': Article.toJson(bid.article),
      'bidders': bid.bidders.map((e) => Bidder.toJson(e)).toList(),
      'validated': bid.validated,
      'validateAt': bid.validateAt,
    };
  }

  static Bid fromSnaps(QueryDocumentSnapshot<Map<String, dynamic>> snap) {
    Map<String, dynamic> json = snap.data();

    return Bid(
      id: snap.id,
      title: json['title'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      status: BidStatus.values.firstWhere((e) => e.name == json['status']),
      publishedBy: MyUser.fromJson(json['publishedBy']),
      article: Article.fromJson(json['article']),
      bidders: json['bidders'].map<Bidder>((b) => Bidder.fromJson(b)).toList(),
      validated: json['validated'],
      validateAt: json['validateAt'],
    );
  }
}

enum BidStatus { newBid, waiting, pending, completed, done }
