// import 'dart:async';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class NotifCtrler {
//   static CollectionReference<Map<String, dynamic>> db =
//       FirebaseFirestore.instance.collection('Notifs');

//   static Future<List<Notif>> getAll() async {
//     List<Notif> notifs = [];
//     final snp = await db.get();

//     if (snp.docs.isNotEmpty) {
//       notifs = snp.docs.map((doc) => Notif.fromSnaps(doc)).toList();
//     }
//     return notifs;
//   }

//   static Future<Notif> getFromId(String docId) async {
//     final snp = await db.doc(docId).get();
//     return Notif.fromJson(snp.data()!);
//   }

//   static Future<void> add(Notif b) async {
//     await db.add(Notif.toJson(b));
//   }

//   static Future<void> update(String id, Map<String, dynamic> data) async {
//     await db.doc(id).update(data);
//   }

//   static Future<void> viewed(String id, Timestamp viewAt) async {
//     await db.doc(id).update({"viewAt": viewAt});
//   }
// }
