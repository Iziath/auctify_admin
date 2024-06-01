import 'package:flutter/material.dart';
import '../../utils/consts.dart';
import 'package:get/get.dart';

class DiscoveryWidget extends StatefulWidget {
  const DiscoveryWidget({super.key});

  @override
  State<DiscoveryWidget> createState() => _DiscoveryWidgetState();
}

class _DiscoveryWidgetState extends State<DiscoveryWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(Consts.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("DÉCOUVERTE D'ESPÈCE", style: Consts.titleStyle),
                  // const Spacer(),
                  // PopupMenuButton<String>(
                  //   tooltip: null,
                  //   itemBuilder: (context) => [
                  //     const PopupMenuItem(
                  //       value: 'gallery',
                  //       child: Row(
                  //         children: [
                  //           Icon(Icons.video_library),
                  //           SizedBox(width: 8),
                  //           Text('Xls'),
                  //         ],
                  //       ),
                  //     ),
                  //     const PopupMenuItem(
                  //       value: 'camera',
                  //       child: Row(
                  //         children: [
                  //           Icon(Icons.videocam),
                  //           SizedBox(width: 8),
                  //           Text(' PDF'),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  //   child: Container(
                  //     padding: EdgeInsets.all(Consts.defaultPadding / 2),
                  //     decoration: BoxDecoration(
                  //       color: Colors.green.shade500,
                  //       boxShadow: const [
                  //         BoxShadow(color: Colors.grey, blurRadius: 1)
                  //       ],
                  //       borderRadius: BorderRadius.circular(8),
                  //     ),
                  //     child: const Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Icon(
                  //           Icons.upload_file_outlined,
                  //           color: Colors.white,
                  //         ),
                  //         Text(
                  //           "Exporter",
                  //           style: TextStyle(color: Colors.white),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: SizedBox(
                width: Get.width,
                child:
                    // SingleChildScrollView(
                    //   scrollDirection: Axis.vertical,
                    //   child: FutureBuilder<List<Operation>>(
                    //     future: OperationsCtrl.getAll(),
                    //     builder: (context, snap) {
                    //       if (!snap.hasData) {
                    //         return const Center(child: CircularProgressIndicator());
                    //       }
                    //       return
                    DataTable(
                  showCheckboxColumn: true,
                  columnSpacing: Consts.defaultPadding * 2,
                  headingTextStyle: Consts.bold,
                  showBottomBorder: true,
                  // minWidth: 600,
                  columns: const [
                    DataColumn(label: Text("N°")),
                    DataColumn(label: Text("Date")),
                    DataColumn(label: Text("Type")),
                    DataColumn(label: Text("Lieu")),
                    DataColumn(label: Text("Espèce")),
                    DataColumn(label: Text("Superficie")),
                    DataColumn(label: Text("Statut")),
                    DataColumn(label: Text("Action")),
                  ],
                  rows: [
                    ...[1, 2, 3, 4, 5, 6].map(
                      (e) => DataRow(
                        cells: [
                          DataCell(Text("$e")),
                          DataCell(
                              Text(Consts.formatDate.format(DateTime.now()))),
                          const DataCell(Text("e.opeType.name")),
                          const DataCell(Text("e.from.phone")),
                          const DataCell(Text("e.to.first.phone")),
                          const DataCell(Text("e.amount.toString()")),
                          const DataCell(Text("e.statut")),
                          DataCell(
                            OutlinedButton(
                              onPressed: () {},
                              child: const Text("Traiter"),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                  //     );
                  //   },
                  // ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
