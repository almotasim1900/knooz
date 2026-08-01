
import 'package:get/get.dart';

 dynamic validInput(String val, int min, int max, String type) {
  if(val.isEmpty) {
    return "can't be empty ";
  }
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return 'Not valid username'.tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return 'Not valid Email'.tr;
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return 'Not valid Phone number,'.tr;
    }
  }
  if (val.length < min) {
    return "can't be less than $min ";
  }

  if (val.length > max) {
    return "can't be larger than $max";
  }
  
}
