import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Consts {
  // static String baseUrl = "https://api.zamzam-tech.com/uploads/";

  // static String saltPsw(String psw) {
  //   var generator = PBKDF2();
  //   var salt = "!2àOZP!@dVXN044sf0F0é";
  //   var hash = generator.generateKey(psw, salt, 1000, 32);
  //   return hash.toString();
  // }
  static String comisAccId = "XAF";

  static String appName = "SellWave";
  static String prefix() => "EG/C/U24";
  static String devise = "XAF";

  static double globalRadius = 8.0;
  static String partnerPrefix = "EGC/A";
  static DateFormat formatDate = DateFormat('dd/MMM/yyyy HH:mm', 'fr_FR');
  static Decoration myCtntStatDeco = BoxDecoration(
    color: Colors.white,
    boxShadow: const [BoxShadow(color: Colors.grey)],
    borderRadius: BorderRadius.circular(8),
  );

  // static String agentPrefix = "FUF/A-";
  // static String teacherPrefix = "FUF/P-";
  // static String studentPrefix = "FUF/E-";
  static Color col1 = Colors.brown;
  static Color col2 = const Color(0xFF4E9FBF);
  static Color col3 = const Color(0xFF04ADBF);
  static Color iconcolor1 = Colors.grey;
  static Color bgColor = const Color(0xFF212332);
  static double defaultPadding = 16.0;

  static TextStyle bold = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: Colors.black,
  );
  static TextStyle titleStyle = const TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
  );
  static TextStyle subTitleStyle = const TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );
  static TextStyle subTitleStyle2 = const TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );

  static TextStyle buttonStyle = const TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static double gRadius = 8.0;

  // static EdgeInsetsGeometry respPdg() => EdgeInsets.symmetric(
  //       vertical: 20.0,
  //       horizontal: Responsive.isMobile() ? 30.0 : Get.width / 6,
  //     );

  static Size size() => Get.size;
  static double iconSize = 20;
}

enum LocalStores { firstUse, language, myUser }
