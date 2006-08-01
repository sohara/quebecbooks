CREATE TABLE `authors` (
  `id` smallint(5) NOT NULL auto_increment,
  `first_name` varchar(255) default NULL,
  `last_name` varchar(255) default NULL,
  `other_name` varchar(255) default NULL,
  `language` varchar(255) default NULL,
  `nationality` varchar(255) default NULL,
  `born_on` date default NULL,
  `birthplace` varchar(255) default NULL,
  `died_on` date default NULL,
  `sex` varchar(10) default NULL,
  `web_site` varchar(255) default NULL,
  `biography` text,
  `note` text,
  `created_on` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `updated_on` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `authors_books` (
  `author_id` smallint(5) default NULL,
  `book_id` smallint(5) default NULL,
  KEY `fk_ab_author` (`author_id`),
  KEY `fk_ab_book` (`book_id`),
  CONSTRAINT `fk_ab_author` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`),
  CONSTRAINT `fk_ab_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `awards` (
  `id` smallint(5) NOT NULL auto_increment,
  `book_id` int(11) NOT NULL default '0',
  `category` varchar(255) NOT NULL default '',
  `year` int(4) NOT NULL default '0',
  `status` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `fk_awards_books` (`book_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `books` (
  `id` smallint(5) NOT NULL auto_increment,
  `language` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  `subtitle` varchar(255) default NULL,
  `category` varchar(12) default NULL,
  `topic` varchar(255) default NULL,
  `copyright_year` smallint(4) default NULL,
  `isbn_number` varchar(255) default NULL,
  `place_of_publication` varchar(255) default NULL,
  `date_published` smallint(4) default NULL,
  `edition_number` tinyint(4) default NULL,
  `cover_type` varchar(12) default NULL,
  `page_count` smallint(5) default NULL,
  `shelf_number` smallint(5) default NULL,
  `abstract` text,
  `extract` text,
  `created_on` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `updated_on` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `books_publishers` (
  `book_id` smallint(5) default NULL,
  `publisher_id` smallint(5) default NULL,
  KEY `fk_bp_book` (`book_id`),
  KEY `fk_bp_publisher` (`publisher_id`),
  CONSTRAINT `fk_bp_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `fk_bp_publisher` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `images` (
  `id` smallint(5) NOT NULL auto_increment,
  `author_id` smallint(5) default NULL,
  `book_id` smallint(5) default NULL,
  `name` varchar(100) default NULL,
  `caption` varchar(255) default NULL,
  `created_at` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `fk_images_author` (`author_id`),
  KEY `fk_images_book` (`book_id`),
  CONSTRAINT `fk_images_author` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`),
  CONSTRAINT `fk_images_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `publishers` (
  `id` smallint(5) NOT NULL auto_increment,
  `publisher_name` varchar(255) default NULL,
  `publisher_code` varchar(255) default NULL,
  `web_site` varchar(255) default NULL,
  `note` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `schema_info` (
  `version` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `hashed_password` varchar(40) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO schema_info (version) VALUES (6)