<?php
	/**
	 * Elgg plugin manifest class
	 * 
	 * This file renders a plugin for the admin screen, including active/deactive, manifest details & display plugin
	 * settings.
	 * 
	 * @package Elgg
	 * @subpackage Core
	 * @license http://www.gnu.org/licenses/old-licenses/gpl-2.0.html GNU Public License version 2
	 * @author Curverider Ltd
	 * @copyright Curverider Ltd 2008
	 * @link http://elgg.org/
	 */


	$plugin = $vars['plugin'];
	$details = $vars['details'];
	
	$active = $details['active'];
	$manifest = $details['manifest'];
	
	$user_guid = $details['user_guid'];
	if ($user_guid) $user_guid = $_SESSION['user']->guid;
?>
<div id="plugin_details" class="<?php if ($active) echo "active"; else "not-active" ?>">
	<div><h2><?php echo $plugin; ?></h2></div>
	
	<?php if ($manifest) { ?>
		<div><?php echo $manifest['description'] ?></div>
		<div><?php echo elgg_echo('admin:plugins:label:author') . ": ". $manifest['author'] ?></div>
		<div><?php echo elgg_echo('admin:plugins:label:copyright') . ": ". $manifest['copyright'] ?></div>
		<div><?php echo elgg_echo('admin:plugins:label:licence') . ": ". $manifest['licence'] ?></div>
		<div><?php echo elgg_echo('admin:plugins:label:website') . ": "; ?><a href="<?php echo $manifest['website']; ?>"><?php echo $manifest['website']; ?></a></div>
	<?php } ?>
	
	<?php if (elgg_view("usersettings/{$plugin}/edit")) { ?>
		<div id="<?php echo $plugin; ?>_settings">
			<?php echo elgg_view("object/plugin", array('plugin' => $plugin, 'entity' => find_plugin_usersettings($plugin, $user_guid), 'prefix' => 'user')) ?>
		</div>
	<?php } ?>
</div>