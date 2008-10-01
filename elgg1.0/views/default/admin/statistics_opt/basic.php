<?php
	/**
	 * Elgg statistics screen
	 * 
	 * @package Elgg
	 * @subpackage Core
	 * @license http://www.gnu.org/licenses/old-licenses/gpl-2.0.html GNU Public License version 2
	 * @author Curverider Ltd
	 * @copyright Curverider Ltd 2008
	 * @link http://elgg.org/
	 */

	// Work out number of users
	$users_stats = get_number_users();
	
	
	global $CONFIG;
	
	include_once($CONFIG->path . "version.php");
?>
<div class="admin_statistics">
    <h3><?php echo elgg_echo('admin:statistics:label:basic'); ?></h3>
    <table>
    	<tr class="odd">
            <td class="column_one"><b><?php echo elgg_echo('admin:statistics:label:version'); ?> :</b></td>
            <td><?php echo elgg_echo('admin:statistics:label:version:release'); ?> - <?php echo $release; ?>, <?php echo elgg_echo('admin:statistics:label:version:version'); ?> - <?php echo $version; ?></td>
        </tr>
        <tr class="even">
            <td class="column_one"><b><?php echo elgg_echo('admin:statistics:label:numusers'); ?> :</b></td>
            <td><?php echo $users_stats; ?></td>
        </tr>

    </table> 
</div>  