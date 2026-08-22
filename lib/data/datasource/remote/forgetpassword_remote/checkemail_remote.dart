import 'package:koosh/app_link_api.dart';
import 'package:koosh/core/class/crud_request.dart';

class CheckEmailRemoteData {
  CrudRequest crudRequest;

  CheckEmailRemoteData(this.crudRequest);

  Future<Object> postdata(String email) async {
    var response = await crudRequest.postData(AppLink.checkEmail, {
      "email": email,
    });

    return response.fold((l) => l, (r) => r);
  }
}
