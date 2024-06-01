import 'package:cloud_firestore/cloud_firestore.dart';

class Partner {
  final String registedNo,
      name,
      reference,
      password,
      adress,
      phone,
      email,
      notifToken;
  int pin, balance;
  final String? id, avatar;
  final bool enable, connected, verified;
  final Timestamp? date;
  final List docs;

  Partner({
    this.id,
    required this.registedNo,
    required this.email,
    required this.password,
    required this.enable,
    required this.avatar,
    required this.name,
    required this.reference,
    required this.verified,
    required this.notifToken,
    required this.docs,
    required this.pin,
    required this.connected,
    required this.adress,
    required this.phone,
    required this.date,
    required this.balance,
  });

  static Map<String, dynamic> toJson(Partner o) => {
        'avatar': o.avatar,
        'name': o.name,
        'reference': o.reference,
        'verified': o.verified,
        'notifToken': o.notifToken,
        'pin': o.pin,
        'connected': o.connected,
        'adress': o.adress,
        'phone': o.phone,
        'date': o.date,
        'docs': o.docs,
        'balance': o.balance,
        'email': o.email,
        'enable': o.enable,
        'registedNo': o.registedNo,
        'password': o.password,
      };

  static Map<String, dynamic> toStoreJson(Partner p) {
    var map = toJson(p);
    map.addAll({'id': p.id});
    return map;
  }

  static Partner fromJson(Map<String, dynamic> json) => Partner(
        avatar: json['avatar'],
        name: json['name'],
        reference: json['reference'],
        notifToken: json['notifToken'],
        balance: json['balance'],
        verified: json['verified'],
        connected: json['connected'],
        adress: json['adress'],
        phone: json['phone'],
        date: json['date'],
        docs: json['docs'],
        pin: json['pin'],
        email: json['email'],
        enable: json['enable'],
        registedNo: json['registedNo'],
        password: json['password'],
        id: json['id'],
      );

  static Partner fromSnap(DocumentSnapshot snaps) => Partner(
        id: snaps.id,
        registedNo: snaps['registedNo'],
        email: snaps['email'],
        enable: snaps['enable'],
        avatar: snaps['avatar'],
        verified: snaps['verified'],
        name: snaps['name'],
        reference: snaps['reference'],
        notifToken: snaps['notifToken'],
        balance: snaps['balance'],
        pin: snaps['pin'],
        connected: snaps['connected'],
        adress: snaps['adress'],
        phone: snaps['phone'],
        password: snaps['password'],
        date: snaps['date'],
        docs: snaps['docs'],
      );
}
