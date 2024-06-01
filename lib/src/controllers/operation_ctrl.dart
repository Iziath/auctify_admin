// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// import '../models/operation.dart';

// class OperationsCtrl {
//   static final db = FirebaseFirestore.instance.collection('Operations');

//   static Future<List<Operation>> getAll() async {
//     var data = await db.get();
//     return data.docs.map((e) => Operation.fromSnap(e)).toList();
//   }

//   static Future<DocumentReference<Map<String, dynamic>>> add(
//       Operation o) async {
//     return await db.add(Operation.toJson(o));
//   }

//   static Future<List<Operation>> getUserOperations(String userId) async {
//     var data = await db.orderBy('date', descending: true).get();
//     return data.docs
//         .map((e) => Operation.fromSnap(e))
//         .toList()
//         .where((s) =>
//             s.from.id == userId ||
//             s.to.map((o) => o.id).toList().contains(userId))
//         .toList();
//   }

//   static Future<List<Operation>> getUserOpeFromPhone(String phone) async {
//     var data = await db.orderBy('date', descending: true).get();
//     var aRenv = data.docs
//         .map((e) => Operation.fromSnap(e))
//         .where((s) =>
//             s.from.phone == phone ||
//             s.to.map((o) => o.phone).toList().contains(phone))
//         .toList();
//     debugPrint("- - aRenv = ${aRenv.length}");

//     return aRenv;
//   }

//   // static Future<void> update(
//   //     {required Partner partner,
//   //     required String field,
//   //     required dynamic data}) async {
//   //   await db.doc(partner.id!).update({field: data});
//   // }

//   // static Future<bool> refExist(String ref) async {
//   //   var partners = await getAll();
//   //   var refs = partners.where((p) => p.reference == ref).toList();
//   //   return refs.isEmpty ? false : true;
//   // }

//   // static Future<Partner> getpartnerFromID(String partnerID) async {
//   //   var partner = await db.doc(partnerID).get();
//   //   return Partner.fromSnap(partner);
//   // }

//   // static Future<Partner> getpartnerFromRef(String ref) async {
//   //   var partners = await getAll();
//   //   return partners.firstWhere(
//   //       (partner) => partner.reference.toUpperCase() == ref.toUpperCase());
//   // }

//   // static Future<bool> partnerExist(String phoneNo) async {
//   //   bool aRenv = false;
//   //   // List phones = [];
//   //   List<Partner> usrs = await getAll();

//   //   // for (var el in usrs) {
//   //   //   phones.add(el.phone);
//   //   // }
//   //   usrs.map((e) => e.phone).toList().contains(phoneNo)
//   //       ? aRenv = true
//   //       : aRenv = false;
//   //   return aRenv;
//   // }

//   // static Future<bool> partnerInfoExist(Partner partner) async {
//   //   bool aRenv = false;

//   //   partner.name == '' || partner.reference == '' || partner.email == ''
//   //       ? aRenv = false
//   //       : aRenv = true;

//   //   return aRenv;
//   // }
// }
