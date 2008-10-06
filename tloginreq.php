<?php

#	author	= "Shultz Wang"
#	version 	= "Revision 0.1"
#	date		= "September 08, 2007 07:52:17 AM"
#	copyright	= "Copyright (c) 2007 Shultz Wang"
#
#	Process login request from client

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
    die('Sign in failed!');
}

// Analyze the PHP_AUTH_DIGEST variable
if (!($data = http_digest_parse($_SERVER['PHP_AUTH_DIGEST']))) {
    die('Not digest authentication!');
}

// Check nonce freshness to be less than 1 minutes
if (hexdec(substr($data['nonce'], -8)) < (time()-60)) {
    // Regenerate nonce and resend authentication request
    $nonce = md5(uniqid(mt_rand(), true)).dechex(time());
    header('HTTP/1.1 401 Unauthorized');
    header('WWW-Authenticate: Digest realm="'.$realm.
        '",qop="auth",nonce="'.$nonce.'",opaque="'.md5($realm).',stale=TRUE"');
    die('Timed out!');
}

// Generate the valid response
require 'tdbopen.php';
require 'tfunclib.php';

$username = sanitize_string($data['username'], 32);
if (!($result = mysql_query("SELECT * FROM elggusers_entity
    WHERE username = '$username'")))
    die(mysql_errno().': '.mysql_error);

$row = mysql_fetch_assoc($result);

$HA1 = md5($data['username'].':'.$realm.':'.$row['password']);
$HA2 = md5($_SERVER['REQUEST_METHOD'].':'.$data['uri']);
$valid_response = md5($HA1.':'.$data['nonce'].':'.$data['nc'].':'.
    $data['cnonce'].':'.$data['qop'].':'.$HA2);

if ($data['response'] != $valid_response)
    die('Wrong Credentials!');

// Check if account has been enabled through email verification
if (!($result = mysql_query("SELECT enabled FROM elggentities
    WHERE guid = '".$row['guid']."'")))
    die(mysql_errno().': '.mysql_error);

$row = mysql_fetch_row($result);

if ($row[0] != 'yes')
    die('Account not enabled!');

// Valid username & password
$userid = md5(uniqid(mt_rand(), true));

echo 'Your are logged in as: '.$data['username'];


// Function to parse the http auth header
function http_digest_parse($digest) {
    preg_match_all('@(username|nonce|uri|nc|cnonce|qop|response)'.
                    '=[\'"]?([^\'",]+)@', $digest, $t);
    $data = array_combine($t[1], $t[2]);
    return (count($data)==7) ? $data : false;
}

?>
