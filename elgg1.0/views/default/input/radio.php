<?php

	/**
	 * Elgg radio input
	 * Displays a radio input field
	 * 
	 * @package Elgg
	 * @subpackage Core
	 * @license http://www.gnu.org/licenses/old-licenses/gpl-2.0.html GNU Public License version 2
	 * @author Curverider Ltd
	 * @copyright Curverider Ltd 2008
	 * @link http://elgg.org/
	 * 
	 * @uses $vars['value'] The current value, if any
	 * @uses $vars['js'] Any Javascript to enter into the input tag
	 * @uses $vars['internalname'] The name of the input field
	 * @uses $vars['options'] An array of strings representing the options for the radio field
	 * 
	 */
	
	$class = $vars['class'];
	if (!$class) $class = "input-radio";

    foreach($vars['options'] as $option => $label) {
        if ($option != $vars['value']) {
            $selected = "";
        } else {
            $selected = "checked = \"checked\"";
        }
        
        if ($vars['disabled']) $disabled = ' disabled="yes" '; 
        echo "<label><input type=\"radio\" $disabled {$vars['js']} name=\"{$vars['internalname']}\" value=\"".htmlentities($option, null, 'UTF-8')."\" {$selected} class=\"$class\" />{$label}</label><br />";
    }

?> 