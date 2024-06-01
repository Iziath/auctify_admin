import 'package:cloud_firestore/cloud_firestore.dart';

import 'bid.dart';

class MyUser {
  final String? id;
  final String name,
      firstname,
      email,
      phone,
      password,
      idCardNumber,
      rcc,
      companyName;
  final Timestamp date;
  final int ifu;
  final bool isCompany;
  final List<Bid> favoris;

  MyUser({
    this.id,
    required this.name,
    required this.firstname,
    required this.email,
    required this.phone,
    required this.password,
    required this.idCardNumber,
    required this.date,
    required this.favoris,
    required this.rcc,
    required this.companyName,
    required this.ifu,
    required this.isCompany,
  });

  static MyUser fromJson(Map<String, dynamic> json) {
    return MyUser(
      // id: json['id'],
      name: json['name'],
      firstname: json['firstname'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
      idCardNumber: json['idCardNumber'],
      date: json['date'],
      favoris: json['favoris'].map<Bid>((f) => Bid.fromJson(f)).toList(),
      rcc: json['rcc'],
      companyName: json['companyName'],
      ifu: json['ifu'],
      isCompany: json['isCompany'],
    );
  }

  static Map<String, dynamic> toJson(MyUser myUser) {
    return {
      // 'id': myUser.id,
      'name': myUser.name,
      'firstname': myUser.firstname,
      'email': myUser.email,
      'phone': myUser.phone,
      'password': myUser.password,
      'idCardNumber': myUser.idCardNumber,
      'date': myUser.date,
      'favoris': myUser.favoris.map((e) => Bid.toJson(e)).toList(),
      'rcc': myUser.rcc,
      'companyName': myUser.companyName,
      'ifu': myUser.ifu,
      'isCompany': myUser.isCompany,
    };
  }

  static MyUser fromSnaps(QueryDocumentSnapshot<Map<String, dynamic>> snap) =>
      MyUser(
        id: snap.id,
        name: snap.data()['name'],
        firstname: snap.data()['firstname'],
        email: snap.data()['email'],
        phone: snap.data()['phone'],
        password: snap.data()['password'],
        idCardNumber: snap.data()['idCardNumber'],
        date: snap.data()['date'],
        favoris:
            snap.data()['favoris'].map<Bid>((f) => Bid.fromJson(f)).toList(),
        rcc: snap.data()['rcc'],
        companyName: snap.data()['companyName'],
        ifu: snap.data()['ifu'],
        isCompany: snap.data()['isCompany'],
      );
}
