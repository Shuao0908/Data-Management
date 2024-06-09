#!/bin/bash

$(/opt/lampp/bin/mysql -u root -e "create database cw2_material_db; use cw2_material_db")
$(/opt/lampp/bin/mysql -u root -e "use cw2_material_db;
	create table material(
	id int NOT NULL AUTO_INCREMENT,
	recorded_date DATETIME NOT NULL,
	weight varchar(50),
	material_name varchar(50),
	dollar_type varchar(50),
	material_price decimal(7,2),
	PRIMARY KEY(id))"
)
