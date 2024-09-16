-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-09-16 03:11:27 CLST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE clientes (
    rut      VARCHAR2(10 BYTE) NOT NULL,
    nombre   VARCHAR2(100 BYTE) NOT NULL,
    telefono VARCHAR2(13 BYTE) NOT NULL,
    email    VARCHAR2(100 BYTE) NOT NULL
);

ALTER TABLE clientes ADD CONSTRAINT clientes_pk PRIMARY KEY ( rut );

CREATE TABLE detalle_orden_servicios (
    ordenes_de_servicios_id_orden INTEGER NOT NULL,
    servicios_id_servicio         INTEGER NOT NULL,
    validacion_id_validacion      INTEGER NOT NULL,
    descripcion                   VARCHAR2(250 BYTE),
    empleados_id_empleado         INTEGER NOT NULL
);

CREATE TABLE empleados (
    id_empleado      INTEGER NOT NULL,
    rut              VARCHAR2(10 BYTE) NOT NULL,
    primer_nombre    VARCHAR2(50 BYTE) NOT NULL,
    segundo_nombre   VARCHAR2(50 BYTE) NOT NULL,
    apellido_paterno VARCHAR2(50 BYTE) NOT NULL,
    apellido_materno VARCHAR2(50 BYTE) NOT NULL,
    cargo            VARCHAR2(50 BYTE) NOT NULL
);

ALTER TABLE empleados ADD CONSTRAINT empleados_pk PRIMARY KEY ( id_empleado );

CREATE TABLE ordenes_de_servicios (
    id_orden          INTEGER NOT NULL,
    fecha             DATE NOT NULL,
    descripcion       VARCHAR2(250 BYTE),
    clientes_rut      VARCHAR2(10 BYTE) NOT NULL,
    vehiculos_patente VARCHAR2(6 BYTE) NOT NULL
);

ALTER TABLE ordenes_de_servicios ADD CONSTRAINT ordenes_de_servicios_pk PRIMARY KEY ( id_orden );

CREATE TABLE repuestos (
    id_repuesto INTEGER NOT NULL,
    descripcion VARCHAR2(250 BYTE) NOT NULL,
    precio      INTEGER NOT NULL,
    stock       INTEGER NOT NULL
);

ALTER TABLE repuestos ADD CONSTRAINT repuestos_pk PRIMARY KEY ( id_repuesto );

CREATE TABLE repuestos_ordenes (
    repuestos_id_repuesto         INTEGER NOT NULL,
    ordenes_de_servicios_id_orden INTEGER NOT NULL,
    cantidad                      INTEGER NOT NULL
);

CREATE TABLE servicios (
    id_servicio INTEGER NOT NULL,
    descripcion VARCHAR2(250 BYTE),
    valor       INTEGER NOT NULL
);

ALTER TABLE servicios ADD CONSTRAINT servicios_pk PRIMARY KEY ( id_servicio );

CREATE TABLE validacion (
    id_validacion         INTEGER NOT NULL,
    descripcion           VARCHAR2(250 BYTE),
    validado              CHAR(1) NOT NULL,
    empleados_id_empleado INTEGER NOT NULL
);

ALTER TABLE validacion ADD CONSTRAINT validacion_pk PRIMARY KEY ( id_validacion );

CREATE TABLE vehiculos (
    patente      VARCHAR2(6 BYTE) NOT NULL,
    marca        VARCHAR2(50 BYTE) NOT NULL,
    modelo       VARCHAR2(50 BYTE) NOT NULL,
    año          INTEGER NOT NULL,
    clientes_rut VARCHAR2(10 BYTE) NOT NULL,
    descripcion  VARCHAR2(250 BYTE)
);

ALTER TABLE vehiculos ADD CONSTRAINT vehiculos_pk PRIMARY KEY ( patente );

ALTER TABLE detalle_orden_servicios
    ADD CONSTRAINT detalle_empleados_fk FOREIGN KEY ( empleados_id_empleado )
        REFERENCES empleados ( id_empleado );

ALTER TABLE detalle_orden_servicios
    ADD CONSTRAINT detalle_ordenes_fk FOREIGN KEY ( ordenes_de_servicios_id_orden )
        REFERENCES ordenes_de_servicios ( id_orden );

ALTER TABLE detalle_orden_servicios
    ADD CONSTRAINT detalle_servicios_fk FOREIGN KEY ( servicios_id_servicio )
        REFERENCES servicios ( id_servicio );

ALTER TABLE detalle_orden_servicios
    ADD CONSTRAINT detalle_validacion_fk FOREIGN KEY ( validacion_id_validacion )
        REFERENCES validacion ( id_validacion );

ALTER TABLE ordenes_de_servicios
    ADD CONSTRAINT ordenes_clientes_fk FOREIGN KEY ( clientes_rut )
        REFERENCES clientes ( rut );

ALTER TABLE ordenes_de_servicios
    ADD CONSTRAINT ordenes_vehiculos_fk FOREIGN KEY ( vehiculos_patente )
        REFERENCES vehiculos ( patente );

ALTER TABLE repuestos_ordenes
    ADD CONSTRAINT repuestos_ordenes_fk FOREIGN KEY ( ordenes_de_servicios_id_orden )
        REFERENCES ordenes_de_servicios ( id_orden );

ALTER TABLE repuestos_ordenes
    ADD CONSTRAINT repuestos_ordenes_repuestos_fk FOREIGN KEY ( repuestos_id_repuesto )
        REFERENCES repuestos ( id_repuesto );

ALTER TABLE validacion
    ADD CONSTRAINT validacion_empleados_fk FOREIGN KEY ( empleados_id_empleado )
        REFERENCES empleados ( id_empleado );

ALTER TABLE vehiculos
    ADD CONSTRAINT vehiculos_clientes_fk FOREIGN KEY ( clientes_rut )
        REFERENCES clientes ( rut );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
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
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
