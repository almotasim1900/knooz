import 'package:koosh/app_link_api.dart';
import 'package:koosh/core/class/crud_request.dart';

class VrefiycodesignupRemoteData {
  CrudRequest crudRequest;

  VrefiycodesignupRemoteData(this.crudRequest);

  Future<Object> postData(String email, String verfiycode) async {
    var response = await crudRequest.postData(AppLink.verfiyCodeSignUp, {
      "email": email,
      "verfiycode": verfiycode,
    });

    return response.fold((l) => l, (r) => r);
  }
}
