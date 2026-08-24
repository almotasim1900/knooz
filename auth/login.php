<?php

include "../connect.php";

$email = filterRequest("email");
$password = filterRequest("password");

$stmt = $con->prepare(
    "SELECT * FROM users WHERE user_email = ? AND user_approve = 1"
);

$stmt->execute(array($email));

$user = $stmt->fetch(PDO::FETCH_ASSOC);

if ($user && password_verify($password, $user["user_password"])) {

    echo json_encode(array(
        "status" => "success",
        "data" => array(
            "user_id" => $user["user_id"],
            "user_name" => $user["user_name"],
            "user_email" => $user["user_email"],
            "user_phone" => $user["user_phone"]
        )
    ));

} else {

    echo json_encode(array(
        "status" => "failure",
        "message" => "email or password incorrect"
    ));

}