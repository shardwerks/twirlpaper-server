<?php

	/**
	 * Elgg version library.
	 * Contains code for handling versioning and upgrades.
	 * 
	 * @package Elgg
	 * @subpackage Core
	 * @license http://www.gnu.org/licenses/old-licenses/gpl-2.0.html GNU Public License version 2
	 * @copyright Curverider Ltd 2008
	 * @link http://elgg.org/
	 */

	/**
	 * Get the current version information
	 *
	 * @param true|false $humanreadable Whether to return a human readable version (default: false)
	 * @return string|false Depending on success
	 */
		function get_version($humanreadable = false) {
			
			global $CONFIG;
			if (@include($CONFIG->path . "version.php")) {
				if ($humanreadable) return $version;
				return $release;
			}
			
			return false;
			
		}
		
	/**
	 * Determines whether or not the database needs to be upgraded.
	 *
	 * @return true|false Depending on whether or not the db version matches the code version
	 */
		function db_upgrade_check() {
			
			$dbversion = (int) get_datalist('version');
			$version = get_version();
			
			if ($version > $dbversion) {
				return true;
			}
			return false;
			
		}

?>