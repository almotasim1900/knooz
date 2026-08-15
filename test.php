<?php 

include './connect.php';
$table = "users";
// $name = filterRequest("namerequest");
$data = array( 
"user_name" => "wael",
"user_email" => "wael@gmail.com",
"user_phone" => "324234",
"user_verfiycode" => "3243243",       
);
$count = insertData($table , $data);