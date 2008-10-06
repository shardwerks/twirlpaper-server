<?php
$dbhost = 'localhost';
$dbuser = 'tinterface';
$dbpass = 'lemmein';

// Make a MySQL Connection
mysql_connect($dbhost, $dbuser, $dbpass) or die(mysql_error());

$dbname = 'twirl';
mysql_select_db($dbname) or die(mysql_error());
?>
