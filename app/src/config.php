<?php

define('DB_HOST', '192.168.56.20');
define('DB_NAME', 'lamp_db');
define('DB_USER', 'admin_web');
define('DB_PASSWORD', '1234');

$mysqli = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);

?>