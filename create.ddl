-- Generated by Oracle SQL Developer Data Modeler 20.2.0.167.1538
--   at:        2022-04-20 22:24:33 EEST
--   site:      Oracle Database 12c
--   type:      Oracle Database 12c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE arrest (
    id                NUMBER NOT NULL,
    arrest_date       DATE,
    jurisdiction      NUMBER NOT NULL,
    map_coords_id     NUMBER NOT NULL,
    gps_coords_id     NUMBER NOT NULL,
    pd_id             NUMBER NOT NULL,
    ky_id             NUMBER NOT NULL,
    law_id            NUMBER NOT NULL,
    location_info_id  NUMBER NOT NULL
);

ALTER TABLE arrest ADD CONSTRAINT arrest_pk PRIMARY KEY ( id );

CREATE TABLE boroughs (
    id    NUMBER NOT NULL,
    name  VARCHAR2(2) NOT NULL
);

ALTER TABLE boroughs ADD CONSTRAINT boroughs_pk PRIMARY KEY ( id );

CREATE TABLE gps_coords (
    id      NUMBER NOT NULL,
    "long"  NUMBER(12, 10) NOT NULL,
    lat     NUMBER(12, 10) NOT NULL
);

ALTER TABLE gps_coords ADD CONSTRAINT gps_coords_pk PRIMARY KEY ( id );

CREATE TABLE ky (
    id       NUMBER NOT NULL,
    ky_code  NUMBER NOT NULL,
    ky_desc  VARCHAR2(50) NOT NULL
);

ALTER TABLE ky ADD CONSTRAINT ky_pk PRIMARY KEY ( id );

CREATE TABLE law (
    id        NUMBER NOT NULL,
    law_code  VARCHAR2(45) NOT NULL,
    category  VARCHAR2(2) NOT NULL
);

ALTER TABLE law ADD CONSTRAINT law_pk PRIMARY KEY ( id );

CREATE TABLE location_info (
    id               NUMBER NOT NULL,
    arrest_precinct  NUMBER NOT NULL,
    boroughs_id      NUMBER NOT NULL
);

ALTER TABLE location_info ADD CONSTRAINT location_info_pk PRIMARY KEY ( id );

CREATE TABLE map_coords (
    id  NUMBER NOT NULL,
    x   NUMBER NOT NULL,
    y   NUMBER NOT NULL
);

ALTER TABLE map_coords ADD CONSTRAINT map_coords_pk PRIMARY KEY ( id );

CREATE TABLE pd (
    id       NUMBER NOT NULL,
    pd_code  NUMBER NOT NULL,
    pd_desc  VARCHAR2(50) NOT NULL
);

ALTER TABLE pd ADD CONSTRAINT pd_pk PRIMARY KEY ( id );

CREATE TABLE perpetrator_info (
    arrest_id  NUMBER NOT NULL,
    age_group  VARCHAR2(45),
    sex        VARCHAR2(2),
    race       VARCHAR2(45)
);

ALTER TABLE perpetrator_info ADD CONSTRAINT perpetrator_info_pk PRIMARY KEY ( arrest_id );

ALTER TABLE arrest
    ADD CONSTRAINT arrest_gps_coords_fk FOREIGN KEY ( gps_coords_id )
        REFERENCES gps_coords ( id );

ALTER TABLE arrest
    ADD CONSTRAINT arrest_ky_fk FOREIGN KEY ( ky_id )
        REFERENCES ky ( id );

ALTER TABLE arrest
    ADD CONSTRAINT arrest_law_fk FOREIGN KEY ( law_id )
        REFERENCES law ( id );

ALTER TABLE arrest
    ADD CONSTRAINT arrest_location_info_fk FOREIGN KEY ( location_info_id )
        REFERENCES location_info ( id );

ALTER TABLE arrest
    ADD CONSTRAINT arrest_map_coords_fk FOREIGN KEY ( map_coords_id )
        REFERENCES map_coords ( id );

ALTER TABLE arrest
    ADD CONSTRAINT arrest_pd_fk FOREIGN KEY ( pd_id )
        REFERENCES pd ( id );

ALTER TABLE location_info
    ADD CONSTRAINT location_info_boroughs_fk FOREIGN KEY ( boroughs_id )
        REFERENCES boroughs ( id );

ALTER TABLE perpetrator_info
    ADD CONSTRAINT perpetrator_info_arrest_fk FOREIGN KEY ( arrest_id )
        REFERENCES arrest ( id );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             9
-- CREATE INDEX                             0
-- ALTER TABLE                             17
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- TSDP POLICY                              0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
