<?php

include "connect.php";

if (sendEmail(
    "almotasim1900@gmail.com",
    "الرسالة الجديدة بعد التحويل",
    "عنوان الرسالة ياغفران"
)) {

    echo "تم إرسال البريد بنجاح";

} else {

    echo "فشل إرسال البريد";

}

?>