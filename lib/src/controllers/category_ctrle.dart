// import 'dart:async';
// import 'package:auctify_projet/src/models/category.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class CategoryCtrler {
//   static CollectionReference<Map<String, dynamic>> db =
//       FirebaseFirestore.instance.collection('Categories');

//   static Future<List<ArticleCategory>> getAll() async {
//     final snp = await db.get();
//     debugPrint("- - - getAll = ${snp.docs.length}");

//     return snp.docs.map((doc) => ArticleCategory.fromSnaps(doc)).toList();
//   }

//   static Future<ArticleCategory> getFromId(String docId) async {
//     final snp = await db.doc(docId).get();
//     return ArticleCategory.fromJson(snp.data()!);
//   }

//   static Future<void> add(ArticleCategory b) async {
//     await db.add(ArticleCategory.toJson(b));
//   }

//   static Future<void> update(String id, Map<String, dynamic> data) async {
//     await db.doc(id).update(data);
//   }
// }
