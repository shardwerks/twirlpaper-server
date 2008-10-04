<?php
$dbhost = 'localhost';
$dbuser = 'tinterface';
$dbpass = 'lemmein';

$conn = mysql_connect($dbhost, $dbuser, $dbpass) or die
    ('Error connecting to mysql');

$dbname = 'twirl';
mysql_select_db($dbname);
?>
