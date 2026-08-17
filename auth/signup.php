<?php
include "../connect.php";
$username = filterRequest("username");
$password = sha1(filterRequest("password"));
$email = filterRequest("email");
$phone = filterRequest("phone");
$verfiycode = rand(1000,9999);



$stmt=$con->prepare("SELECT * FROM users WHERE user_email =? OR user_phone=?");
$stmt->execute(array($email,$phone));
$count =$stmt->rowCount();
if ($count>0){
    printFaliure("phone or email exist");
}else{
    $data = array(
        "user_name"=>$username,
        "user_email"=>$email,
        "user_phone"=>$phone,
        "user_password"=>$password,
        "user_verfiycode"=>$verfiycode,
    );
    sendEmail($email,"Verfiy Code For Kush Crown App","Verfiy Code $verfiycode");
    insertData("users",$data);
}
