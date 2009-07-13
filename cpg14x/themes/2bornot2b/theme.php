<?php
/*************************
  Coppermine Photo Gallery
  ************************
  Copyright (c) 2003-2006 Coppermine Dev Team
  v1.1 originally written by Gregory DEMAR

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation; either version 2 of the License, or
  (at your option) any later version.
  ********************************************
  Coppermine version: 1.4.4
  $Source$
  $Revision$
  $Author$
  $Date$
**********************************************/

define('THEME_IS_XHTML10_TRANSITIONAL',1);
define('THEME_HAS_RATING_GRAPHICS', 1);
define('THEME_HAS_NO_SYS_MENU_BUTTONS', 1);
define('THEME_HAS_NO_SUB_MENU_BUTTONS', 1);


// HTML template for sys menu
$template_sys_menu = <<<EOT
                                        <ul>
<!-- BEGIN home -->
                                                <li><a href="{HOME_TGT}" title="{HOME_TITLE}" class="navmenu">{HOME_LNK}</a> ::</li>
<!-- END home -->
<!-- BEGIN my_gallery -->
                                                <li><a href="{MY_GAL_TGT}" title="{MY_GAL_TITLE}" class="navmenu">{MY_GAL_LNK}</a> ::</li>
<!-- END my_gallery -->
<!-- BEGIN allow_memberlist -->
                                                <li><a href="{MEMBERLIST_TGT}" title="{MEMBERLIST_TITLE}" class="navmenu">{MEMBERLIST_LNK}</a> ::</li>
<!-- END allow_memberlist -->
<!-- BEGIN my_profile -->
                                                <li><a href="{MY_PROF_TGT}" title="{MY_PROF_LNK}" class="navmenu">{MY_PROF_LNK}</a> ::</li>
<!-- END my_profile -->
<!-- BEGIN faq -->
                                                <li><a href="{FAQ_TGT}" title="{FAQ_TITLE}" class="navmenu">{FAQ_LNK}</a> ::</li>
<!-- END faq -->
<!-- BEGIN enter_admin_mode -->
                                                <li><a href="{ADM_MODE_TGT}" title="{ADM_MODE_TITLE}" class="navmenu">{ADM_MODE_LNK}</a> ::</li>
<!-- END enter_admin_mode -->
<!-- BEGIN leave_admin_mode -->
                                                <li><a href="{USR_MODE_TGT}" title="{USR_MODE_TITLE}" class="navmenu">{USR_MODE_LNK}</a> ::</li>
<!-- END leave_admin_mode -->
<!-- BEGIN upload_pic -->
                                                <li><a href="{UPL_PIC_TGT}" title="{UPL_PIC_TITLE}" class="navmenu">{UPL_PIC_LNK}</a> ::</li>
<!-- END upload_pic -->
<!-- BEGIN register -->
                                                <li><a href="{REGISTER_TGT}" title="{REGISTER_TITLE}" class="navmenu">{REGISTER_LNK}</a> ::</li>
<!-- END register -->
<!-- BEGIN login -->
                                                <li><a href="{LOGIN_TGT}" title="{LOGIN_LNK}" class="navmenu">{LOGIN_LNK}</a> ::</li>
<!-- END login -->
<!-- BEGIN logout -->
                                                <li><a href="{LOGOUT_TGT}" title="{LOGOUT_LNK}" class="navmenu">{LOGOUT_LNK}</a></li>
<!-- END logout -->
                                        </ul>

EOT;

// HTML template for sub menu
$template_sub_menu = <<<EOT
                                        <ul>
<!-- BEGIN custom_link -->
                                            <li><a href="{CUSTOM_LNK_TGT}" title="{CUSTOM_LNK_TITLE}" class="navmenu">{CUSTOM_LNK_LNK}</a> ::</li>
<!-- END custom_link -->
<!-- BEGIN album_list -->
                                            <li><a href="{ALB_LIST_TGT}" title="{ALB_LIST_TITLE}" class="navmenu">{ALB_LIST_LNK}</a> ::</li>
<!-- END album_list -->
                                            <li><a href="{LASTUP_TGT}" title="{LASTUP_LNK}" class="navmenu">{LASTUP_LNK}</a> ::</li>
                                            <li><a href="{LASTCOM_TGT}" title="{LASTCOM_LNK}" class="navmenu">{LASTCOM_LNK}</a> ::</li>
                                            <li><a href="{TOPN_TGT}" title="{TOPN_LNK}" class="navmenu">{TOPN_LNK}</a> ::</li>
                                            <li><a href="{TOPRATED_TGT}" title="{TOPRATED_LNK}" class="navmenu">{TOPRATED_LNK}</a> ::</li>
                                            <li><a href="{FAV_TGT}" title="{FAV_LNK}" class="navmenu">{FAV_LNK}</a> ::</li>
                                            <li><a href="{SEARCH_TGT}" title="{SEARCH_LNK}" class="navmenu">{SEARCH_LNK}</a></li>
                                        </ul>

EOT;

// HTML template for user admin menu
$template_user_admin_menu = <<<EOT

                <div align="left">
                <table cellpadding="0" cellspacing="1">
                        <tr>
                                <td class="admin_menu"><a href="albmgr.php" title="{ALBMGR_TITLE}">{ALBMGR_LNK}</a></td>
                                <td class="admin_menu"><a href="modifyalb.php" title="{MODIFYALB_TITLE}">{MODIFYALB_LNK}</a></td>
                                <td class="admin_menu"><a href="profile.php?op=edit_profile" title="{MY_PROF_TITLE}">{MY_PROF_LNK}</a></td>
                                <td class="admin_menu"><a href="picmgr.php" title="{PICTURES_TITLE}">{PICTURES_LNK}</a></td>
                        </tr>
                </table>
                </div>

EOT;

// HTML template for the breadcrumb
$template_breadcrumb = <<<EOT
<!-- BEGIN breadcrumb -->
        <tr>
                <td colspan="3" class="breadcrumbs"><span class="statlink"><b>{BREADCRUMB}</b></span></td>
        </tr>
<!-- END breadcrumb -->
<!-- BEGIN breadcrumb_user_gal -->
        <tr>
                <td colspan="3" class="tableh1">
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                        <td><span class="statlink"><b>{BREADCRUMB}</b></span></td>
                        <td align="right"><span class="statlink"><b>{STATISTICS}</b></span></td>
                </tr>
                </table>
                </td>
        </tr>
<!-- END breadcrumb_user_gal -->

EOT;
// HTML template for the album list
$template_album_list = <<<EOT

<!-- BEGIN stat_row -->
        <tr>
                <td colspan="{COLUMNS}" class="tableh1" align="center"><span class="statlink"><b>{STATISTICS}</b></span></td>
        </tr>
<!-- END stat_row -->
<!-- BEGIN header -->
        <tr>
<!-- END header -->
<!-- BEGIN album_cell -->
        <td width="{COL_WIDTH}%" valign="top" class="tableb_album">
        <table width="100%" cellspacing="0" cellpadding="0">
        <tr>
                <td colspan="3" height="1" align="left" valign="top" class="tableh2">
                        <span class="alblink"><a href="{ALB_LINK_TGT}"><b>{ALBUM_TITLE}</b></a></span>
                </td>
        </tr>

        <tr>
                <td align="center" valign="middle" class="thumbnails">
                        <img src="images/spacer.gif" width="{THUMB_CELL_WIDTH}" height="1" class="image" style="margin-top: 0px; margin-bottom: 0px; border: none;" alt="" /><br />
                        <a href="{ALB_LINK_TGT}" class="albums">{ALB_LINK_PIC}<br /></a>
                </td>
                <td>
                        <img src="images/spacer.gif" width="1" height="1" border="0" alt="" />
                </td>
                <td width="100%" valign="top" align="left" class="tableb_compact">
                        {ADMIN_MENU}
                        <p>{ALB_DESC}</p>
                        <p class="album_stat">{ALB_INFOS}</p>
                </td>
        </tr>
        </table>
        </td>
<!-- END album_cell -->
<!-- BEGIN empty_cell -->
        <td width="{COL_WIDTH}%" valign="top">
        <table width="100%" cellspacing="0" cellpadding="0">
        <tr>
                <td height="1" valign="top" class="tableh2">
                        <b>&nbsp;</b>
                </td>
        </tr>
        <tr>
                <td width="100%" valign="top" class="tableb_compact">
                    <div class="thumbnails" style="background-color:transparent"><img src="images/spacer.gif" width="1" height="{SPACER}" border="0" class="image" style="border:0;margin-top:1px;margin-bottom:0" alt="" /></div>
                </td>
        </tr>
        </table>
        </td>
<!-- END empty_cell -->
<!-- BEGIN row_separator -->
        </tr>
        <tr>
<!-- END row_separator -->
<!-- BEGIN footer -->
        </tr>
<!-- END footer -->
<!-- BEGIN tabs -->
        <tr>
                <td colspan="{COLUMNS}" style="padding: 0px;">
                        <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                <tr>
                                     {TABS}
                                </tr>
                        </table>
                </td>
        </tr>
<!-- END tabs -->
<!-- BEGIN spacer -->
        <img src="images/spacer.gif" width="1" height="17" alt=" " /><br />
<!-- END spacer -->

EOT;

?>