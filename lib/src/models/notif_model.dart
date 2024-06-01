import '../models/partner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotifModel {
  final List<Partner> sendTo;
  final Timestamp? sendAt;
  Timestamp? viewAt;
  final bool view = false;
  // final List<MyService> services;
  final String? id;
  final String title, subtitle;

  NotifModel({
    this.id,
    required this.sendTo,
    required this.sendAt,
    required this.viewAt,
    required this.title,
    required this.subtitle,
    // required this.services,
  });

  static NotifModel fromSnap(DocumentSnapshot snaps) => NotifModel(
        id: snaps.id,
        // services: snaps['services']
        //     .map<MyService>((e) => MyService.fromJson(e))
        //     .toList(),
        sendTo:
            snaps['sendTo'].map<Partner>((e) => Partner.fromJson(e)).toList(),
        sendAt: snaps['sendAt'],
        viewAt: snaps['viewAt'],
        title: snaps['title'],
        subtitle: snaps['subtitle'],
      );

  static Map<String, dynamic> toJson(NotifModel notif) => {
        'sendTo': notif.sendTo.map((e) => Partner.toJson(e)).toList(),
        'sendAt': notif.sendAt,
        'viewAt': notif.viewAt,
        'title': notif.title,
        'subtitle': notif.subtitle,
        // 'services': notif.services.map((e) => MyService.toJson(e)).toList(),
      };
}
