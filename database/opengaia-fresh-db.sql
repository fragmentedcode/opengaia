# Use this to created the MySQL database

create database open_gaia;

use open_gaia;

INSERT INTO `og_settings`(`setting_key`, `setting_value`)
VALUES ('VERSION', '1.0.0');

create table og_settings (
	setting_id bigint auto_increment not null primary key,
    setting_key varchar(70) unique not null,
    setting_value varchar(70),
    index idx_setting_key (setting_key)
);

create table taxon_order (
	order_id bigint auto_increment not null primary key,
    order_name varchar(70) unique not null,
    index idx_order_name (order_name)
);

create table taxon_family (
	family_id bigint auto_increment not null primary key,
    family_name varchar(250) unique not null,
    order_id bigint not null,
    foreign key (order_id) references taxon_order(order_id),
    index idx_family_name (family_name)
);

create table taxon_genus (
	genus_id bigint auto_increment not null primary key,
    genus_name varchar(250) unique not null,
    family_id bigint not null,
    foreign key (family_id) references taxon_family(family_id),
    index idx_genus_name (genus_name)
);

create table taxon_species (
	species_id bigint auto_increment not null primary key,
    species_name_latin varchar(250) unique not null,
    genus_id bigint not null,
    foreign key (genus_id) references taxon_genus(genus_id),
    index idx_species_name_latin (species_name_latin)
);