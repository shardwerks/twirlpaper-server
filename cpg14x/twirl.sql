CREATE TABLE slope1 (
	pid1 int(11) NOT NULL default '0',
	pid2 int(11) NOT NULL default '0',
	votes int(11) NOT NULL default '0',
	sum int(11) NOT NULL default '0',
	PRIMARY KEY (pid1, pid2)
) TYPE=MyISAM COMMENT='Slope one calculation matrix';

CREATE TABLE nonce (
	`valid` CHAR( 40 ) NOT NULL
) TYPE=MyISAM COMMENT='Client login nonce';

ALTER TABLE `cpg14x_users` ADD `userhash` CHAR( 32 ) NOT NULL DEFAULT '00000000000000000000000000000000'
