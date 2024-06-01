import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/consts.dart';
import '../utils/responsive.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  bool isChecked = false, obscPsw = true;
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController pswCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  onSubmit() {
    // String login = emailCtrl.text, psw = pswCtrl.text;
    // if (login.isEmpty ||
    //         psw.isEmpty ||
    //         login != "admin" ||
    //         psw != ' ' //|| psw != "d€LIVgO/0/@DmeEn"
    //     ) {
    //   Get.defaultDialog(
    //     backgroundColor: Colors.red[200],
    //     title: "connexion_error",
    //     titleStyle: const TextStyle(
    //       fontWeight: FontWeight.bold,
    //       fontSize: 30.0,
    //     ),
    //     content: const Text(
    //       "login_error",
    //       style: TextStyle(fontSize: 20.0),
    //     ),
    //   );
    //   Timer(const Duration(seconds: 2), () => Get.back());
    // } else {
    Get.offAll(() => const Home());
    // }
  }

  @override
  Widget build(BuildContext context) {
    TextFormField email = TextFormField(
      controller: emailCtrl,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: const InputDecoration(
        hintText: "Identifiant",
        prefixIcon: Icon(Icons.info),
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );

    password() => TextFormField(
          controller: pswCtrl,
          autofocus: false,
          obscureText: obscPsw,
          decoration: const InputDecoration(
            hintText: "Mot de passe",
            prefixIcon: Icon(Icons.lock),
            // suffixIcon: InkWell(
            //   child: Icon(Icons.remove_red_eye),
            //   onTap: () => setState(() => obscPsw != obscPsw),
            // ),
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          ),
          onFieldSubmitted: (value) => onSubmit(),
        );

    final loginButton = SizedBox(
      width: MediaQuery.of(context).size.width / 2.5,
      height: 40.0,
      child: ElevatedButton(
        onPressed: () => onSubmit(),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(12),
          backgroundColor: Consts.col1,
        ),
        child: Text(
          "connexion".toUpperCase(),
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    return Scaffold(
      // backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.7),
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding: const EdgeInsets.all(40.0),
            margin: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: isMobile()
                  ? Consts.size().width / 5
                  : isTab()
                      ? Consts.size().width / 4
                      : Consts.size().width / 3,
            ),
            // width: MediaQuery.of(context).size.width / 2.5,
            // height: MediaQuery.of(context).size.height / 1.75,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Image.asset("assets/images/logo.jpg", fit: BoxFit.fitWidth),
                const Text(
                  "ADMINISTRATION",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  Consts.appName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                // const Text("Espace d'Administration"),
                email,
                const SizedBox(height: 8.0),
                password(),
                const SizedBox(height: 24.0),
                // forgotLabel,
                // const SizedBox(height: 18.0),
                loginButton,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
