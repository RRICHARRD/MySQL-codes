create database courses;
use courses;

create table courses(
courseID int not null,
name varchar(65) not null,
description text, 
durationTime int unsigned,
beginningTime date 
);

describe courses;
explain courses;
desc courses;