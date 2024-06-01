import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/bid.dart';
import '../models/bidder.dart';
import '../models/my_user.dart';

class BidCtrler {
  static CollectionReference<Map<String, dynamic>> db =
      FirebaseFirestore.instance.collection('Bids');

  static Future<List<Bid>> getAll() async {
    final snp = await db.get();
    debugPrint("- - - getAll() ret = ${snp.docs.length}");
    var aRenv = snp.docs.map<Bid>((snap) => Bid.fromSnaps(snap)).toList();
    debugPrint("- - - aRenv = ${aRenv.length}");
    return aRenv;
  }

  static Future<List<Bid>> getActiveBids() async {
    final snp = await db.get();
    debugPrint("- - - getAll() ret = ${snp.docs.length}");
    var aRenv = snp.docs
        .map<Bid>((snap) => Bid.fromSnaps(snap))
        .where((e) => e.validated)
        .toList();
    debugPrint("- - - aRenv = ${aRenv.length}");
    return aRenv;
  }

  static Future<List<Bid>> getUnactiveBids() async {
    final snp = await db.get();
    debugPrint("- - - getAll() ret = ${snp.docs.length}");
    var aRenv = snp.docs
        .map<Bid>((snap) => Bid.fromSnaps(snap))
        .where((e) => !e.validated)
        .toList();
    debugPrint("- - - aRenv = ${aRenv.length}");
    return aRenv;
  }

  static Future<List<Bid>> getUserBids(String email) async {
    final List<Bid> bids = await getAll();
    return bids.where((b) => b.publishedBy.email == email).toList();
  }

  static Future<List<Bid>> getWhereIBidOn(String email) async {
    final List<Bid> bids = await getAll();

    return bids
        .where((b) => b.bidders.map((e) => e.identity.email).contains(email))
        .toList();
  }

  static Future<Bid> getFromId(String docId) async {
    final snp = await db.doc(docId).get();
    return Bid.fromJson(snp.data()!);
  }

  static Future<void> giveMyPrice(String bidId, int price, MyUser user) async {
    await db.doc(bidId).update({
      "bidders": FieldValue.arrayUnion([
        Bidder.toJson(Bidder(
          identity: user,
          pricePropose: price,
          date: Timestamp.now(),
        ))
      ])
    });
  }

  static Future<String> add(Bid b) async {
    var bSaved = await db.add(Bid.toJson(b));
    return bSaved.id;
  }

  static Future<void> update(String id, Map<String, dynamic> data) async {
    await db.doc(id).update(data);
  }
}
