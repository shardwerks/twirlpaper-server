<?php

	$english = array(
	
		/**
		 * Menu items and titles
		 */
	
			'messages' => "Messages",
			'messages:user' => "Your inbox",
			'messages:sentMessages' => "Sent messages",
			'messages:posttitle' => "%s's messages: %s",
			'messages:inbox' => "Inbox",
			'messages:send' => "Send a message",
			'messages:sent' => "Sent messages",
			'messages:message' => "Message",
			'messages:title' => "Title",
			'messages:to' => "To",
			'messages:fly' => "Let it fly",
			'messages:replying' => "Message replying to",
			'messages:inbox' => "Inbox",
			'messages:sendmessage' => "Send a message",
			'messages:compose' => "Send a message",
			'messages:sentmessages' => "Sent messages",
			'messages:recent' => "Recent messages",
			
			'item:object:messages' => 'Messages',
	
		/**
		 * Status messages
		 */
	
			'messages:posted' => "Your message was successfully sent.",
			'messages:deleted' => "Your message was successfully deleted.",
	
		/**
		 * Email messages
		 */
	
			'messages:email:subject' => 'You have a new message!',
			'messages:email:body' => "You have a new message from %s. It reads:

			
%s


To view your messages, click here:

	%s

To send %s a message, click here:

	%s

You cannot reply to this email.",
	
		/**
		 * Error messages
		 */
	
			'messages:blank' => "Sorry; you need to actually put something in the message body before we can save it.",
			'messages:notfound' => "Sorry; we could not find the specified message.",
			'messages:notdeleted' => "Sorry; we could not delete this message.",
			'messages:nopermission' => "You do not have permission to delete that message.",
			'messages:nomessages' => "There are no messages to display.",
			'messages:user:nonexist' => "We could not find the recipient in the user database.",
	
	);
					
	add_translation("en",$english);

?>