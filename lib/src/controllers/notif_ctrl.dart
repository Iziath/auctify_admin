// import 'package:get/get.dart';

// import '../models/notif_model.dart';
// import '../models/partner.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class NotifCtrl extends GetxController {
//   static final db = FirebaseFirestore.instance.collection('Notifications');
//   List<NotifModel> notifs = <NotifModel>[].obs;

//   static Future<List<NotifModel>> getAll() async {
//     var notifs = await db.get();
//     return notifs.docs.map((e) => NotifModel.fromSnap(e)).toList();
//   }

//   static Future<List<NotifModel>> getAllForPatner(Partner patner) async {
//     var notifs = await db.get();
//     return notifs.docs
//         .map((e) => NotifModel.fromSnap(e))
//         .toList()
//         .where((e) => e.sendTo.contains(patner))
//         .toList();
//   }

//   static Future<void> add(NotifModel notif) async {
//     await db.add(NotifModel.toJson(notif));
//   }

//   // static Future<void> update(
//   //     {required patner patner,
//   //     required String field,
//   //     required dynamic data}) async {
//   //   await db.doc(patner.id!).update({field: data});
//   // }
// }
