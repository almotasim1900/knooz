<?php

include "../connect.php";

$email = filterRequest("email");
$verfiycode = filterRequest("verfiycode");

$stmt = $con->prepare(
    "SELECT * FROM users
     WHERE user_email = ?
     AND user_verfiycode = ?"
);

$stmt->execute([
    $email,
    $verfiycode
]);

$count = $stmt->rowCount();

if ($count > 0) {

    $update = $con->prepare(
        "UPDATE users
         SET user_approve = 1
         WHERE user_email = ?"
    );

    $update->execute([
        $email
    ]);

    echo json_encode([
        "status" => "success"
    ]);

} else {

    echo json_encode([
        "status" => "failure",
        "message" => "The code you entered is incorrect"
    ]);

}

?>