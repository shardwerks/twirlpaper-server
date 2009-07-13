CREATE TABLE slope1 (
	pid1 int(11) NOT NULL default '0',
	pid2 int(11) NOT NULL default '0',
	votes int(11) NOT NULL default '0',
	sum int(11) NOT NULL default '0',
	PRIMARY KEY (pid1, pid2)
) TYPE=MyISAM COMMENT='Slope one calculation matrix';
