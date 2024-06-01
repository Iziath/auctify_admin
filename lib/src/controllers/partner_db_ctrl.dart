// import '../models/partner.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class PartnerDBCtrl {
//   static final db = FirebaseFirestore.instance.collection('Partners');

//   static Future<List<Partner>> getAll() async {
//     var ptnrs = await db.get();
//     return ptnrs.docs.map((e) => Partner.fromSnap(e)).toList();
//   }

//   static Future<void> add(Partner p) async {
//     await db.add(Partner.toJson(p));
//   }

//   static Future<void> update(
//       {required String partID,
//       required String field,
//       required dynamic data}) async {
//     await db.doc(partID).update({field: data});
//   }

//   // static Future<void> debit(
//   //     {required Partner partner,
//   //     required int amount}) async {
//   //   await db.doc(partner.id!).update({field: data});
//   // }

//   static Future<bool> refExist(String ref) async {
//     var partners = await getAll();
//     var refs = partners.where((p) => p.reference == ref).toList();
//     return refs.isEmpty ? false : true;
//   }

//   static Future<Partner> getpartnerFromID(String partnerID) async {
//     var partner = await db.doc(partnerID).get();
//     return Partner.fromSnap(partner);
//   }

//   static Future<Partner> getpartnerFromRef(String ref) async {
//     var partners = await getAll();
//     return partners.firstWhere(
//         (partner) => partner.reference.toUpperCase() == ref.toUpperCase());
//   }

//   static Future<bool> partnerExist(String phoneNo) async {
//     bool aRenv = false;
//     // List phones = [];
//     List<Partner> usrs = await getAll();

//     // for (var el in usrs) {
//     //   phones.add(el.phone);
//     // }
//     usrs.map((e) => e.phone).toList().contains(phoneNo)
//         ? aRenv = true
//         : aRenv = false;
//     return aRenv;
//   }

//   static Future<bool> partnerInfoExist(Partner partner) async {
//     bool aRenv = false;

//     partner.name == '' || partner.reference == '' || partner.email == ''
//         ? aRenv = false
//         : aRenv = true;

//     return aRenv;
//   }
// }

// // class PartnerCtrl extends GetxController {
// //   var partner

// //   @override
// //   void onInit() {
// //     super.onInit();
// //   }

// //   Stream<Partner> partnerStream(partnerID) {
// //     return PartnerDBCtrl.db
// //         .doc(partnerID)
// //         .snapshots()
// //         .map((s) => Partner.fromSnap(s));
// //   }
// // }
