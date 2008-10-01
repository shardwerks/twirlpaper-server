--
-- Main Elgg database
-- 
-- @link http://elgg.org/
-- @license http://www.gnu.org/licenses/old-licenses/gpl-2.0.html GNU Public License version 2
-- @author Curverider Ltd
-- @copyright Curverider Ltd 2008
-- @link http://elgg.org/
--

-- --------------------------------------------------------

--
-- *** The main tables ***
--

-- Site configuration.
CREATE TABLE `prefix_config` (
  `name` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `site_guid` int(11) NOT NULL,
  PRIMARY KEY  (`name`,`site_guid`)
);

-- Define entities. 
CREATE TABLE `prefix_entities` (
	`guid` bigint(20) unsigned  NOT NULL auto_increment,
	
	`type` enum ('object', 'user', 'group', 'site') NOT NULL,
	`subtype` int(11) NULL,
	
	`owner_guid` bigint(20) unsigned NOT NULL,
    `site_guid` bigint(20) unsigned NOT NULL,
    `container_guid` bigint(20) unsigned NOT NULL,
	`access_id` int(11) NOT NULL,
	
	`time_created` int(11) NOT NULL,
	`time_updated` int(11) NOT NULL,

	`enabled` enum ('yes', 'no') NOT NULL default 'yes',
	
	primary key (`guid`),
    KEY `site_guid` (`site_guid`)
);

-- Entity subtypes - lets you subtype one of the main objects (sites/objects/etc)
CREATE TABLE `prefix_entity_subtypes` (
	`id` int(11) NOT NULL auto_increment,
	
	`type` enum ('object', 'user', 'group', 'site') NOT NULL,
	`subtype` varchar(50) NOT NULL,
	
	class varchar(50) NOT NULL default '',
	
	PRIMARY KEY (`id`),
	UNIQUE KEY (`type`, `subtype`)
) ;

-- Describe relationships between entities, can describe friendships but also site membership, depending on context
CREATE TABLE `prefix_entity_relationships` (
  `id` int(11) NOT NULL auto_increment,
  
  `guid_one` bigint(20) unsigned  NOT NULL,
  `relationship` varchar(50) NOT NULL,
  `guid_two` bigint(20) unsigned  NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY (`guid_one`,`relationship`,`guid_two`)
)  ;

--
-- *** Access controls ***
--

-- Table structure for table `access_collections`
CREATE TABLE `prefix_access_collections` (
  `id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `owner_guid` bigint(20) unsigned NOT NULL,
  `site_guid` bigint(20) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=3;

-- Access containers 
CREATE TABLE `prefix_access_collection_membership` (
  `user_guid` int(11) NOT NULL,
  `access_collection_id` int(11) NOT NULL,
  PRIMARY KEY  (`user_guid`,`access_collection_id`)
)  ;


--
-- *** Entity superclass details ***
-- NB: Asside from GUID, these should now have any field names incommon with the entities table.
--

-- Extra information relating to "objects"
CREATE TABLE `prefix_objects_entity` (
  `guid` bigint(20) unsigned  NOT NULL,
  
  `title` text NOT NULL,
  `description` text NOT NULL,

  PRIMARY KEY  (`guid`),
  FULLTEXT KEY (`title`,`description`)
)  ;

-- Extra information relating to "sites"
CREATE TABLE `prefix_sites_entity` (
  `guid` bigint(20) unsigned  NOT NULL,
  
  `name` text NOT NULL,
  `description` text NOT NULL,
  `url` varchar(255) NOT NULL, 
   
  PRIMARY KEY  (`guid`),
  UNIQUE KEY (`url`),
  FULLTEXT KEY (`name`,`description`, `url`)
)  ;

-- Extra information relating to "users"
CREATE TABLE `prefix_users_entity` (
  `guid` bigint(20) unsigned  NOT NULL,
  
  `name` text NOT NULL,
  `username` varchar(128) NOT NULL default '',
  `password` varchar(32) NOT NULL default '',
  `salt`     varchar(8)  NOT NULL default '',
  `email` text NOT NULL,
  `language` varchar(6)  NOT NULL default '',
  `code` varchar(32) NOT NULL default '',
  

  `last_action` int(11) NOT NULL default '0',
  `prev_last_action` int(11) NOT NULL default '0',
  `last_login` int(11) NOT NULL default '0',
  `prev_last_login` int(11) NOT NULL default '0',
  
  PRIMARY KEY  (`guid`),
  UNIQUE KEY (`username`),
  KEY `password` (`password`),
  FULLTEXT KEY `name` (`name`),
  FULLTEXT KEY (`name`,`username`)
) ENGINE=MyISAM;

-- Extra information relating to "groups"
CREATE TABLE `prefix_groups_entity` (
  `guid` bigint(20) unsigned  NOT NULL,
  
  `name` text NOT NULL,
  `description` text NOT NULL,
   
  PRIMARY KEY  (`guid`),
  FULLTEXT KEY (`name`,`description`)
) ENGINE=MyISAM;

--
-- *** Annotations and tags ***
--

-- Table structure for annotations
CREATE TABLE `prefix_annotations` (
	`id` int(11) NOT NULL auto_increment,
	
	`entity_guid` bigint(20) unsigned  NOT NULL,
	
	`name_id` int(11) NOT NULL,
	`value_id` int(11) NOT NULL,
	`value_type` enum ('integer','text') NOT NULL,
	
	`owner_guid` bigint(20) unsigned NOT NULL,
	`access_id` int(11) NOT NULL,
	
	`time_created` int(11) NOT NULL,

	`enabled` enum ('yes', 'no') NOT NULL default 'yes',
	
	PRIMARY KEY (`id`)
) ;

-- Table structure for metadata
CREATE TABLE `prefix_metadata` (
	`id` int(11) NOT NULL auto_increment,
	
	`entity_guid` bigint(20) unsigned  NOT NULL,
	
	`name_id` int(11) NOT NULL,
	`value_id` int(11) NOT NULL,
	`value_type` enum ('integer','text') NOT NULL,

	`owner_guid` bigint(20) unsigned NOT NULL,
	`access_id` int(11) NOT NULL,
	
	`time_created` int(11) NOT NULL,

	`enabled` enum ('yes', 'no') NOT NULL default 'yes',
	
	PRIMARY KEY (`id`)
	
) ;

-- Meta strings table (avoids storing text strings more than once)
CREATE TABLE `prefix_metastrings` (
	`id` int(11) NOT NULL auto_increment,
	`string` TEXT NOT NULL,
	
	PRIMARY KEY (`id`),
	FULLTEXT KEY `string` (`string`)
) ;

--
-- *** Misc ***
--

-- API Users
CREATE TABLE `prefix_api_users` (
	id     int(11)     auto_increment,
	
	site_guid bigint(20) unsigned,
	
	api_key   varchar(40),
	secret    varchar(40) NOT NULL,
	active    int(1) default 1,
	
	unique key (api_key),
	primary key (id)
);

-- API Sessions
CREATE TABLE `prefix_users_apisessions` (
	`id` int(11) NOT NULL auto_increment,
	`user_guid` bigint(20) unsigned NOT NULL,
  	`site_guid` bigint(20) unsigned NOT NULL,
  	
  	`token` varchar(40),
  	
  	`expires` int(11) NOT NULL,
	
	PRIMARY KEY  (`id`),
	UNIQUE KEY (`user_guid`,`site_guid`)
) ;

-- Datalists for things like db version
CREATE TABLE `prefix_datalists` (
  `name` varchar(32) NOT NULL,
  `value` text NOT NULL,
  KEY `name` (`name`)
);

-- System log
CREATE TABLE `prefix_system_log` (
	`id` int(11) NOT NULL auto_increment,
	
	`object_id` int(11) NOT NULL,
	`object_class` varchar(128) NOT NULL,
	
	`event` varchar(128) NOT NULL,
	`performed_by_guid` int(11) NOT NULL,
	
	`time_created` int(11) NOT NULL,
	
	PRIMARY KEY  (`id`)
);

-- Privileged paths, added to by the admin panel
CREATE TABLE `prefix_privileged_paths` (
	`path` varchar(128) NOT NULL,
	
	PRIMARY KEY (`path`)
);
