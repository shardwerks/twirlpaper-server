<?php

#	author	= "Shultz Wang"
#	version 	= "Revision 0.1"
#	date		= "September 08, 2007 07:52:17 AM"
#	copyright	= "Copyright (c) 2007 Shultz Wang"
#
#	Receive and store metadata from client
#
#	From client:
#		"username"
#		"userid"
#		"imageid"
#		"nextchange"
#		"userrating"
#		"flagimage"
#		"subscribedtags"
#		"ratedatleast"
#		"percentnew"
#		"changeevery"
#		"subscribedtags"
#		"error"

require_once($_SERVER['NFSN_SITE_ROOT']."protected/tfunclib.php");

if($loginsafe = tuser_confirm($TWIRLCONFIG['TABLE_USERS'])) {
    // Store config data
    print_r($_POST);
}
else {
    echo "msg=Not logged in for metadata";

    // If no guest userid, generate and save
}

// Save metadata to log


?>
