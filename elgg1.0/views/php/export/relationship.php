<?php
	/**
	 * Elgg relationship export.
	 * Displays a relationship using PHP serialised data
	 * 
	 * @package Elgg
	 * @subpackage Core
	 * @license http://www.gnu.org/licenses/old-licenses/gpl-2.0.html GNU Public License version 2
	 * @author Curverider Ltd
	 * @copyright Curverider Ltd 2008
	 * @link http://elgg.org/
	 */

	$r = $vars['relationship'];
	echo serialize($r);
?>