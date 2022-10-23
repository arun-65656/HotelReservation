<?php require_once "dataprocessing.php"; ?>
<?php
$name ='';
$email ='';
?>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="bootstrap.min.css">
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-4 offset-md-4 form login-form">
                <form action="index.php" method="POST" autocomplete="">
                    <h2 class="text-center">Login Here</h2>
                    <?php
                    if(count($errors) > 0){
                        ?>
                        <div class="alert alert-danger text-center">
                            <?php
                            foreach($errors as $showerror){
                                echo $showerror;
                            }
                            ?>
                        </div>
                        <?php
                    }
                    ?>
                    <div class="form-group">
                        <input class="form-control" type="email" name="email" placeholder="Enter Email" required value="<?php echo $email ?>">
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="password" name="password" placeholder="Enter Password" required>
                    </div>
                    <div class="form-group">
                        <input class="form-control button" type="submit" name="login" value="Login">
                    </div>
                    <div class="link login-link text-center"><a href="signup-customer.php">Click Here To Signup</a></div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>