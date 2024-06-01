import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/partner.dart';
import '../utils/consts.dart';

class AddPartner extends StatefulWidget {
  final Partner? partnersltd;
  const AddPartner({super.key, this.partnersltd}); //this.partnersltd

  @override
  State<AddPartner> createState() => _AddPartnerState();
}

class _AddPartnerState extends State<AddPartner> {
  final formKey = GlobalKey<FormState>();
  bool isHiddenPassword = true;
  bool isEditing = false;
  bool loading = false;
  String? sltdPartnerId;

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController pswdCtrl = TextEditingController(text: "12345");
  TextEditingController adressCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController mailCtrl = TextEditingController();

  bool validateFields() {
    if (nameCtrl.text.isEmpty ||
        pswdCtrl.text.isEmpty ||
        adressCtrl.text.isEmpty ||
        phoneCtrl.text.isEmpty ||
        phoneCtrl.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Champs manquants'),
            content: const Text('Veuillez remplir tous les champs.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return false;
    }
    return true;
  }

  // Future<String> getPartnerRef() async {
  //   var ptnrs = await PartnerDBCtrl.getAll();
  //   int partIdx = ptnrs.length + 1;
  //   return "${Consts.partnerPrefix}$partIdx";
  // }

  // addPartner() async {
  //   String ref = await getPartnerRef();
  //   loading = true;
  //   Partner partner = Partner(
  //     registedNo: ref,
  //     email: mailCtrl.text,
  //     password: OtherFuncts.saltPartnerPswd("12345"),
  //     enable: true,
  //     avatar: "avatar",
  //     name: nameCtrl.text,
  //     reference: ref,
  //     verified: true,
  //     notifToken: "notifToken",
  //     docs: [],
  //     pin: 1234,
  //     connected: true,
  //     adress: adressCtrl.text,
  //     phone: phoneCtrl.text,
  //     date: Timestamp.now(),
  //     balance: 255000,
  //   );
  //   await PartnerDBCtrl.add(partner);
  //   nameCtrl.clear();
  //   pswdCtrl.clear();
  //   adressCtrl.clear();
  //   phoneCtrl.clear();
  //   mailCtrl.clear();
  //   Get.back();
  //   loading = false;
  // }

  fillForm(Partner p) {
    if (widget.partnersltd != null) {
      sltdPartnerId = widget.partnersltd!.id;
      nameCtrl.text = p.name;
      phoneCtrl.text = p.phone;
      mailCtrl.text = p.email;
      adressCtrl.text = p.adress;
      isEditing = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20),
      children: [
        ListTile(
          title: Text(
            isEditing
                ? "Veuillez remplire le formulaire pour modifier les informations de cet agent"
                : "Veuillez remplir le formulaire pour ajouter un nouvel agent.",
            style: Consts.bold,
          ),
          trailing: IconButton(
              onPressed: () => Get.back(), icon: const Icon(Icons.close)),
        ),
        SizedBox(height: Consts.defaultPadding),
        TextFormField(
          controller: nameCtrl,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            labelText: "Nom et prénom",
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Consts.col3, width: 2),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
        ),
        SizedBox(height: Consts.defaultPadding),
        TextFormField(
          controller: mailCtrl,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            labelText: "Email",
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Consts.col3, width: 2),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
        ),
        SizedBox(height: Consts.defaultPadding),
        TextFormField(
          controller: phoneCtrl,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            labelText: "Téléphone",
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Consts.col3, width: 2),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
        ),
        SizedBox(height: Consts.defaultPadding),
        TextFormField(
          controller: adressCtrl,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            labelText: "Adresse",
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Consts.col3, width: 2),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
        ),
        SizedBox(height: Consts.defaultPadding),
        TextField(
          controller: pswdCtrl,
          enabled: false,
          // obscureText: isHiddenPassword,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  isHiddenPassword = !isHiddenPassword;
                });
              },
              child: Icon(
                isHiddenPassword ? Icons.visibility : Icons.visibility_off,
              ),
            ),
            labelText: "Mot de passe",
          ),
        ),
        SizedBox(height: Consts.defaultPadding),
        loading
            ? const Center(child: CircularProgressIndicator())
            : ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Consts.col3),
                onPressed: () {
                  // if (validateFields()) {
                  //   isEditing
                  //       ? showDialog(
                  //           context: context,
                  //           builder: (BuildContext context) => AlertDialog(
                  //                 title:
                  //                     const Text("Confirmer la modification"),
                  //                 content: const Text(
                  //                     "Êtes-vous sûr de vouloir modifier les informations de cet agent ?"),
                  //                 actions: [
                  //                   TextButton(
                  //                     child: const Text("Annuler"),
                  //                     onPressed: () => Get.back(),
                  //                   ),
                  //                   TextButton(
                  //                     child: const Text("Confirmer"),
                  //                     onPressed: () async {
                  //                       await updatePartner();
                  //                       Get.back();
                  //                     },
                  //                   ),
                  //                 ],
                  //               ))
                  //       : addPartner();
                  // }
                },
                child: Text(isEditing ? "Modifier" : "Ajouter"),
              ),
      ],
    );
  }
}
