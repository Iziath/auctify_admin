import 'package:ab_admin/src/controllers/bid_ctrler.dart';
import 'package:ab_admin/src/controllers/my_user_ctrler.dart';
import 'package:ab_admin/src/models/bid.dart';
import 'package:ab_admin/src/models/my_user.dart';
import 'package:flutter/material.dart';
import '../../utils/consts.dart';
import '../../views/components/global_stat_card.dart';

class StatsWidget extends StatefulWidget {
  const StatsWidget({super.key});

  @override
  State<StatsWidget> createState() => _StatsWidgetState();
}

class _StatsWidgetState extends State<StatsWidget> {
  bool showBalance = true;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.all(Consts.defaultPadding),
        children: [
          GridView(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.8,
              mainAxisSpacing: Consts.defaultPadding,
              crossAxisSpacing: Consts.defaultPadding,
            ),
            children: [
              StreamBuilder<List<Bid>>(
                stream: BidCtrler.getActiveBids().asStream(),
                builder: (context, snaps) {
                  if (!snaps.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return GlobalStatCard(
                    iconData: Icons.area_chart_rounded,
                    title: "Enchères valides".toLowerCase(),
                    number: '${snaps.data!.length}',
                    color: const Color(0xFF840900),
                  );
                },
              ),
              StreamBuilder<List<Bid>>(
                stream: BidCtrler.getUnactiveBids().asStream(),
                builder: (context, snaps) {
                  if (!snaps.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return GlobalStatCard(
                    iconData: Icons.area_chart_rounded,
                    title: "Enchères en attente".toLowerCase(),
                    number: '${snaps.data!.length}',
                    color: const Color.fromARGB(255, 7, 0, 132),
                  );
                },
              ),
              StreamBuilder<List<MyUser>>(
                stream: MyUserCtrler.getAll().asStream(),
                builder: (context, snaps) {
                  if (!snaps.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return GlobalStatCard(
                    iconData: Icons.area_chart_rounded,
                    title: "UTILISATEURS".toLowerCase(),
                    number: '${snaps.data!.length}',
                    color: const Color.fromARGB(255, 132, 55, 0),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Divider(),
          const SizedBox(height: 10),
          const Divider(),
          StreamBuilder<List<Bid>>(
              stream: BidCtrler.getAll().asStream(),
              builder: (context, snaps) {
                if (!snaps.hasData) {
                  return const LinearProgressIndicator();
                }
                return ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: snaps.data!
                      .map((bid) => ListTile(
                            title: Text(bid.article.name),
                            subtitle:
                                Text("Publié par: ${bid.publishedBy.name}"),
                            trailing: Switch(
                              value: bid.validated ? true : false,
                              activeColor: Colors.green,
                              onChanged: (value) async {
                                setState(() => loading = true);
                                await BidCtrler.update(
                                    bid.id!, {"validated": value});
                                loading = false;
                                setState(() {});
                              },
                            ),
                          ))
                      .toList(),
                );
              }),
        ],
      ),
    );
  }
}
