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
#
#	To client:
#		"imageid"
#		"imagerating"
#		"userrating"
#		"imageinfo"
#		"imageurl"
#		"imagetags"

require_once(dirname(__FILE__)."/tfunclib.php");

if (tuser_confirm()) {
    // Store config data
    //print_r($_POST);

    // Calculate image through MySQL query
    $walls = scandir('JPG');
    do $image = array_rand($walls);
    while ($image < 2);

    // Transmit image and config data
    $imageinfo[0]='from noone0 in erewhon';
    $imageinfo[1]='from noone1 in erewhon';
    $imageinfo[2]='from noone2 in erewhon';
    $imageinfo[3]='from noone3 in erewhon';
    $imageurl[0]='http://www.google.com/search?as_q=zero';
    $imageurl[1]='http://www.google.com/search?as_q=one';
    $imageurl[2]='http://www.google.com/search?as_q=two';
    $imageurl[3]='http://www.google.com/search?as_q=three';
    $imagetags[0]='run0 jump0 skip0';
    $imagetags[1]='run1 jump1 skip1';
    $imagetags[2]='run2 jump2 skip2';
    $imagetags[3]='run3 jump3 skip3';
    $choice = rand(0,3);
    echo 'imageid='.md5(rand()).chr(13).chr(10);
    echo 'imagerating='.rand(1,5).chr(13).chr(10);
    echo 'userrating='.rand(1,5).chr(13).chr(10);
    echo 'imageinfo='.$imageinfo[$choice].chr(13).chr(10);
    echo 'imageurl='.$imageurl[$choice].chr(13).chr(10);
    echo 'imagetags='.$imagetags[$choice].chr(13).chr(10);
    echo 'image=http://localhost/JPG/'.$walls[$image].chr(13).chr(10);
}
else {
    echo "Not user";

    // If no guest userid, generate and save
}


?>
