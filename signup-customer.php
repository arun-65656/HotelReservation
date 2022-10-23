<?php require_once "dataprocessing.php"; ?>
<?php
$name ='';
$email ='';
?>
<html>
<head>
    <meta charset="UTF-8">
    <title>Signup Page</title>
    <link rel="stylesheet" href="bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-4 offset-md-4 form">
                <form action="signup-customer.php" method="POST" autocomplete="">
                    <h2 class="text-center">Signup Here</h2>
                    <div class="form-group">
                        <input class="form-control" type="text" name="name" placeholder="Full Name" required value="<?php echo $name ?>">
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="email" name="email" placeholder="Email ID" required value="<?php echo $email ?>">
                    </div>				
					<div class="form-group">
                        <input class="form-control" type="text" name="phone" placeholder="Phone" required">
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="password" name="password" placeholder="Password" required>
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="password" name="rpassword" placeholder="Repeat password" required>
                    </div>
                    <div class="form-group">
                        <input class="form-control button" type="submit" name="signup" value="Signup">
                    </div>
                    <div class="link login-link text-center"><a href="index.php">Login Here</a></div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>