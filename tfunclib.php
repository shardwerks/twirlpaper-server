<?php

#	author		= "Shultz Wang"
#	version 	= "Revision 0.1"
#	date		= "September 08, 2007 07:52:17 AM"
#	copyright	= "Copyright (c) 2007 Shultz Wang"
#
#	Library of commonly used functions


	// Define constants
	define("LENGTH_SHORT",32);	// Max length of: userid, imageid, nextchange
	define("LENGTH_LONG",128);	// Max length of: imageinfo, imageurl,
								//	imagetags, subscribedtags

	// If login and second value valid, return True,
	// otherwise assume user is guest and return False
	function tuser_confirm($second = "") {
		$isuser = False;
		if (isset($_POST["login"]) && isset($_POST[$second])) {

			$loginsafe = tsafe_mysql_short($_POST["login"]);

			if ($user = mysql_query(
					"SELECT * FROM elggusers WHERE username = '$loginsafe'")
					or die(mysql_error())) {
				$user = mysql_fetch_assoc($user);
				if ($_POST[$second] === $user[$second])
					$isuser = True;
			}
		}
		return $isuser;
	}


	// Store second value into user records.  Return Boolean
	// indicating success of MySQL update.
	function tuser_update($key = "", $value = "", $long = False) {
		if (isset($_POST["login"])) {

			$loginsafe = tsafe_mysql_short($_POST["login"]);
			$keysafe = tsafe_mysql_short($key);
			if ($long) $valuesafe = tsafe_mysql_long($value);
			else $valuesafe = tsafe_mysql_short($value);

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
