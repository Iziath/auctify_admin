import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/bid.dart';
import '../models/my_user.dart';

class MyUserCtrler {
  static CollectionReference<Map<String, dynamic>> db =
      FirebaseFirestore.instance.collection('MyUsers');

  static Future<List<MyUser>> getAll() async {
    var usrs = await db.get();
    return usrs.docs.map((e) => MyUser.fromSnaps(e)).toList();
  }

  static Future<MyUser> getFromId(String docId) async {
    final snp = await db.doc(docId).get();
    return MyUser.fromJson(snp.data()!);
  }

  static Future<MyUser> getFromEmail(String email) async {
    final snp = await getAll();
    return snp.firstWhere((e) => e.email == email);
  }

  static Future<void> addBidToFavoris(String email, Bid bid) async {
    final snp = await getAll();
    final user = snp.firstWhere((e) => e.email == email);
    await update(user.id!, {
      "favoris": FieldValue.arrayUnion([Bid.toJson(bid)])
    });
  }

  static Future<bool> userExist(String email) async {
    final users = await getAll();
    return users.map((e) => e.email).toList().contains(email);
  }

  static Future<void> add(MyUser b) async {
    await db.add(MyUser.toJson(b));
  }

  static Future<void> update(String id, Map<String, dynamic> data) async {
    await db.doc(id).update(data);
  }
}
