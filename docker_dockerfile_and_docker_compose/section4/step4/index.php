<?php
header("content-type: text");
$host = "db";
$username = "root";
$pw = "my!!!root!!!pw";

$conn = new mysqli($host, $username, $pw);

if ($conn->connect_error > 0) {
    echo $db->connect_error;
} else {
    echo "DB connection successful\n\n";

    $result = mysqli_query($conn, "SHOW DATABASES;");

    while ($row = mysqli_fetch_row($result)) {
        echo $row[0]."\n";
    }
}
