import 'package:koosh/core/class/status_request.dart';

// --HANDLE DATA-------------------------------------------------

handlingData(response) {
  // --CHECK STATUS REQUEST--------------------------------------

  if (response is StatusRequest) {
    // --RETURN FAILURE-------------------------------------------

    return response;
  } else {
    // --SUCCESS--------------------------------------------------

    return StatusRequest.success;
  }
}
