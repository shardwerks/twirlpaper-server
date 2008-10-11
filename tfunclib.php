<?php

#	author		= "Shultz Wang"
#	version 	= "Revision 0.1"
#	date		= "September 08, 2007 07:52:17 AM"
#	copyright	= "Copyright (c) 2007 Shultz Wang"
#
#	Library of commonly used functions

$dbhost = 'localhost';
$dbuser = 'tinterface';
$dbpass = 'lemmein';

// Make a MySQL Connection
mysql_connect($dbhost, $dbuser, $dbpass) or die(mysql_error());

$dbname = 'twirl';
mysql_select_db($dbname) or die(mysql_error());


// If login and second value valid, return True,
// otherwise assume user is guest and return False
function tuser_confirm() {
    $isuser = False;
    if (isset($_POST["username"]) && isset($_POST["userid"])) {
        $loginsafe = sanitize_string($_POST["username"], 32);
        if ($user = mysql_query(
                "SELECT * FROM elggusers_entity WHERE username = '$loginsafe'")
                or die(mysql_error())) {
            $user = mysql_fetch_assoc($user);
            if ($_POST["userid"] === $user["userid"])
                $isuser = True;
        }
    }
    return $isuser;
}

// Store second value into user records.  Return Boolean
// indicating success of MySQL update.
function tuser_update($key = "", $value = "", $long = False) {
    if (isset($_POST["login"])) {

        $loginsafe = sanitize_string($_POST["login"], 32);
        $keysafe = sanitize_string($key, 32);
        if ($long) $valuesafe = sanitize_string($value, 128);
        else $valuesafe = sanitize_string($value, 32);

        if ($user = mysql_query(
                "UPDATE elggusers SET $keysafe = '$valuesafe'
                WHERE username = '$loginsafe'")
                or die(mysql_error()))
            return True;
    }
    return False;
}

/**
 * Sanitise a string for database use (adapted from elgg)
 *
 * @param string $string The string to sanitise
 * @return string Sanitised string
 */
function sanitize_string($string, $length) {
    return mysql_real_escape_string(substr(trim($string), 0, $length));
}
?>
