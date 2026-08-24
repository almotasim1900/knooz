<?php

include "../connect.php";

$email = filterRequest("email");
$password = password_hash(
    filterRequest("password"),
    PASSWORD_DEFAULT
);

$data = array(
    "user_password" => $password
);

updateData(
    "users",
    $data,
    "user_email = '$email'"
);