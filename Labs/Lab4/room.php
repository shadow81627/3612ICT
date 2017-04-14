<?php
    $error = '';
    # Set $number to the value entered in the form.
    $number = $_GET['number'];
    
    if (empty($number)) {
        $error = "Error: Missing value\n";
    } else if (!is_numeric($number)) {
        $error = "Error: Nonnumeric value: $number\n";
    } else {
        
        // A simple PHP script demonstrating how to connect to MySQL.
        // Press the 'Run' button on the top to start the web server,
        // then click the URL that is emitted to the Output tab of the console.
    
        $servername = getenv('IP');
        $username = getenv('C9_USER');
        $password = "";
        $database = "hotelDB";
        $dbport = 3306;
    
        // Create connection
        $db = new mysqli($servername, $username, $password, $database, $dbport);
    
        // Check connection
        if ($db->connect_error) {
            die("Connection failed: " . $db->connect_error);
        } 
        //echo "Connected successfully (".$db->host_info.") <br>";
        
        $sql = "SELECT roomNo, price FROM room WHERE hotelNo = " . $number;
        $result = mysqli_query($db, $sql);
    
        if (mysqli_num_rows($result) > 0) {
            // output data of each row
            while($row = mysqli_fetch_assoc($result)) {
                echo "<li> Room Number: " . $row["roomNo"]. "</li>";
            }
        } else {
            echo "0 results";
        }
        
        mysqli_close($db);
            
    }
?>
<!DOCTYPE html>
<!-- Home page for basic room finder example. -->
<html>
  <head>
    <title>Find a room</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="styles/wp.css">
  </head>
  
  <body>  
    <h1>Room Finder</h1>
    
    <?php if(!empty($error)){ ?>
      <p class = "alert"><?= $error ?></p>
    <?php } ?>

    <form method="get" action="room.php">
      <p>Hotel Number: <input type="text" name="number">
      <p><input type="submit" value="Find rooms">
    </form>
  </body>
</html>