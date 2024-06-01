import 'package:flutter/material.dart';
import '../../models/my_user.dart';
import '../../utils/consts.dart';
import 'package:get/get.dart';

class FauneWidget extends StatefulWidget {
  const FauneWidget({super.key});

  @override
  State<FauneWidget> createState() => _FauneWidgetState();
}

class _FauneWidgetState extends State<FauneWidget> {
  List<MyUser> usersList = [];
  // myInit() async {
  //   usersList = await UserDBCtrl.getAll();
  //   if (usersList.isEmpty) {}
  // }

  // @override
  // void initState() {
  //   myInit();
  //   super.initState();
  // }

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
              child: Text("ESPÈCES DE LA FAUNE", style: Consts.titleStyle),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: Get.width / 3,
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade500),
                            borderRadius: BorderRadius.circular(7)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Consts.col3),
                            borderRadius: BorderRadius.circular(7)),
                        prefixIcon: const Icon(Icons.search),
                        hintText: "Recherche",
                      ),
                    ),
                  ),
                  const Spacer(),
                  PopupMenuButton<String>(
                    tooltip: null,
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'xls',
                        child: Row(
                          children: [
                            Icon(Icons.video_library),
                            SizedBox(width: 8),
                            Text('Xls'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'pdf',
                        child: Row(
                          children: [
                            Icon(Icons.videocam),
                            SizedBox(width: 8),
                            Text(' PDF'),
                          ],
                        ),
                      ),
                    ],
                    child: Container(
                      padding: EdgeInsets.all(Consts.defaultPadding / 2),
                      decoration: BoxDecoration(
                        color: Colors.green.shade500,
                        boxShadow: const [
                          BoxShadow(color: Colors.grey, blurRadius: 1)
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.upload_file_outlined,
                            color: Colors.white,
                          ),
                          Text(
                            "Exporter",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 40,
                  //   width: 150,
                  //   child: ElevatedButton.icon(
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: Consts.col3,
                  //       shape: const RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.all(
                  //           Radius.circular(8.0),
                  //         ),
                  //       ),
                  //     ),
                  //     icon: const Icon(Icons.add_box_rounded),
                  //     label: const Text("Ajouter"),
                  //     onPressed: () {},
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
                    //   child: FutureBuilder<List<MyUser>>(
                    //     future: UserDBCtrl.getAll(),
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
                    DataColumn(label: Text("Photo")),
                    DataColumn(label: Text("Nom")),
                    DataColumn(label: Text("Catégorie")),
                    DataColumn(label: Text("Mail")),
                    // DataColumn(label: Text("Numéro")),
                    // DataColumn(label: Text("Adresse")),
                    DataColumn(label: Text("Actions")),
                  ],
                  rows: [
                    ...[1, 2, 3, 4, 5, 6, 7, 8].map(
                      (e) => DataRow(
                        cells: [
                          DataCell(Text("$e")),
                          const DataCell(Text("e.avatar")),
                          const DataCell(Text("e.name")),
                          const DataCell(Text("e.gender")),
                          const DataCell(Text("e.email")),
                          // DataCell(Text("e.phone")),
                          // DataCell(Text("e.adress")),
                          DataCell(
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {},
                                ),
                                // Switch(
                                //   value: e.enable,
                                //   onChanged: (val) async {
                                //     // await PartnerDBCtrl.update(s, partID: partID, field: field, data: data)
                                //     // setState(() {});
                                //   },
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                  // );
                  //       },
                ),
                //   ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
