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
result($count);
?>