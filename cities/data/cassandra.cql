
CREATE TABLE "cities" (
        "prefix" text,
	"city_geo_id" text,
	"city_name" text,
	"display_name" text,
	"area_geo_id" text,
	"area_name" text,
	"country_geo_id" text,
	"country_name" text,
	"port_indicator" boolean,
	PRIMARY KEY ("prefix","city_geo_id","city_name","display_name","country_geo_id","country_name"));

INSERT INTO "cities" ("prefix","city_geo_id","city_name","display_name","area_geo_id","area_name","country_geo_id","country_name","port_indicator") VALUES ('L','1','London','London,Greater London,United Kingdom','1','Greater London','1','United Kingdom',false);


INSERT INTO "cities" ("prefix","city_geo_id","city_name","display_name","area_geo_id","area_name","country_geo_id","country_name","port_indicator") VALUES ('L','2','London','London,Ontario,Canada','2','Ontario','1','Canada',false);

INSERT INTO "cities" ("prefix","city_geo_id","city_name","display_name","area_geo_id","area_name","country_geo_id","country_name","port_indicator") VALUES ('F','3','Felixstowe','Felixstowe,Suffolk,UUnited Kingdom','3','Suffolk','1','United Kingdom',true);

INSERT INTO "cities" ("prefix","city_geo_id","city_name","display_name","area_geo_id","area_name","country_geo_id","country_name","port_indicator") VALUES ('Fe','3','Felixstowe','Felixstowe,Suffolk,UUnited Kingdom','3','Suffolk','1','United Kingdom',true);

INSERT INTO "cities" ("prefix","city_geo_id","city_name","display_name","area_geo_id","area_name","country_geo_id","country_name","port_indicator") VALUES ('Fel','3','Felixstowe','Felixstowe,Suffolk,UUnited Kingdom','3','Suffolk','1','United Kingdom',true);

INSERT INTO "cities" ("prefix","city_geo_id","city_name","display_name","area_geo_id","area_name","country_geo_id","country_name","port_indicator") VALUES ('F','4','Feacle','Feacle,Clare,Ireland','4','Clare','4','Ireland',false);

INSERT INTO "cities" ("prefix","city_geo_id","city_name","display_name","area_geo_id","area_name","country_geo_id","country_name","port_indicator") VALUES ('Fe','4','Feacle','Feacle,Clare,Ireland','4','Clare','4','Ireland',false);

INSERT INTO "cities" ("prefix","city_geo_id","city_name","display_name","area_geo_id","area_name","country_geo_id","country_name","port_indicator") VALUES ('Fea','4','Feacle','Feacle,Clare,Ireland','4','Clare','4','Ireland',false);

INSERT INTO "cities" ("prefix","city_geo_id","city_name","display_name","country_geo_id","country_name","port_indicator") VALUES ('F','5','Felcsut','Felcsut,Hungary','5','Hungary',false);

INSERT INTO "cities" ("prefix","city_geo_id","city_name","display_name","country_geo_id","country_name","port_indicator") VALUES ('Fe','5','Felcsut','Felcsut,Hungary','5','Hungary',false);

INSERT INTO "cities" ("prefix","city_geo_id","city_name","display_name","country_geo_id","country_name","port_indicator") VALUES ('Fel','5','Felcsut','Felcsut,Hungary','5','Hungary',false);

INSERT INTO "cities" ("prefix","city_geo_id","city_name","display_name","country_geo_id","country_name","port_indicator") VALUES ('F','6','Faarborg','Faarborg,Norway','6','Norway',false);

INSERT INTO "cities" ("prefix","city_geo_id","city_name","display_name","country_geo_id","country_name","port_indicator") VALUES ('Fa','6','Faarborg','Faarborg,Norway','6','Norway',false);
INSERT INTO "cities" ("prefix","city_geo_id","city_name","display_name","country_geo_id","country_name","port_indicator") VALUES ('Faa','6','Faarborg','Faarborg,Norway','6','Norway',false);