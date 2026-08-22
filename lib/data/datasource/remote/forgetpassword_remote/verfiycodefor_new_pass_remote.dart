import 'package:koosh/app_link_api.dart';
import 'package:koosh/core/class/crud_request.dart';

class VerfiyCodeForgetPasswordRemoteData {
  CrudRequest crudRequest;

  VerfiyCodeForgetPasswordRemoteData(this.crudRequest);

  Future<Object> postdata(String email, String verfiycode) async {
    var response = await crudRequest.postData(AppLink.verfiyCodeForNewPass, {
      "email": email,
      "verfiycode": verfiycode,
    });

    return response.fold((l) => l, (r) => r);
  }
}
