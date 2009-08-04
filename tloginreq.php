<?php

#	author	= "Shultz Wang"
#	version 	= "Revision 0.1"
#	date		= "September 08, 2007 07:52:17 AM"
#	copyright	= "Copyright (c) 2007 Shultz Wang"
#
#	Process login request from client

require_once(dirname(__FILE__)."/tfunclib.php");

// Snippets taken from http://www.php.net/features.http-auth

// Generate good nonce by using MD5 to increase UNIQID to 32 chars, using
// the Mersenne Twister for the rand, and more_entropy set to TRUE.
// This is catted to the timestamp so that stale nonces can be discarded,
// in order to prevent attackers from replaying the nonce.
$nonce = md5(uniqid(mt_rand(), true)).dechex(time());

if (empty($_SERVER['PHP_AUTH_DIGEST'])) {
	header('HTTP/1.1 401 Unauthorized');
	header('WWW-Authenticate: Digest realm="'.$realm.
		'",qop="auth",nonce="'.$nonce.'",opaque="'.md5($realm).'"');
	if (!($result = mysql_query("INSERT INTO {$TWIRLCONFIG['TABLE_NONCE']} VALUES('$nonce');")))
		exit(mysql_errno().': '.mysql_error());
	exit('msg=Sign in failed!'.chr(13).chr(10));
}

// Analyze the PHP_AUTH_DIGEST variable
if (!($data = http_digest_parse($_SERVER['PHP_AUTH_DIGEST'])))
	exit('msg=Not digest authentication!'.chr(13).chr(10));

// Check for existance of valid nonce
$noncesafe = sanitize_string($data['nonce'], 40);
$sql = "SELECT * FROM {$TWIRLCONFIG['TABLE_NONCE']} WHERE valid = '$noncesafe';";
if (!($result = tquery($sql))) exit('msg=Invalid nonce!'.chr(13).chr(10));

// Delete valid nonce
mysql_query("DELETE FROM {$TWIRLCONFIG['TABLE_NONCE']} WHERE valid = '$noncesafe';");

// Check nonce freshness to be less than 1 minutes
if (hexdec(substr($noncesafe, -8)) < (time()-60)) {
	// Regenerate nonce and resend authentication request
	$nonce = md5(uniqid(mt_rand(), true)).dechex(time());
	$sql = "INSERT INTO {$TWIRLCONFIG['TABLE_NONCE']} VALUES('$nonce');";
	tquery($sql);
	header('HTTP/1.1 401 Unauthorized');
	header('WWW-Authenticate: Digest realm="'.$realm.
		'",qop="auth",nonce="'.$nonce.'",opaque="'.md5($realm).',stale=TRUE"');
	exit('msg=Timed out!'.chr(13).chr(10));
}

// Generate the valid response
$usernamesafe = sanitize_string($data['username'], 32);
$sql = "SELECT * FROM {$TWIRLCONFIG['TABLE_USERS']} WHERE user_name = '$usernamesafe';";
$row = mysql_fetch_assoc(tquery($sql));

$HA1 = md5($usernamesafe.':'.$realm.':'.$row['user_password']);
$HA2 = md5($_SERVER['REQUEST_METHOD'].':'.$data['uri']);
$valid_response = md5($HA1.':'.$data['nonce'].':'.$data['nc'].':'.
	$data['cnonce'].':'.$data['qop'].':'.$HA2);
	
// Check if account has been enabled through email verification
$sql = "SELECT user_active FROM {$TWIRLCONFIG['TABLE_USERS']} 
	WHERE user_id = '".$row['user_id']."';";
$row = mysql_fetch_row(tquery($sql));

if ($row[0] !== 'YES')
	exit('msg=Account not enabled!'.chr(13).chr(10));

// Valid username & password
$userhash = md5(uniqid(mt_rand(), true));
$sql = "UPDATE {$TWIRLCONFIG['TABLE_USERS']}
	SET userhash = '$userhash' WHERE user_name = '$usernamesafe';";
tquery($sql);
echo 'msg=Your are logged in as: '.$usernamesafe.chr(13).chr(10);



// Function to parse the http auth header
function http_digest_parse($digest) {
    preg_match_all('@(username|nonce|uri|nc|cnonce|qop|response)'.
                    '=[\'"]?([^\'",]+)@', $digest, $t);
    $data = array_combine($t[1], $t[2]);
    return (count($data)==7) ? $data : false;
}

?>
