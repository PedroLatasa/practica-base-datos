REM   Script: Script SQL-Esquemas externos
REM Crea los scripts de base de datos para concretar los esquemas externos que
REM consideres adecuados en función del tipo de usuarios previstos. 

--Primero metemos nuestro usuario y contraseña de la practica
--En este caso  Usuario: practicas Password: oracle
--A continuación creamos los usuarios que consideramos oportunos para adjudicarle derechos.

--Creamos un usuario propietario
CREATE USER propietario
IDENTIFIED BY oracle
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp;

--Creamos un usuario CEO
CREATE USER CEO
IDENTIFIED BY oracle
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp;

--Creamos un usuario técnico
CREATE USER tecnico
IDENTIFIED BY oracle
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp;

--Creamos un usuario suministrador
CREATE USER suministrador
IDENTIFIED BY oracle
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp;

--Creamos un usuario responsable
CREATE USER responsable
IDENTIFIED BY oracle
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp;


--Ahora haremos las views que los usuarios verán al acceder a alguna de las tablas
--Para el propietario de las centrales haremos que sólo pueda verlo todo menos el DNI de la persona responsable y el código
--de la autorización administrativa de los productores

CREATE VIEW informacion_centrales
AS SELECT 
denominacion, 
latitud, 
longitud, 
identidad_digital, 
producción_hora, 
propietario, 
codigo_central, 
calle, 
numero_calle, 
ciudad
FROM centrales_fuentes_de_electricidad;

GRANT select on practicas.informacion_centrales to propietario;

--Para el CEO haremos que pueda ver todos los datos de productores
CREATE VIEW productores_ceo
AS SELECT 
NIF,
denominacion,
correo_e,
numero_unico
FROM 
productores_básicos_de_electricidad c,
telefono t
WHERE
c.codigo_autorizacion_administrativa = t.codigo_autorizacion_administrativa;

grant select on productores_ceo to CEO;


--Para el técnico haremos que pueda ver todas las alertas pero sin ver sus coordenadas y el código de la central
CREATE VIEW alertas_tecnico 
AS SELECT
codigo_alerta,
tipo,
fecha_activacion,
fecha_desactivacion,
intervencion
from alertas;

grant select on practicas.alertas_tecnico to tecnico;

--Para el suministrador haremos que pueda ver:

CREATE VIEW suministrador_vista
AS SELECT
codigo_suministrador,
calle,
numero_calle,
ciudad
FROM
centrales_fuentes_de_electricidad c,
nuclear n 
WHERE 
c.codigo_central = n.codigo_central;


grant select on suministrador_vista to suministrador;

--Para el responsable haremos que vea la siguiente

CREATE VIEW responsable_vista
AS SELECT
r.DNI,
denominacion_del_cargo,
c.calle,
numero_calle,
c.ciudad,
propietario
FROM
responsable r,
centrales_fuentes_de_electricidad c
WHERE
r.dni = c.dni;

grant select on responsable_vista to responsable;
grant 

CREATE VIEW alertas_vista_tipoN
AS SELECT
tipo,
a.latitud,
a.longitud,
fecha_activacion,
fecha_desactivacion,
intervencion,
a.codigo_central
FROM 
centrales_fuentes_de_electricidad c,
alertas a
WHERE 
c.codigo_central = a.codigo_central;









