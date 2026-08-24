import 'package:get/get.dart';

dynamic validInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return 'empty_field'.tr;
  }

  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return 'invalid_username'.tr;
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return 'invalid_email'.tr;
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return 'invalid_phone'.tr;
    }
  }

  if (val.length < min) {
    return 'too_short'.trParams({'min': min.toString()});
  }

  if (val.length > max) {
    return 'too_long'.trParams({'max': max.toString()});
  }
}
