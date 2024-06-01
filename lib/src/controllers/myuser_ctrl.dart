// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';

// import '../models/my_user.dart';

// class UserDBCtrl {
//   static final db = FirebaseFirestore.instance.collection('Users');

//   static Future<List<MyUser>> getAll() async {
//     var users = await db.get();
//     return users.docs.map((e) => MyUser.fromSnap(e)).toList();
//   }

//   static Future<DocumentReference<Map<String, dynamic>>> add(
//       MyUser user) async {
//     var a = await db.add(MyUser.toJson(user));
//     return a;
//   }

//   static Future<void> update(
//       {required String userPhone,
//       required String field,
//       required dynamic data}) async {
//     final myUser = await getUserFromPhoneNo(userPhone);

//     await db.doc(myUser.id!).update({field: data});
//   }

//   static Future<void> updateFromPhone(
//       {required String phone,
//       required String field,
//       required dynamic data}) async {
//     // final myUsr = await getUserFromUID(userUID);
//     final myUsr = await getUserFromPhoneNo(phone);

//     await db.doc(myUsr.id!).update({field: data});
//   }

//   static Future<void> debitNow(
//       {required int amount, required String uID}) async {
//     final MyUser myUser = await getUserFromID(uID);

//     await db.doc(myUser.id!).update({'balance': myUser.balance - amount});
//   }

//   static Future<void> creditUser(
//       {required int amount, required String uID}) async {
//     final MyUser myUser = await getUserFromID(uID);

//     await db.doc(myUser.id!).update({'balance': myUser.balance + amount});
//   }

//   static Future<MyUser> getUserFromID(String userID) async {
//     var user = await db.doc(userID).get();
//     return MyUser.fromSnap(user);
//   }

//   static Future<MyUser> getUserFromUID(String userUID) async {
//     var users = await getAll();
//     return users.firstWhere((user) => user.uid == userUID);
//   }

//   static Future<MyUser> getUserFromPhoneNo(String phoneNo) async {
//     var users = await getAll();
//     debugPrint('=== users = $users');
//     return users.firstWhere((user) => user.phone == phoneNo);
//   }

//   static Future<bool> userExist(String phoneNo) async {
//     bool aRenv = false;
//     List phones = [];
//     List<MyUser> usrs = await getAll();
//     debugPrint("--usrs = $usrs");

//     for (var el in usrs) {
//       phones.add(el.phone);
//     }
//     phones.contains(phoneNo) ? aRenv = true : aRenv = false;
//     return aRenv;
//   }

//   static Future<bool> userInfoExist(MyUser user) async {
//     bool aRenv = false;

//     user.firstName == '' || user.lastName == '' ? aRenv = false : aRenv = true;

//     return aRenv;
//   }
// }
