import 'package:cloud_firestore/cloud_firestore.dart';

import 'my_user.dart';

class Bidder {
  final MyUser identity;
  final int pricePropose;
  final Timestamp date;

  Bidder(
      {required this.identity, required this.pricePropose, required this.date});

  static Bidder fromJson(Map<String, dynamic> json) {
    return Bidder(
      date: json['date'],
      pricePropose: json['pricePropose'],
      identity: MyUser.fromJson(json['identity']),
    );
  }

  static Map<String, dynamic> toJson(Bidder bidder) {
    return {
      'date': bidder.date,
      'pricePropose': bidder.pricePropose,
      'identity': MyUser.toJson(bidder.identity),
    };
  }

  static Bidder fromSnaps(QueryDocumentSnapshot<Map<String, dynamic>> snap) =>
      Bidder(
        date: snap.data()['date'],
        pricePropose: snap.data()['pricePropose'],
        identity: MyUser.fromJson(snap.data()['identity']),
      );
}
