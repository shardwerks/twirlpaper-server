<?php

	/**
	 * Elgg access level input
	 * Displays a pulldown input field
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
	 * 
	 */

	$class = $vars['class'];
	if (!$class) $class = "input-access";

		if (!is_array($vars['options']))
		{
			$vars['options'] = array();
			$vars['options'] = get_write_access_array();
		}
		
		if (is_array($vars['options']) && sizeof($vars['options']) > 0) {	 
			 
?>

<select name="<?php echo $vars['internalname']; ?>" <?php if (isset($vars['js'])) echo $vars['js']; ?> <?php if ($vars['disabled']) echo ' disabled="yes" '; ?> class="<?php echo $class; ?>">
<?php

    foreach($vars['options'] as $key => $option) {
        if ($key != $vars['value']) {
            echo "<option value=\"{$key}\">{$option}</option>";
        } else {
            echo "<option value=\"{$key}\" selected=\"selected\">{$option}</option>";
        }
    }

?> 
</select>

<?php

		}		

?>