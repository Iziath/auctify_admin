import 'package:ab_admin/src/views/home_widgets/discovery_widget.dart';
import 'package:flutter/material.dart';
import '../controllers/menu_ctrl.dart';
import '../utils/consts.dart';
import 'home_widgets/notif_widget.dart';
import 'home_widgets/stats_widget.dart';
import 'home_widgets/users_widget.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int sltdIndx = 1;

  List<Map<String, dynamic>> menuItems() => [
        {
          'icon': Icons.pie_chart,
          'title': "Statistiques",
          'content': const StatsWidget(),
        },
        {
          "icon": Icons.travel_explore,
          "title": "Découverte d'espèces",
          'content': const DiscoveryWidget(),
        },
        {
          'icon': Icons.person,
          'title': "Utilisateurs",
          'content': const UsersWidget(),
        },
        {
          'icon': Icons.notifications,
          'title': "Notification",
          'content': const NotifWidget(),
        },
        // {
        //   "icon": Icons.warning_rounded,
        //   "title": "Signaler une menace",
        //   'content': const AlertWidget(),
        // },
        // {
        //   "icon": Icons.public,
        //   "title": "Espèce de Faune",
        //   'content': const FauneWidget(),
        // },
        // {
        //   "icon": Icons.eco,
        //   "title": "Espèce de Flore",
        //   'content': const FloreWidget(),
        // },
        // {
        //   "icon": Icons.map,
        //   "title": "Carte d'observation",
        //   'content': const MapView(),
        // },
        // {
        //   "icon": Icons.diversity_3,
        //   "title": "Acteurs de conservation",
        //   'content': const PartnersWidget(),
        // },
      ];

  Map<String, dynamic> sltdMenu = {
    'icon': Icons.pie_chart,
    'title': "Statistiques",
    'content': const StatsWidget(),
  };

  myMenu() => Container(
        width: 150,
        height: Get.height,
        // alignment: Alignment.topCenter,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 1)],
        ),
        child: ListView(
          // shrinkWrap: true,
          // controller: ScrollController(
          //   onAttach: (position) => sltdIndx,
          // ),
          children: menuItems()
              .map(
                (e) => InkWell(
                  child: Container(
                    height: 100,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: sltdMenu['title'] == e['title']
                          ? Border.all(color: Consts.col1, width: 2)
                          : null,
                      color: sltdMenu['title'] == e['title']
                          ? Colors.grey.withOpacity(.2)
                          : Colors.white,
                      // color: Consts.col1,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(e['icon']),
                        Text(e['title'], textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  onTap: () => setState(() => sltdMenu = e),
                ),
              )
              .toList(),
        ),
      );

  myContent() => Container(child: sltdMenu["content"]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: MenuAppController().scaffoldKey,
      appBar: AppBar(
        title: Text(Consts.appName),
        centerTitle: true,
        elevation: 15,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   height: 80,
            //   color: Consts.bgColor,
            //   alignment: Alignment.center,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       Expanded(
            //         child: Text(
            //           Consts.appName,
            //           style: Consts.subTitleStyle.copyWith(color: Colors.white),
            //         ),
            //       ),
            //       Expanded(
            //         child: ListTile(
            //           leading: Image.asset("assets/images/logo.png"),
            //           title: Text("Zoulkifirou BARIZI", style: Consts.bold),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            Expanded(
              child: Container(
                color: Consts.col1.withOpacity(.05),
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width / 8,
                  vertical: 30,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // myMenu(),
                    Expanded(flex: 4, child: myContent()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
