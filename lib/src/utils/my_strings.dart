import 'package:get_storage/get_storage.dart';

import 'consts.dart';

class MyStrings {
  static Map<String, dynamic> fr = {
    "welcome": "",
    "slider1": "",
    "slider2": "",
  };
  static Map<String, dynamic> es = {
    "welcome": "",
    "slider1": "",
    "slider2": "",
  };
  static Map<String, dynamic> en = {
    "welcome": "",
    "slider1": "",
    "slider2": "",
  };

  // List<String> data = ["welcome", "slide1"];

  // static List<String> keys = MyKeys.values.map((e) => e.name).toList();

  // MyKeys.
}

String getString(String key) {
  // String lang;
  // Timer(Duration.zero, () {
  //   lang = GetStorage().read(LocalStores.language.name);
  // });
  String lang = GetStorage().read(LocalStores.language.name);

  return (lang == "fr"
      ? MyStrings.fr
      : lang == "en"
          ? MyStrings.en
          : MyStrings.es)[key];
}
