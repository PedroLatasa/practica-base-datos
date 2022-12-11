REM Crea los scripts de base de datos que permitan optimizar las queries aplicando
REM algoritmos de optimización basados en índices. 

--Creamo un índice que nos una las dos columnas longitud y latitud como coordenadas
CREATE INDEX I_centrales_coordenadas
on centrales_fuentes_de_electricidad(longitud,latitud);

--Creamos un índice para persona que sea nombre e incluya nombre y apellidos
CREATE INDEX I_persona_nombre
on persona (nombre, apellido1,apellido2);

--Creamos otro índice que sea ubicación para las centrales
CREATE INDEX I_centrales_ubicacion
on centrales_fuentes_de_electricidad (calle,numero_calle,ciudad);

--Creamos otro índice para responsable en el que guardaremos sus telefonos
CREATE INDEX telefonos
on responsable (telefono_urgencias,telefono_convencional);

--Creamos otro índice para responsable en el que guardaremos sus correos
CREATE INDEX correos
on responsable (correo_urgencias,correo_institucional);
