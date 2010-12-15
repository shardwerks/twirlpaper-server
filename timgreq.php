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

require_once($_SERVER['NFSN_SITE_ROOT']."protected/tfunclib.php");

if ($loginsafe = tuser_confirm($TWIRLCONFIG['TABLE_USERS'])) {
	// Parse and store config data
	//print_r($_POST);
	$percentnew = 20;
	$ratedatleast = 3;

	// Calculate image through MySQL query
	if (mt_rand(0,100) < $percentnew)
		// Choose unrated wallpaper
		$result = predictbest($TWIRLCONFIG['TABLE_VOTES'],
			$TWIRLCONFIG['TABLE_SLOPE1'], $loginsafe, 20);
	else {
		//Choose rated wallpaper
		$sql = "SELECT user_id FROM {$TWIRLCONFIG['TABLE_USERS']}
			WHERE user_name = '$loginsafe;'";
		$result = mysql_fetch_assoc(tquery($sql));
		$user_md5_id = md5($result['user_id']);

		$sql = "SELECT pic_id FROM {$TWIRLCONFIG['TABLE_VOTES']}
			WHERE user_md5_id = '$user_md5_id' AND rating > $ratedatleast;";
		$result = tquery($sql);
	}

	$count = mysql_num_rows($result);
}
else {
	// If no userid, randomly choose a paper from a public gallery
	$count = 0;
	echo "msg=Not logged in for image request".chr(13).chr(10);
}

// If no recommendations available, randomly choose a paper from a public gallery
if ($count < 1) {
	$sql = "SELECT MAX(aid) FROM {$TWIRLCONFIG['TABLE_ALBUMS']};";
	$result = mysql_fetch_assoc(tquery($sql));
	$maxaid = $result['MAX(aid)'];
	do {
		$choice = mt_rand(1, $maxaid);
		$sql = "SELECT * FROM {$TWIRLCONFIG['TABLE_ALBUMS']}
			WHERE aid = $choice LIMIT 1;";
		$result = mysql_fetch_assoc(tquery($sql));
	} while ($result['visibility'] > 0);

	$sql = "SELECT pid FROM {$TWIRLCONFIG['TABLE_PICTURES']} WHERE aid = $choice;";
	$result = tquery($sql);

	$count = mysql_num_rows($result);
}

// Randomly choose a paper from the pid list
for ($i = mt_rand(1, $count); $i > 0; $i--)
	$row = mysql_fetch_array($result);
$sql = "SELECT * FROM {$TWIRLCONFIG['TABLE_PICTURES']} WHERE pid = {$row[0]};";
$row = mysql_fetch_assoc(tquery($sql));

// Transmit image and config data
$imagerating = intval(round($row['pic_rating'])/2000);
if ($imagerating < 1) $imagerating = 1;

$sql = "SELECT rating FROM {$TWIRLCONFIG['TABLE_VOTES']}
	WHERE user_md5_id = '$user_md5_id' AND pic_id = {$row['pid']};";
if (!($result = tquery($sql))) $userrating = 0;
else {
	$result = mysql_fetch_array($result);
	if ($result[0] = '') $userrating = 0;
	else $userrating = $result[0];
}

$imageurl = $TWIRLCONFIG['SITE_URL']."displayimage.php?pos=-$row[pid]";

$imageloc = $TWIRLCONFIG['SITE_URL']."albums/".$row['filepath'].$row['filename'];

echo 'imageid='.$row['pid'].chr(13).chr(10);
echo 'imagerating='.$imagerating.chr(13).chr(10);
echo 'userrating='.$userrating.chr(13).chr(10);
echo 'imageinfo='.$row['caption'].' '.chr(13).chr(10);
echo 'imageurl='.$imageurl.chr(13).chr(10);
echo 'image='.$imageloc.chr(13).chr(10);



// Return list of pid of best predicted papers
function predictbest($TWIRLVOTES, $TWIRLSLOPE1, $userID, $n) {
	$sql = "SELECT s1.pid1 as 'item' ,
			sum(s1.sum + s1.votes * v.rating)/sum(s1.votes) as 'avgvote'
			FROM $TWIRLVOTES v , $TWIRLSLOPE1 s1
			WHERE v.user_md5_id = '$userID'
			AND s1.pid1 <> v.pic_id
			AND s1.pid2 = v.pic_id
			GROUP BY s1.pid1 ORDER BY avgvote DESC LIMIT $n;" ;
	$result = tquery($sql);
	return $result;
}

?>
