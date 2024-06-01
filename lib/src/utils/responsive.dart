import 'package:get/get.dart';

// Size size() => Get.size;

bool isMobile() => Get.width < 650;

bool isTab() => Get.width < 1300 && Get.width >= 650;

bool isDesktop() => Get.width >= 1300;
