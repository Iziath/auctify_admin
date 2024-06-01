import 'package:flutter/material.dart';
import '../../utils/consts.dart';

class NotifWidget extends StatefulWidget {
  const NotifWidget({super.key});

  @override
  State<NotifWidget> createState() => _NotifWidgetState();
}

class _NotifWidgetState extends State<NotifWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(Consts.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(Consts.defaultPadding),
              child: Text("Notifications", style: Consts.titleStyle),
            ),
            const Divider(),
            Expanded(
                child:
                    // StreamBuilder<List<NotifModel>>(
                    //   stream: NotifCtrl.getAll().asStream(),
                    //   builder: (context, snaps) {
                    //     List<NotifModel> notif = [];

                    //     if (!snaps.hasData) {
                    //       return const Center(child: CircularProgressIndicator());
                    //     } else {
                    //       notif = snaps.data!;
                    //     }

                    //     return notif.isEmpty
                    //         ? const Text("Aucune notification !")
                    //         :
                    ListView(
              children: [
                ...[1, 2, 3, 4, 5, 6, 7].map((b) {
                  return ListTile(
                    subtitle: const Text(
                      "b.subtitle",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    title: Text(Consts.formatDate.format(DateTime.now())),
                  );
                }).toList()
              ],
              //           );
              //   },
            ))
          ],
        ),
      ),
    );
  }
}
