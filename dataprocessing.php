<?php
session_start();
require "dbconfig.php";
$errors = [];

if (isset($_POST["login-now"])) {
    header("location: index.php");
}
if (isset($_POST["signup"])) {
    $name = mysqli_real_escape_string($conn, $_POST["name"]);
    $email = mysqli_real_escape_string($conn, $_POST["email"]);
    $phone = mysqli_real_escape_string($conn, $_POST["phone"]);
    $password = mysqli_real_escape_string($conn, $_POST["password"]);
    $rpassword = mysqli_real_escape_string($conn, $_POST["rpassword"]);
    if ($password !== $rpassword) {
        $errors["password"] = "Password Must Be Same";
    }
    $email_check = "SELECT * FROM customers WHERE email = '$email'";
    $resultset = mysqli_query($conn, $email_check);
    if (mysqli_num_rows($resultset) > 0) {
        $errors["email"] = "This email has been used";
    }
    if (count($errors) === 0) {
        $insert_data = "INSERT INTO customers (name, email, phone, password)
                        values('$name', '$email', '$phone', '$password')";
        $data_check = mysqli_query($conn, $insert_data);
        if ($data_check) {
            header("location: index.php");
        } else {
            $errors["db-error"] = "Data Insertion Failed";
        }
    }
}

if (isset($_POST["login"])) {
    $password = mysqli_real_escape_string($conn, $_POST["password"]);
	$email = mysqli_real_escape_string($conn, $_POST["email"]);
    $check_email = "SELECT * FROM customers WHERE email = '$email'";
    $resultset = mysqli_query($conn, $check_email);
    if (mysqli_num_rows($resultset) > 0) {
        $fetch = mysqli_fetch_assoc($resultset);
        $existingpassword = $fetch["password"];
        if ($password == $existingpassword) {
            $_SESSION["email"] = $email;
            $_SESSION["password"] = $password;
            header("location: home.php");
        } else {
            $errors["email"] = "Please enter correct email and password";
        }
    } else {
        $errors["email"] = "This email is not registered";
    }
}
?>
