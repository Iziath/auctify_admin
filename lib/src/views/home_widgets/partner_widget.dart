import 'package:flutter/material.dart';
import '../../utils/consts.dart';
import '../../views/add_partner.dart';
import 'package:get/get.dart';

class PartnersWidget extends StatefulWidget {
  const PartnersWidget({super.key});

  @override
  State<PartnersWidget> createState() => _PartnersWidgetState();
}

class _PartnersWidgetState extends State<PartnersWidget> {
  // List<Partner> partnerList = [];
  // myInit() async {
  //   partnerList = await PartnerDBCtrl.getAll();
  //   if (partnerList.isEmpty) {}
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
              child: Text("Agents", style: Consts.titleStyle),
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
                  SizedBox(
                    height: 40,
                    width: 150,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Consts.col3,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                      ),
                      icon: const Icon(Icons.add_box_rounded),
                      label: const Text("Ajouter"),
                      onPressed: () {
                        Get.defaultDialog(
                          title: "INFORMATIONS PARTENAIRE",
                          content: SizedBox(
                            width: Get.width / 3,
                            height: Get.height * .8,
                            child: const AddPartner(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            // SizedBox(
            //   child: SingleChildScrollView(
            //     child: DataTable(
            //         columnSpacing: Consts.defaultPadding * 2,
            //         headingTextStyle: Consts.bold,
            //         showBottomBorder: true,
            //         showCheckboxColumn: true,
            //         // minWidth: 600,
            //         columns: const [
            //           DataColumn(label: Text("N°")),
            //           DataColumn(label: Text("Photo")),
            //           DataColumn(label: Text("Identifiant")),
            //           DataColumn(label: Text("Nom")),
            //           DataColumn(label: Text("Mail")),
            //           DataColumn(label: Text("Numéro")),
            //           DataColumn(label: Text("Adresse")),
            //           DataColumn(label: Text("Vérifié")),
            //           DataColumn(label: Text("Solde")),
            //           DataColumn(label: Text("Actions")),
            //         ],
            //         rows: [
            //           ...partnerList
            //               .map(
            //                 (e) => DataRow(
            //                   cells: [
            //                     DataCell(Text("${partnerList.indexOf(e) + 1}")),
            //                     DataCell(
            //                       CircleAvatar(
            //                         backgroundImage: NetworkImage(e.avatar!),
            //                       ),
            //                     ),
            //                     DataCell(Text(e.registedNo)),
            //                     DataCell(Text(e.name)),
            //                     DataCell(Text(e.email)),
            //                     DataCell(Text(e.phone)),
            //                     DataCell(Text(e.adress)),
            //                     DataCell(Text(e.verified.toString())),
            //                     DataCell(Text(e.balance.toString())),
            //                     DataCell(
            //                       IconButton(
            //                         icon: Icon(Icons.edit),
            //                         onPressed: () {},
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               )
            //               .toList()
            //         ]),
            //   ),
            // ),

            Expanded(
              child: SizedBox(
                width: Get.width,
                // child: SingleChildScrollView(
                //   scrollDirection: Axis.vertical,
                //   child: FutureBuilder<List<Partner>>(
                //       future: PartnerDBCtrl.getAll(),
                //       builder: (context, snap) {
                //         if (!snap.hasData) {
                //           return const Center(
                //               child: CircularProgressIndicator());
                //         }
                //         return DataTable(
                //             showCheckboxColumn: true,
                //             columnSpacing: Consts.defaultPadding * 2,
                //             headingTextStyle: Consts.bold,
                //             showBottomBorder: true,
                //             // minWidth: 600,
                //             columns: const [
                //               DataColumn(label: Text("N°")),
                //               DataColumn(label: Text("Photo")),
                //               DataColumn(label: Text("Identifiant")),
                //               DataColumn(label: Text("Nom")),
                //               DataColumn(label: Text("Mail")),
                //               DataColumn(label: Text("Numéro")),
                //               DataColumn(label: Text("Adresse")),
                //               DataColumn(label: Text("Vérifié")),
                //               DataColumn(label: Text("Solde")),
                //               DataColumn(label: Text("Actions")),
                //             ],
                //             rows: [
                //               ...snap.data!.map(
                //                 (e) => DataRow(
                //                   cells: [
                //                     DataCell(
                //                         Text("${snap.data!.indexOf(e) + 1}")),
                //                     DataCell(
                //                       CircleAvatar(
                //                         backgroundImage:
                //                             NetworkImage(e.avatar!),
                //                       ),
                //                     ),
                //                     DataCell(Text(e.registedNo)),
                //                     DataCell(Text(e.name)),
                //                     DataCell(Text(e.email)),
                //                     DataCell(Text(e.phone)),
                //                     DataCell(Text(e.adress)),
                //                     DataCell(Text(e.verified.toString())),
                //                     DataCell(Text(e.balance.toString())),
                //                     DataCell(
                //                       Row(
                //                         children: [
                //                           IconButton(
                //                             icon: const Icon(Icons.edit),
                //                             onPressed: () {
                //                               Get.dialog(
                //                                 Dialog(
                //                                   child: SingleChildScrollView(
                //                                     // reverse: true,
                //                                     child: Container(
                //                                       width: Get.width / 3,
                //                                       padding: EdgeInsets.all(
                //                                           Consts
                //                                               .defaultPadding),
                //                                       child: AddPartner(
                //                                         partnersltd: e,
                //                                       ),
                //                                     ),
                //                                   ),
                //                                 ),
                //                                 barrierDismissible: true,
                //                               );
                //                             },
                //                           ),
                //                           Switch(
                //                             value: e.enable,
                //                             onChanged: (val) async {
                //                               // await PartnerDBCtrl.update(s, partID: partID, field: field, data: data)
                //                               // setState(() {});
                //                             },
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               )
                //             ]);
                //       }),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
