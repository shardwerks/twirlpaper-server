<?php

#	author		= "Shultz Wang"
#	version 	= "Revision 0.1"
#	date		= "September 08, 2007 07:52:17 AM"
#	copyright	= "Copyright (c) 2007 Shultz Wang"
#
#	Library of commonly used functions

$dbhost = 'shard.db';
$dbuser = 'tinterface';
$dbpass = '6047r4nc3';
$dbname = 'twirlpaper';
$realm = 'Restricted@twirlpaper.com';

// Make a MySQL Connection
mysql_connect($dbhost, $dbuser, $dbpass) or exit(mysql_errno().': '.mysql_error());
mysql_select_db($dbname) or exit(mysql_errno().': '.mysql_error());

// Set up table names
$TWIRLCONFIG = array();
$TWIRLCONFIG['SITE_URL']			= 'http://www.twirlpaper.com/';
$TWIRLCONFIG['TABLE_PREFIX']		= 'cpg14x_';
$TWIRLCONFIG['TABLE_PICTURES']		= $TWIRLCONFIG['TABLE_PREFIX'].'pictures';
$TWIRLCONFIG['TABLE_ALBUMS']		= $TWIRLCONFIG['TABLE_PREFIX'].'albums';
$TWIRLCONFIG['TABLE_COMMENTS']		= $TWIRLCONFIG['TABLE_PREFIX'].'comments';
$TWIRLCONFIG['TABLE_CATEGORIES']	= $TWIRLCONFIG['TABLE_PREFIX'].'categories';
$TWIRLCONFIG['TABLE_CONFIG']		= $TWIRLCONFIG['TABLE_PREFIX'].'config';
$TWIRLCONFIG['TABLE_USERGROUPS']	= $TWIRLCONFIG['TABLE_PREFIX'].'usergroups';
$TWIRLCONFIG['TABLE_VOTES']			= $TWIRLCONFIG['TABLE_PREFIX'].'votes';
$TWIRLCONFIG['TABLE_USERS']			= $TWIRLCONFIG['TABLE_PREFIX'].'users';
$TWIRLCONFIG['TABLE_BANNED']		= $TWIRLCONFIG['TABLE_PREFIX'].'banned';
$TWIRLCONFIG['TABLE_EXIF']			= $TWIRLCONFIG['TABLE_PREFIX'].'exif';
$TWIRLCONFIG['TABLE_FILETYPES']		= $TWIRLCONFIG['TABLE_PREFIX'].'filetypes';
$TWIRLCONFIG['TABLE_ECARDS']		= $TWIRLCONFIG['TABLE_PREFIX'].'ecards';
$TWIRLCONFIG['TABLE_TEMPDATA']		= $TWIRLCONFIG['TABLE_PREFIX'].'temp_data';
$TWIRLCONFIG['TABLE_FAVPICS']		= $TWIRLCONFIG['TABLE_PREFIX'].'favpics';
$TWIRLCONFIG['TABLE_BRIDGE']		= $TWIRLCONFIG['TABLE_PREFIX'].'bridge';
$TWIRLCONFIG['TABLE_VOTE_STATS']	= $TWIRLCONFIG['TABLE_PREFIX'].'vote_stats';
$TWIRLCONFIG['TABLE_HIT_STATS']		= $TWIRLCONFIG['TABLE_PREFIX'].'hit_stats';
$TWIRLCONFIG['TABLE_NONCE'] 		= 'nonce';
$TWIRLCONFIG['TABLE_SLOPE1']		= 'slope1';



/**
 * Sanitise a string for database use (adapted from elgg)
 *
 * @param string $string The string to sanitise
 * @return string Sanitised string
 */
function sanitize_string($string, $length) {
	return mysql_real_escape_string(substr(trim($string), 0, $length));
}



// If login and second value valid, return True,
// otherwise assume user is guest and return False
function tuser_confirm($TWIRLUSER) {
	if (isset($_POST["username"]) && isset($_POST["userhash"])) {
		if ($_POST["userhash"] === "00000000000000000000000000000000")
			return False;

		$loginsafe = sanitize_string($_POST["username"], 32);
		$sql = "SELECT userhash FROM $TWIRLUSER WHERE user_name = '$loginsafe';";
		$result = mysql_fetch_assoc(tquery($sql));
		if ($_POST["userhash"] === $result["userhash"])
			return $loginsafe;
	}
	return False;
}



// Store second value into user records.  Return Boolean
// indicating success of MySQL update.
function tuser_update($TWIRLUSER, $key = "", $value = "", $long = False) {
	if (isset($_POST["login"])) {
		$loginsafe = sanitize_string($_POST["login"], 32);
		$keysafe = sanitize_string($key, 32);
		if ($long) $valuesafe = sanitize_string($value, 128);
		else $valuesafe = sanitize_string($value, 32);

		$sql = "UPDATE $TWIRLUSER SET $keysafe = '$valuesafe'
			WHERE user_name = '$loginsafe';";
		if (tquery($sql)) return True;
	}
	return False;
}


// Simplify mysql_query
function tquery($sql) {
	$result = mysql_query($sql) or exit(mysql_errno().': '.mysql_error());
	//if (!($result = mysql_query($sql))) {
	//	echo $sql.chr(13).chr(10);
	//	exit(mysql_errno().': '.mysql_error());
	//}
	return $result;

}

?>
