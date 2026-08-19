import 'package:koosh/app_link_api.dart';
import 'package:koosh/core/class/crud_request.dart';

class TestData {
  CrudRequest crudRequest;
  TestData(this.crudRequest);
  Future<Object> getData() async {
    var response = await crudRequest.postData(AppLink.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
