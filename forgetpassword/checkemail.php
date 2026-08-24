<?php

include "../connect.php";

$email = filterRequest("email");
$verfiycode = rand(1000, 9999);

$stmt = $con->prepare(
    "SELECT * FROM users WHERE user_email = ?"
);

$stmt->execute(array($email));

$count = $stmt->rowCount();

if ($count > 0) {

    $data = array(
        "user_verfiycode" => $verfiycode
    );

    updateData(
        "users",
        $data,
        "user_email='$email'",
            false

    );

    sendEmail(
        $email,
        "Verfiy Code Kush Crown App",
        "Verfiy Code $verfiycode"
    );

    printSuccess();

} else {

    printFaliure("Email not found");
}