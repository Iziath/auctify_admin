import 'package:cloud_firestore/cloud_firestore.dart';

class Operation {
  final String description;
  final Timestamp? date;
  final OpeAuther from;
  final List<OpeAuther> to;
  // final Partner from;
  final OpeType opeType;
  final String? id;
  final int amount;
  final int fee;

  Operation({
    this.id,
    required this.description,
    required this.amount,
    required this.date,
    required this.opeType,
    required this.from,
    required this.to,
    required this.fee,
  });

  static Map<String, dynamic> toJson(Operation o) => {
        'date': o.date,
        'amount': o.amount,
        'to': o.to.map((e) => OpeAuther.toJson(e)).toList(),
        'description': o.description,
        'fee': o.fee,
        'from': OpeAuther.toJson(o.from),
        'opeType': o.opeType.name,
      };

  static Operation fromJson(Map<String, dynamic> json) => Operation(
        to: json['to'].map((e) => OpeAuther.fromJson(e)).toList(),
        from: OpeAuther.fromJson(json['from']),
        description: json['description'],
        opeType: OpeType.values.firstWhere((e) => e.name == json['opeType']),
        amount: json['amount'],
        fee: json['fee'],
        date: json['date'],
      );

  static Operation fromSnap(DocumentSnapshot snaps) => Operation(
        id: snaps.id,
        fee: snaps['fee'],
        date: snaps['date'],
        amount: snaps['amount'],
        description: snaps['description'],
        from: OpeAuther.fromJson(snaps['from']),
        opeType: OpeType.values.firstWhere((e) => e.name == snaps['opeType']),
        to: snaps['to'].map<OpeAuther>((e) => OpeAuther.fromJson(e)).toList(),
      );
}

class OpeAuther {
  final String id, ref, phone;
  final OpeAuthType type;
  // final int amount;

  OpeAuther(
      {required this.id,
      required this.ref,
      required this.phone,
      // required this.amount,
      required this.type});

  static Map<String, dynamic> toJson(OpeAuther o) => {
        'id': o.id,
        'ref': o.ref,
        'phone': o.phone,
        // 'amount': o.amount,
        'type': o.type.name,
      };

  static OpeAuther fromJson(Map<String, dynamic> json) => OpeAuther(
        id: json['id'],
        ref: json['ref'],
        phone: json['phone'],
        // amount: json['amount'],
        type: OpeAuthType.values.firstWhere((v) => v.name == json['type']),
      );

  // static OpeAuther fromSnap(DocumentSnapshot snaps) =>
  //     OpeAuther(id: id, ref: ref, type: type);
}

enum OpeAuthType { agent, user, resto, delivery, shop, admin }

enum OpeType { deposit, withdraw }
