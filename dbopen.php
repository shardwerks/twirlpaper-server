<?php
$dbhost = 'localhost';
$dbuser = 'interface';
$dbpass = 'lemmein';

$conn = mysql_connect($dbhost, $dbuser, $dbpass) or die
    ('Error connecting to mysql');

$dbname = 'twirl';
mysql_select_db($dbname);
?>
