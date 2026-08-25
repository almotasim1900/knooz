import 'package:koosh/app_link_api.dart';
import 'package:koosh/core/class/crud_request.dart';

class HomeRemoteData {
  CrudRequest crudRequest;
  HomeRemoteData(this.crudRequest);
  Future<Object> getData() async {
    var response = await crudRequest.postData(AppLink.homePage, {});
    return response.fold((l) => l, (r) => r);
  }
}
