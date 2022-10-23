<?php require_once "dataprocessing.php"; ?>
<?php
$email = $_SESSION["email"];
$password = $_SESSION["password"];
if ($email != false && $password != false) {
    $sql = "SELECT * FROM customers WHERE email = '$email'";
    $resultset = mysqli_query($conn, $sql);
    if ($resultset) {
        $fetch_info = mysqli_fetch_assoc($resultset);
    }
} else {
    header("location: index.php");
}
?>
<html>
<head>
    <title>Home Page</title>
    <link rel="stylesheet" href="bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <nav class="navbar">
    <a class="navbar-brand" href="#">Hotel Reservation</a>
    <button type="button" class="btn btn-light"><a href="logout-customer.php">Logout Here</a></button>
    </nav>
    <h1>Hello <?php echo $fetch_info["name"]; ?></h1>  
    <h1>You can reserve any hotel of your choice.</h1>  
</body>
</html>