import 'package:crypt/crypt.dart';
import 'package:intl/intl.dart';

class OtherFuncts {
  static String formatAmount(int value) {
    var formatter = NumberFormat.decimalPattern('fr');
    return formatter.format(value);
  }

  static String saltPswd(String pswd) {
    final c3 =
        Crypt.sha256(pswd, salt: 'L?OKJP@G!obal!LR@3d&#98+#exchAnnnng€ZG');
    return c3.toString();
  }

  static String saltPartnerPswd(String pswd) {
    final c3 =
        Crypt.sha256(pswd, salt: '!LG!obalR@3d&#98+#ExchannnngeZGL?OKJP@');
    return c3.toString();
  }
}
