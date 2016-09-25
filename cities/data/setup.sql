create table cities (
       id serial primary key,
       city_geo_id varchar(10) not null unique,
       city_name varchar(30) not null,
       display_name varchar(256),
       area_geo_id varchar(10),
       area_name varchar(256),
       country_geo_id varchar(10) not null unique,
       country_name varchar(256),
       port_indicator boolean
);
