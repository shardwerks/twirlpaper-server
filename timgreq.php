<?php

#	author		= "Shultz Wang"
#	version 	= "Revision 0.1"
#	date		= "September 06, 2007 09:46:31 PM"
#	copyright	= "Copyright (c) 2007 Shultz Wang"
#
#	Calculate image to send to client based on
#	validity of login info and config settings.
#
#	From client:
#		"login"
#		"clientid"
#		"nextchange"
#		"subscribedtags"
#		"ratedatleast"
#		"percentnew"
#		"changeevery"
#
#	To client:
#		"imageid"
#		"imagerating"
#		"imageinfo"
#		"imageurl"
#		"imagetags"

	require_once(dirname(__FILE__)."/tfunclib.php");

	$isuser = tuser_confirm("clientid");

	// Calculate image through MySQL query

	// Generate userid if none

	// Store config data

	// Transmit image and config data
?>
