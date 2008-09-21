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

	require_once(dirname(__FILE__)."/tfunclib.php");

	if (tuser_confirm("password")) {
		$clientid = md5(microtime());
		tuser_update("clientid", $clientid, False);
	}
	else $clientid = "00000000000000000000000000000000";
	echo $clientid;
?>
