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
grant select on practicas.productores_básicos_de_electricidad to CEO;


--Para el técnico haremos que pueda ver todas las alertas pero sin ver sus coordenadas y el código de la central
CREATE VIEW alertas_técnico 
AS SELECT
codigo_alerta,
tipo,
fecha_activacion,
fecha_desactivacion,
intervencion
from alertas;

grant select on practicas.alertas_técnico to tecnico;

--Para el suministrador haremos que pueda ver:

CREATE VIEW suministrador_vista
AS SELECT
nombre,
pais,
codigo_suministrador,
calle,
numero
ciudad
FROM
suministrador s,
centrales_fuentes_de_electricidad c
WHERE
c.codigo_central = u.codigo_central;

grant select on suministrador_vista to tecnico;

--Para el responsable haremos que vea la siguiente

CREATE VIEW responsable_vista
AS SELECT
(SELECT * FROM centrales_fuentes_de_electricidad)
from centrales_fuentes_de_electricidad;








