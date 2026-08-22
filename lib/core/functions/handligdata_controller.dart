import 'package:koosh/core/class/status_request.dart';

// --HANDLE DATA-------------------------------------------------

StatusRequest handlingData(response) {
  // -- CHECK STATUS REQUEST ------------------------------------

  if (response is StatusRequest) {
    return response;
  }

  // -- CHECK SERVER RESPONSE -----------------------------------

  if (response is Map) {
    if (response["status"] == "success") {
      return StatusRequest.success;
    } else {
      return StatusRequest.failure;
    }
  }

  return StatusRequest.serverException;
}
