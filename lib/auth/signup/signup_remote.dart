import 'package:koosh/app_link_api.dart';
import 'package:koosh/core/class/crud_request.dart';

class SignUpRemoteData {
  CrudRequest crudRequest;

  SignUpRemoteData(this.crudRequest);

  // --GET DATA--------------------------------------------------

  Future<Object> getData(
    String username,
    String password,
    String email,
    String phone,
  ) async {
    // --SEND POST REQUEST---------------------------------------

    var response = await crudRequest.postData(AppLink.signUp, {
      "username": username,
      "password": password,
      "email": email,
      "phone": phone,
    });

    // --RETURN RESPONSE-----------------------------------------

    return response.fold((l) => l, (r) => r);
  }

  // --POST DATA-------------------------------------------------

  Future<Object> postdata(
    String username,
    String password,
    String email,
    String phone,
  ) async {
    // --CALL GET DATA-------------------------------------------

    return await getData(username, password, email, phone);
  }
}
