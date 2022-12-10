REM   Script: Script SQL-DDL
REM   Crea los scripts de base de datos conforme a la sintaxis del SQL-DDL que nos
REM permita crear todas las estructuras que garanticen el almacenamiento de los
REM datos requeridos en el ejercicio acorde con las restricciones propias del modelo
REM relacional y del enunciado. 

--Aquí creamos la tabla productores básicos de electricidad
CREATE TABLE Productores_Básicos_de_Electricidad 
( 
  NIF Varchar2(9) NOT NULL, 
  Codigo_autorizacion_administrativa Varchar2(100) NOT NULL, 
  Denominacion Varchar2(250), 
  Correo_e Varchar2(100) NOT NULL, 
  Fecha_inicio DATE NOT NULL, 
  Fecha_fin DATE NOT NULL, 
  PRIMARY KEY (Codigo_autorizacion_administrativa), 
  UNIQUE (NIF) 
);

--Aquí creamos la tabla cooperativas
CREATE TABLE Cooperativas 
( 
  Codigo_autorizacion_administrativa Varchar2(100) NOT NULL, 
  PRIMARY KEY (Codigo_autorizacion_administrativa), 
  FOREIGN KEY (Codigo_autorizacion_administrativa) REFERENCES Productores_Básicos_de_Electricidad(Codigo_autorizacion_administrativa) 
);

--Aquí creamos la otro tipo de sociedades
CREATE TABLE Otro_tipos_de_sociedades 
( 
  Codigo_autorizacion_administrativa Varchar2(100) NOT NULL, 
  PRIMARY KEY (Codigo_autorizacion_administrativa), 
  FOREIGN KEY (Codigo_autorizacion_administrativa) REFERENCES Productores_Básicos_de_Electricidad(Codigo_autorizacion_administrativa) 
);

--Aquí creamos la tabla persona
CREATE TABLE Persona 
( 
  DNI Varchar2(9) NOT NULL, 
  Nombre Varchar2(100) NOT NULL, 
  Apellido1 Varchar2(100) NOT NULL, 
  Apellido2 Varchar2(100) NOT NULL, 
  PRIMARY KEY (DNI) 
);

--Aquí creamos la tabla responsable
CREATE TABLE Responsable 
( 
  Denominacion_del_cargo Varchar2(250), 
  Fecha_nombramiento DATE NOT NULL, 
  Calle Varchar2(100) NOT NULL, 
  Numero Number NOT NULL, 
  Ciudad Varchar2(100) NOT NULL, 
  Telefono_urgencias Number, 
  Telefono_convencional Number NOT NULL, 
  Correo_urgencias Varchar2(100), 
  Correo_institucional Varchar2(100) NOT NULL, 
  DNI Varchar2(9) NOT NULL, 
  PRIMARY KEY (DNI), 
  FOREIGN KEY (DNI) REFERENCES Persona(DNI) 
);

--Aquí creamos la tabla tipo
CREATE TABLE Tipo 
( 
  Codigo_tipo Varchar2(100) NOT NULL, 
  Tipo Varchar2(100) NOT NULL, 
  PRIMARY KEY (Codigo_tipo) 
);

--Aquí creamos la tabla empresa transporte suministro
CREATE TABLE Empresa_Transporte_suministro 
( 
  Nombre Varchar2(100) NOT NULL, 
  NIF Varchar2(9) NOT NULL, 
  Codigo_autorizacion_transporte Varchar2(100) NOT NULL, 
  Fecha_validez_autorizacion DATE NOT NULL, 
  Correo_e_emergencias Varchar2(100) NOT NULL, 
  PRIMARY KEY (Codigo_autorizacion_transporte), 
  UNIQUE (NIF) 
);

--Aquí creamos la tabla suministrador
CREATE TABLE Suministrador 
( 
  Nombre Varchar2(100) NOT NULL, 
  Pais Varchar2(100) NOT NULL, 
  Codigo_suministrador Varchar2(100) NOT NULL, 
  PRIMARY KEY (Codigo_suministrador) 
);

--Aquí creamos la tabla estaciones primarias
CREATE TABLE Estaciones_primarias 
( 
  Nombre Varchar2(50) NOT NULL, 
  Numero_baja_tension Number NOT NULL, 
  Numero_alta_tension Number NOT NULL, 
  Codigo_estacion_primaria Varchar2(50) NOT NULL, 
  PRIMARY KEY (Codigo_estacion_primaria) 
);

--Aquí creamos la tabla provincia
CREATE TABLE Provincia 
( 
  Codigo_provincia Varchar2(100) NOT NULL, 
  Nombre Varchar2(100) NOT NULL, 
  PRIMARY KEY (Codigo_provincia) 
);

--Aquí creamos la tabla fecha
CREATE TABLE Fecha 
( 
  Dia INT NOT NULL, 
  Mes INT NOT NULL, 
  Año INT NOT NULL, 
  PRIMARY KEY (Dia), 
  UNIQUE (Mes), 
  UNIQUE (Año) 
);

--Aquí creamos la tabla consumidores
CREATE TABLE Consumidores 
( 
  Codigo_consumidores Varchar2(100) NOT NULL, 
  Nombre Varchar2(100) NOT NULL, 
  Correo_e Varchar2(100) NOT NULL, 
  Tipo Varchar2(100), 
  PRIMARY KEY (Codigo_consumidores) 
);

--Aquí creamos la tabla particulares
CREATE TABLE Particulares 
( 
  Codigo_autorizacion_administrativa Varchar2(100) NOT NULL, 
  PRIMARY KEY (Codigo_autorizacion_administrativa), 
  FOREIGN KEY (Codigo_autorizacion_administrativa) REFERENCES Productores_Básicos_de_Electricidad(Codigo_autorizacion_administrativa) 
);

--Aquí creamos la tabla productores estaciones 
CREATE TABLE Productores_Estaciones 
( 
  Cantidad_Energia Number NOT NULL, 
  Total_produccion Number NOT NULL, 
  Codigo_autorizacion_administrativa Varchar2(100) NOT NULL, 
  Codigo_estacion_primaria Varchar2(50) NOT NULL, 
  PRIMARY KEY (Cantidad_Energia), 
  FOREIGN KEY (Codigo_autorizacion_administrativa) REFERENCES Productores_Básicos_de_Electricidad(Codigo_autorizacion_administrativa), 
  FOREIGN KEY (Codigo_estacion_primaria) REFERENCES Estaciones_primarias(Codigo_estacion_primaria), 
  UNIQUE (Codigo_autorizacion_administrativa, Codigo_estacion_primaria) 
);

--Aquí creamos la tabla fecha consumidores
CREATE TABLE Fecha_consumidores 
( 
  Codigo_consumidores Varchar2(100) NOT NULL, 
  Dia INT NOT NULL, 
  PRIMARY KEY (Codigo_consumidores, Dia), 
  FOREIGN KEY (Codigo_consumidores) REFERENCES Consumidores(Codigo_consumidores), 
  FOREIGN KEY (Dia) REFERENCES Fecha(Dia) 
);

--Aquí creamos la tabla telefono
CREATE TABLE Telefono 
( 
  Numero_unico Number NOT NULL, 
  Codigo_autorizacion_administrativa Varchar2(100) NOT NULL, 
  Codigo_consumidores Varchar2(100) NOT NULL, 
  Codigo_autorizacion_transporte Varchar2(100) NOT NULL, 
  PRIMARY KEY (Numero_unico), 
  FOREIGN KEY (Codigo_autorizacion_administrativa) REFERENCES Productores_Básicos_de_Electricidad(Codigo_autorizacion_administrativa), 
  FOREIGN KEY (Codigo_consumidores) REFERENCES Consumidores(Codigo_consumidores), 
  FOREIGN KEY (Codigo_autorizacion_transporte) REFERENCES Empresa_Transporte_suministro(Codigo_autorizacion_transporte) 
);

--Aquí creamos la tabla centrales fuentes de electricidad
CREATE TABLE Centrales_Fuentes_de_electricidad 
( 
  Denominacion Varchar2(250), 
  Latitud Number NOT NULL, 
  Longitud Number NOT NULL, 
  Identidad_digital Varchar2(100), 
  Producción_hora Number NOT NULL, 
  Propietario Varchar2(100) NOT NULL, 
  Codigo_central Varchar2(100) NOT NULL, 
  Calle Varchar2(100), 
  Numero_calle Number, 
  Ciudad Varchar2(100), 
  Codigo_autorizacion_administrativa Varchar2(100) NOT NULL, 
  DNI Varchar2(9) NOT NULL, 
  PRIMARY KEY (Codigo_central), 
  FOREIGN KEY (Codigo_autorizacion_administrativa) REFERENCES Productores_Básicos_de_Electricidad(Codigo_autorizacion_administrativa), 
  FOREIGN KEY (DNI) REFERENCES Responsable(DNI) 
);

--Aquí creamos la tabla hidroelectrica 
CREATE TABLE Hidroelectrica 
( 
  Volumen_agua_al_día Number NOT NULL, 
  Volumen_maximo Number NOT NULL, 
  Numero_turbinas Number NOT NULL, 
  Codigo_central Varchar2(100) NOT NULL, 
  PRIMARY KEY (Codigo_central), 
  FOREIGN KEY (Codigo_central) REFERENCES Centrales_Fuentes_de_electricidad(Codigo_central) 
);

--Aquí creamos la tabla solar
CREATE TABLE Solar 
( 
  Superficie_total_paneles Number NOT NULL, 
  Media_anual_radiacion Number NOT NULL, 
  Codigo_central Varchar2(100) NOT NULL, 
  Codigo_tipo Varchar2(100) NOT NULL, 
  PRIMARY KEY (Codigo_central), 
  FOREIGN KEY (Codigo_central) REFERENCES Centrales_Fuentes_de_electricidad(Codigo_central), 
  FOREIGN KEY (Codigo_tipo) REFERENCES Tipo(Codigo_tipo) 
);

--Aquí creamos la tabla nuclear
CREATE TABLE Nuclear 
( 
  Numero_reactores Number NOT NULL, 
  Volumen_diario_mineral_consum Number NOT NULL, 
  Volumen_diario_mineral_residuos Number NOT NULL, 
  Codigo_central Varchar2(100) NOT NULL, 
  Codigo_suministrador Varchar2(100) NOT NULL, 
  PRIMARY KEY (Codigo_central), 
  FOREIGN KEY (Codigo_central) REFERENCES Centrales_Fuentes_de_electricidad(Codigo_central), 
  FOREIGN KEY (Codigo_suministrador) REFERENCES Suministrador(Codigo_suministrador) 
);
 
--Aquí creamos la tabla termico
CREATE TABLE Termico 
( 
  Metros_cubicos_gas_h Number NOT NULL, 
  Tiempo_anual_inyeccion Number NOT NULL, 
  Tiempo_mensual_inyeccion Number NOT NULL, 
  Volumen_anual_CO2 Number NOT NULL, 
  Codigo_central Varchar2(100) NOT NULL, 
  PRIMARY KEY (Codigo_central), 
  FOREIGN KEY (Codigo_central) REFERENCES Centrales_Fuentes_de_electricidad(Codigo_central) 
);

---Aquí creamos la tabla eolica
CREATE TABLE Eolica 
( 
  Numero_aerogeneradores Number NOT NULL, 
  Latitud Number NOT NULL, 
  Longitud Number NOT NULL, 
  Velocidad_rotacion_max Number NOT NULL, 
  Tiempo_acumulado_hora Number NOT NULL, 
  Produccion_hora Number NOT NULL, 
  Codigo_central Varchar2(100) NOT NULL, 
  PRIMARY KEY (Codigo_central), 
  FOREIGN KEY (Codigo_central) REFERENCES Centrales_Fuentes_de_electricidad(Codigo_central) 
);

--Aquí creamos la tabla ciclo combinado
CREATE TABLE Ciclo_combinado 
( 
  Codigo_ciclo_combinado Varchar2(100) NOT NULL, 
  Codigo_central Varchar2(100) NOT NULL, 
  PRIMARY KEY (Codigo_ciclo_combinado), 
  FOREIGN KEY (Codigo_central) REFERENCES Termico(Codigo_central) 
);

--Aquí creamos la tabla uranio
CREATE TABLE Uranio 
( 
  Codigo_uranio Varchar2(100) NOT NULL, 
  Codigo_suministrador Varchar2(100) NOT NULL, 
  Codigo_central Varchar2(100) NOT NULL, 
  PRIMARY KEY (Codigo_uranio), 
  FOREIGN KEY (Codigo_suministrador) REFERENCES Suministrador(Codigo_suministrador), 
  FOREIGN KEY (Codigo_central) REFERENCES Nuclear(Codigo_central) 
);

--Aquí creamos la tabla zona de servicio
CREATE TABLE Zona_de_servicio 
( 
  Codigo_zona_servicio Varchar2(100) NOT NULL, 
  Codigo_provincia Varchar2(100) NOT NULL, 
  PRIMARY KEY (Codigo_zona_servicio), 
  FOREIGN KEY (Codigo_provincia) REFERENCES Provincia(Codigo_provincia) 
);

--Aquí creamos la tabla alertas
CREATE TABLE Alertas 
( 
  Codigo_alerta Varchar2(100) NOT NULL, 
  Tipo Varchar2(100) NOT NULL, 
  Latitud Number NOT NULL, 
  Longitud Number NOT NULL, 
  Fecha_activacion DATE NOT NULL, 
  Fecha_desactivacion DATE NOT NULL, 
  Intervencion Varchar2(100) NOT NULL, 
  Codigo_central Varchar2(100) NOT NULL, 
  PRIMARY KEY (Codigo_alerta), 
  FOREIGN KEY (Codigo_central) REFERENCES Centrales_Fuentes_de_electricidad(Codigo_central), 
  UNIQUE (Latitud, Longitud) 
);

--Aquí creamos la tabla uranio empresa
CREATE TABLE Uranio_Empresa 
( 
  Codigo_uranio Varchar2(100) NOT NULL, 
  Codigo_autorizacion_transporte Varchar2(100) NOT NULL, 
  PRIMARY KEY (Codigo_uranio, Codigo_autorizacion_transporte), 
  FOREIGN KEY (Codigo_uranio) REFERENCES Uranio(Codigo_uranio), 
  FOREIGN KEY (Codigo_autorizacion_transporte) REFERENCES Empresa_Transporte_suministro(Codigo_autorizacion_transporte) 
);

--Aquí creamos la tabla centrales estaciones
CREATE TABLE Centrales_Estaciones 
( 
  Cantidad_Energia Number NOT NULL, 
  Codigo_estacion_primaria Varchar2(50) NOT NULL, 
  Codigo_central Varchar2(100) NOT NULL, 
  PRIMARY KEY (Codigo_estacion_primaria, Codigo_central), 
  FOREIGN KEY (Codigo_estacion_primaria) REFERENCES Estaciones_primarias(Codigo_estacion_primaria), 
  FOREIGN KEY (Codigo_central) REFERENCES Centrales_Fuentes_de_electricidad(Codigo_central) 
);

--Aquí creamos la tabla zona de servicio fecha
CREATE TABLE ZonaServicio_Fecha 
( 
  Consumo_medio Number NOT NULL, 
  Dia INT NOT NULL, 
  Codigo_zona_servicio Varchar2(100) NOT NULL, 
  PRIMARY KEY (Dia, Codigo_zona_servicio), 
  FOREIGN KEY (Dia) REFERENCES Fecha(Dia), 
  FOREIGN KEY (Codigo_zona_servicio) REFERENCES Zona_de_servicio(Codigo_zona_servicio) 
);

--Aquí creamos la tabla red de distribucion
CREATE TABLE Red_de_distribucion 
( 
  Numero_de_red Varchar2(100) NOT NULL, 
  Energia_sobrante Number, 
  Codigo_estacion_primaria Varchar2(50) NOT NULL, 
  Intercambiar_Numero_de_red Varchar2(100) NOT NULL, 
  PRIMARY KEY (Numero_de_red), 
  FOREIGN KEY (Codigo_estacion_primaria) REFERENCES Estaciones_primarias(Codigo_estacion_primaria), 
  FOREIGN KEY (Intercambiar_Numero_de_red) REFERENCES Red_de_distribucion(Numero_de_red) 
);

--Aquí creamos la tabla compañías de electricidad
CREATE TABLE Compañias_Electricidad 
( 
  Codigo_autorizacion_administrativa Varchar2(100) NOT NULL, 
  Numero_de_red Varchar2(100) NOT NULL, 
  PRIMARY KEY (Codigo_autorizacion_administrativa), 
  FOREIGN KEY (Codigo_autorizacion_administrativa) REFERENCES Productores_Básicos_de_Electricidad(Codigo_autorizacion_administrativa), 
  FOREIGN KEY (Numero_de_red) REFERENCES Red_de_distribucion(Numero_de_red) 
);

--Aquí creamos la tabla lineas
CREATE TABLE Lineas 
( 
  Longitud Number NOT NULL, 
  Numero_de_red Varchar2(100) NOT NULL, 
  PRIMARY KEY (Numero_de_red), 
  FOREIGN KEY (Numero_de_red) REFERENCES Red_de_distribucion(Numero_de_red) 
);

--Aquí creamos la tabla subestacion
CREATE TABLE Subestacion 
( 
  Codigo_subestacion Varchar2(100) NOT NULL, 
  Numero_de_red Varchar2(100) NOT NULL, 
  PRIMARY KEY (Codigo_subestacion), 
  FOREIGN KEY (Numero_de_red) REFERENCES Lineas(Numero_de_red) 
);

--Aquí creamos la tabla zona de servicio subestacion
CREATE TABLE ZonaServicio_subestacion 
( 
  Codigo_subestacion Varchar2(100) NOT NULL, 
  Codigo_zona_servicio Varchar2(100) NOT NULL, 
  PRIMARY KEY (Codigo_subestacion, Codigo_zona_servicio), 
  FOREIGN KEY (Codigo_subestacion) REFERENCES Subestacion(Codigo_subestacion), 
  FOREIGN KEY (Codigo_zona_servicio) REFERENCES Zona_de_servicio(Codigo_zona_servicio) 
);

