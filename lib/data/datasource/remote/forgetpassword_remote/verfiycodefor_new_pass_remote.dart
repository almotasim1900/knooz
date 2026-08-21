import 'package:koosh/app_link_api.dart';
import 'package:koosh/core/class/crud_request.dart';

class VerfiyCodeForgetPasswordRemoteData {
  CrudRequest crudRequest;

  VerfiyCodeForgetPasswordRemoteData(this.crudRequest);

  Future<Object> login(String email, String password) async {
    var response = await crudRequest.postData(AppLink.login, {
      "email": email,
      "password": password,
    });

    return response.fold((l) => l, (r) => r);
  }
}
