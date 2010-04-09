<?php
/*************************
  Coppermine Photo Gallery
  ************************
  Copyright (c) 2003-2009 Coppermine Dev Team
  v1.1 originally written by Gregory DEMAR

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License version 3
  as published by the Free Software Foundation.
  
  ********************************************
  Coppermine version: 1.4.25
  $HeadURL: https://coppermine.svn.sourceforge.net/svnroot/coppermine/trunk/cpg1.4.x/anycontent.php $
  $Revision: 5997 $
  $Author: gaugau $
  $Date: 2009-05-26 08:43:24 +0200 (Di, 26 Mai 2009) $
**********************************************/

/**
* Coppermine Photo Gallery 1.4.20 anycontent.php
*
* This file gets included in index.php if you set the option on the configuration panel: "content of the main page".
* It can be used to display any content from any program, it is to be edited according to one's tastes.
*
*/

if (!defined('IN_COPPERMINE')) {
    die('Not in Coppermine...');
}

  // The constant USER_ID is being populated by Coppermine.
  // It is not defined if the visitor is a guest.
  // It is set to the user's ID if he is a registered user and logged in.
  if (!USER_ID) {
    // Inside this curly bracket, the code only will get executed if the above condition was met
	// , i.e. if we have a guest here (someone who isn't logged in):

starttable("100%", "Welcome");

echo <<< EOT
    <tr>
        <td class="tableb">
		  <br></br>
			  <a href="Twirlpaper1.0.0.exe"><img class="imgl" src="images/twirldownload.png" alt="Twirlpaper Wallpaper Changer" width="304" height="54" /></a>
			  <h1>Share your wallpapers</h1>
			  <h1>then let Twirlpaper Wallpaper Changer</h1>
			  <h1>pick new wallpapers based on your tastes.</h1>
		  <br></br>
			  <h2>Twirlpaper Wallpaper Changer will:</h2>
		  <h3>
			  <ul>
			  <li>Learn your tastes</li>
			  <li>Automatically download wallpapers</li>
			  <li>Choose wallpapers you have not seen based on your preferences</li>
			  <li>Keep your desktop interesting!</li>
			  </ul>
			  <p>Twirlpaper Wallpaper Changer learns your tastes and automatically downloads wallpapers and displays them on your desktop.</p>
			  <p>Based on your ratings, the Twirlpaper algorithm will adapt to your preferences and tune the selection process to present you</p>
			  <p>with images chosen from the best candidates.  The learning algorithm makes it easy to discover and enjoy new wallpapers,</p>
			  <p>without having to manually search through hundreds of galleries and downloading each one individually.</p>
			  <br></br>
			  <h2>Your desktop will always be interesting!</h2>
			  <br></br>
		  </h3>
        </td>
    </tr>

EOT;

endtable();
	}

?>

<img width="1" height="7" border="" alt="" src="images/spacer.gif"/>
