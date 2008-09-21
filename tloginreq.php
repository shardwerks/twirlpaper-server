<?php

#	author		= "Shultz Wang"
#	version 	= "Revision 0.1"
#	date		= "September 08, 2007 07:52:17 AM"
#	copyright	= "Copyright (c) 2007 Shultz Wang"
#
#	Process login request from client
#
#	From client:
#		"login"
#		"hashed"
#
#	To client:
#		"clientid"

//$_POST["login"] = "beatz";
//$_POST["password"] = md5("gimmedat");

//      require_once(dirname(__FILE__)."/tfunclib.php");

//      if (tuser_confirm("password")) {
//              $clientid = md5(microtime());
//              tuser_update("clientid", $clientid, False);
//      }
//      else $clientid = "00000000000000000000000000000000";
//      echo $clientid;



// Snippets taken from http://www.php.net/features.http-auth

$realm = 'Restricted@twirlpaper.com';

// Generate good nonce by using MD5 to increase UNIQID to 32 chars, using
// the Mersenne Twister for the rand, and more_entropy set to TRUE.
// This is catted to the timestamp so that stale nonces can be discarded,
// in order to prevent attackers from replaying the nouce.
$nonce = md5(uniqid(mt_rand(), true)).dechex(time());

if (empty($_SERVER['PHP_AUTH_DIGEST'])) {
    header('HTTP/1.1 401 Unauthorized');
    header('WWW-Authenticate: Digest realm="'.$realm.
        '",qop="auth",nonce="'.$nonce.'",opaque="'.md5($realm).'"');
    die('Login failed');
}

// Analyze the PHP_AUTH_DIGEST variable
if (!($data = http_digest_parse($_SERVER['PHP_AUTH_DIGEST'])))
    die('Not digest authentication!');

// Check nonce freshness to be less than 10 minutes
if (hexdec(substr($data['nonce'], -8)) < (time()-600)) {
    // Regenerate nonce and resend authentication request
    $nonce = md5(uniqid(mt_rand(), true)).dechex(time());
    header('HTTP/1.1 401 Unauthorized');
    header('WWW-Authenticate: Digest realm="'.$realm.
        '",qop="auth",nonce="'.$nonce.'",opaque="'.md5($realm).',stale=TRUE"');
    die('Timed out!');
}

// Generate the valid response
// *** need to make sure user is authenticated
require 'dbopen.php';
$username = sanitize_string(stripslashes($data['username']));
if (!($pass = mysql_query("SELECT password FROM elggusers_entity
    WHERE username = '$username'")))
    die(mysql_errno().': '.mysql_error);
$HA1 = md5($data['username'].':'.$realm.':'.$pass);
$HA2 = md5($_SERVER['REQUEST_METHOD'].':'.$data['uri']);
$valid_response = md5($HA1.':'.$data['nonce'].':'.$data['nc'].':'.
    $data['cnonce'].':'.$data['qop'].':'.$HA2);

if ($data['response'] != $valid_response)
    die('Wrong Credentials!');

// Valid username & password
echo 'Your are logged in as: '.$data['username'];


// Function to parse the http auth header
function http_digest_parse($txt) {
    // Protect against missing data
    $needed_parts = array('nonce'=>1, 'nc'=>1, 'cnonce'=>1, 'qop'=>1,
        'username'=>1, 'uri'=>1, 'response'=>1);
    $data = array();

    preg_match_all('@(\w+)=(?:([\'"])([^\2]+)\2|([^\s,]+))@', $txt,
        $matches, PREG_SET_ORDER);

    foreach ($matches as $m) {
        $data[$m[1]] = $m[3] ? $m[3] : $m[4];
        unset($needed_parts[$m[1]]);
    }
    return $needed_parts ? false : $data;
}

/**
 * Sanitise a string for database use (from elgg)
 *
 * @param string $string The string to sanitise
 * @return string Sanitised string
 */
function sanitize_string($string) {
    return mysql_real_escape_string(trim($string));
}

?>
