REM   Script: SQL-DML 3
REM   Crea los scripts de base de datos mediante SQL-DML para cargar la información
REM necesaria en la base de datos. Los datos de carga se pueden “inventar”. 


--Aquí cambiamos la columna correo a null antes de insertar los datos ya que estaba como no nullable antes
alter table productores_básicos_de_electricidad modify correo_e null;

--Aquí insertamos valores a la tabla productores básicos de electricidad.
insert into "PRODUCTORES_BÁSICOS_DE_ELECTRICIDAD" values ('47','J6-T','arboleda','arboledagmail.com','11-jan-05','13-jul-22');
insert into "PRODUCTORES_BÁSICOS_DE_ELECTRICIDAD" values ('58','J5-F','gloriante','gloriantegmail.com','12-feb-06','14-jul-22');
insert into "PRODUCTORES_BÁSICOS_DE_ELECTRICIDAD" values ('49','U4-F','victoria','victoriagmail.com','13-mar-05','15-jul-22');
insert into "PRODUCTORES_BÁSICOS_DE_ELECTRICIDAD" values ('12','YE-I','macs','macsgmail.com','14-apr-05','16-jul-22');
insert into "PRODUCTORES_BÁSICOS_DE_ELECTRICIDAD" values ('2','H9-J','acciona','accionagmail.com','15-may-07','17-jul-22');
insert into "PRODUCTORES_BÁSICOS_DE_ELECTRICIDAD" values ('3','P5-J','energy','energygmail.com','16-may-05','18-jul-22');
insert into "PRODUCTORES_BÁSICOS_DE_ELECTRICIDAD" values ('4','H7-H','gabilondo','gabilondogmail.com','17-aug-08','19-jul-22');
insert into "PRODUCTORES_BÁSICOS_DE_ELECTRICIDAD" values ('5','H7-R','null',null,'11-jun-05','20-jul-22');
insert into "PRODUCTORES_BÁSICOS_DE_ELECTRICIDAD" values ('6','Y7-R','pepito','pepitogmail.com','19-sep-09','18-mar22');
insert into "PRODUCTORES_BÁSICOS_DE_ELECTRICIDAD" values ('89','Y2-U','null',null,'11-jun-05','20-jul-22');
insert into "PRODUCTORES_BÁSICOS_DE_ELECTRICIDAD" values ('1','H8-L','endesa','endesagmail.com','21-jan-05','13-sep-22');

--Aquí insertamos datos a la tabla de cooperativas
insert into cooperativas values ('H7-H');

--Aquí insertamos datos a la tabla de particulares
insert into particulares values('H9-J');
insert into particulares values('P5-J');

--Aquí insertamos datos a otro tipo de sociedades con la clave ajena que es la primaria de productors ya que es una herencia
insert into otro_tipos_de_sociedades values('H8-L');
insert into otro_tipos_de_sociedades values('Y7-R');

--Aquí insertamos datos a la tabla estaciones primarias
insert into estaciones_primarias values('Verdejo',34,100,123);
insert into estaciones_primarias values('Manolitos',2,50,987);
insert into estaciones_primarias values('Fuencarral',1,6,65);
insert into estaciones_primarias values('Campos',450,800,947);
insert into estaciones_primarias values('Veritas',300,450,596);
insert into estaciones_primarias values('Portales',160,980,457);

--Aquí insertamos datos a la tabla producores_estaciones
insert into productores_estaciones values(500,8000,'J5-F',123);
insert into productores_estaciones values(400,2000,'J6-T',65);
insert into productores_estaciones values(900,4000,'U4-F',596);

--Aquí cambiamos la columna intercambiar numero de red a null
alter table red_de_distribucion modify intercambiar_numero_de_red null;

--Aquí insertamos datos a la tabla red de distribucion
insert into red_de_distribucion values('IPV4',350,65,null);
insert into red_de_distribucion values('IPV5',200,987,null);
insert into red_de_distribucion values('IPK0',360,123,null);
insert into red_de_distribucion values('IPL7',null,947,null);
insert into red_de_distribucion values('JKU7',200,457,null);

--Aquí insertamos los datos a la tabla compañías de electricidad
insert into compañias_electricidad values('J6-T','JKU7');
insert into compañias_electricidad values('J5-F','IPV5');
insert into compañias_electricidad values('U4-F','IPV4');

--Aquí insertamos los datos a la tabla lineas
insert into lineas values(8,'IPV4');
insert into lineas values(9,'IPK0');
insert into lineas values(11,'IPL7');

--Aquí insertamos datos a la tabla subestacion
insert into subestacion VALUES ('89_P','IPV4');
insert into subestacion VALUES ('68_L','IPL7');
insert into subestacion VALUES ('89_T','IPK0');

--Aquí insertamos datos a la tabla provincia
insert into provincia values('02','Albacete');
insert into provincia values('06','Badajoz');
insert into provincia values('27','Lugo');
insert into provincia values('28','Madrid');
insert into provincia values('51','Ceuta');
insert into provincia values('49','Zamora');
insert into provincia values('31','Navarra');
insert into provincia values('29','Málaga');
insert into provincia values('42','Soria');

--Aquí insertamos datos a la tabla zona de servicio
insert into zona_de_servicio values('98_P','06');
insert into zona_de_servicio values('77_L','27');
insert into zona_de_servicio values('86_R','28');
insert into zona_de_servicio values('92_A','49');
insert into zona_de_servicio values('23_T','31');
insert into zona_de_servicio values('26_E','42');

--Aquí insertamos datos a la tabla creada entre zona de servicio y subestacion al ser una relacion (n,n)
insert into zonaservicio_subestacion values('89_P','23_T');
insert into zonaservicio_subestacion values('89_T','26_E');

--Aquí insertamos datos a la tabla fecha
insert into fecha values(3,15,2000);
insert into fecha values(4,6,2001);
insert into fecha values(8,4,2002);
insert into fecha values(9,12,2010);
insert into fecha values(15,1,2011);


--Aquí insertamos datos a la tabla zonaservicio fecha 
insert into zonaservicio_fecha values(300,8,'92_A');
insert into zonaservicio_fecha values(500,4,'23_T');
insert into zonaservicio_fecha values(350,15,'26_E');


--Aquí insertamos datos a la tabla consumidores
insert into consumidores values('123_L','Pepo','pepogmail.com','Particular');
insert into consumidores values('345_K','Gonzalo','gonzalomail.com','Particular');
insert into consumidores values('235_H','Aldovea','aldoveagmail.com','Colegio');


--Aquí insertamos datos a la tabla fecha consumidores
insert into fecha_consumidores values('123_L',3);
insert into fecha_consumidores values('345_K',4);

--Aquí hemos insertado los datos a la tabla persona
insert into persona values ('06328609K','Pedro','Latasa','Fernández-Layos');
insert into persona values ('12584759R','Pablo','Martín','Borbón');
insert into persona values ('78594759R','Pablo','Richarlos','Pretón');
insert into persona values ('58761258D','Alberto','Moris','López');
insert into persona values ('24570258P','Juan Miguel','Vasallo','Chaves');
insert into persona values ('01472584O','Ana','Rodríguez','Fidal');
insert into persona values ('98750054F','Victoria','Franco','Almendruco');
insert into persona values ('00253368L','Álvaro','Ortiz','Urrutia');
insert into persona values ('05784259P','Rodrigo','Martínez','Calleja');
insert into persona values ('48591204K','Pablo','Otero','Ortiz');
insert into persona values ('04578694J','Miguel','Córdoba','Martínez');
insert into persona values ('05871111K','Teresa','Sémelas','Franco');
insert into persona values ('00005784F','Blanca','Suárez','Ortiz');
insert into persona values ('00001111R','Manuela','Morata','Messi');
insert into persona values ('44445555E','Cristiano','Ronaldo','Suárez');
insert into persona values ('88889999P','Lionel','Messi','Figueroa');
insert into persona values ('05876957F','Marcos','Alía','Figueroa');
insert into persona values ('02457863R','Álvaro','Vacchiano','González');
insert into persona values ('15987222E','Íñigo','Portillo','López');
insert into persona values ('12345678L','María','Gómez','López');
insert into persona values ('13545778L','Miguel','García','López');

--Aquí insertamos datos a la tabla responsable
insert  into responsable values  
('jefe','2-mar-02','pirineos',17,'Valencia', 666555888,666478522,null,'pabloricharlosgmail.com','78594759R');
insert  into responsable values  
('asistente','28-apr-08','alfonso X',12,'Madrid', null,666478521,null,'pedrolatasagmail.com','06328609K');
insert  into responsable values  
('ayudante','12-mar-03','ciervos',120,'Madrid', null,666478521,null,'albertogmail.com','58761258D');
insert  into responsable values  
('ayudante','28-mar-04','golondrina',142,'Valencia', null,666478521,null,'teresagmail.com','05871111K');
insert  into responsable values  
('ayudante','27-sep-05','bartona',1,'Lugo', null,666478521,null,'iñigogmail.com','15987222E');
insert  into responsable values  
('consjero','28-mar-07','mariposas',78,'Valladolid', null,666478521,'alvaroemergenciasgmail.com','alvarogmail.com','00253368L');
insert  into responsable values  
('ayudante','28-apr-08','topos',58,'Alicante', null,666478521,null,'blancagmail.com','00005784F');
insert  into responsable values  
('ayudante','15-mar-09','luces',96,'Barcelona', null,666478521,null,'pablogmail.com','12584759R');
insert  into responsable values  
('consejero','28-mar-10','vasos',12,'Barcelona', null,666478521,null,'marcosgmail.com','05876957F');
insert  into responsable values  
('ayudante','13-mar-11','ratones',1,'Huelva', null,666478521,null,'lionelgmail.com','88889999P');
insert  into responsable values  
('ayudante','28-mar-13','gran via',12,'Almeria', 658745214,666478521,null,'cristianogmail.com','44445555E');
insert  into responsable values  
('ayudante','27-mar-14','gran via',24,'Madrid', null,666478521,null,'mariagmail.com','12345678L');
insert  into responsable values  
('ayudante','28-mar-15','mariposas',2,'Madrid', null,666478521,null,'pablooterogmail.com','48591204K');
insert  into responsable values  
('ayudante','28-mar-17','mariposas',5,'Toledo', null,666478521,null,'juanmiguelgmail.com','24570258P');
insert  into responsable values  
('ayudante','27-mar-20','mariposas',8,'cádiz', null,666478521,null,'victoriagmail.com','98750054F');


--Aquí insertamos datos a la tabla centrales fuentes de electricidad
insert into centrales_fuentes_de_electricidad values 
('Baleares',1257,0824,'whatsapp',2500,'Miguel', 'GPO-9','Castellana',7,'Madrid','YE-I','06328609K');
insert into centrales_fuentes_de_electricidad values 
('Valencia',2685,1235,'twitter',8000,'Alberto', 'GPU-7','Francisco Rodríguez',3,'Madrid','H9-J','58761258D');
insert into centrales_fuentes_de_electricidad values 
('Huelva',1254,2222,'instagram',9000,'Juan Miguel', 'GPA-5','Castellana',180,'Madrid','H8-L','24570258P');
insert into centrales_fuentes_de_electricidad values 
('Madrid',7889,0001,'twitter',2500,'María', 'GPE-2','Plaza Mayor',45,'Madrid','H7-R','12345678L');
insert into centrales_fuentes_de_electricidad values 
('Lugo',4578,0001,'whatsapp',5478,'Iñigo', 'GPE-5','Juana Doña',25,'Lugo','U4-F','15987222E');
insert into centrales_fuentes_de_electricidad values 
('Logroño',7888,9854,'twitter',1000,'Victoria', 'GPW-3','Gerda Taro',78,'Logroño','J6-T','98750054F');
insert into centrales_fuentes_de_electricidad values 
('Huelva',1478,0478,'twitter',2784,'Lionel', 'GPS-8','Ramón Gaya',48,'Huelva','H9-J','88889999P');
insert into centrales_fuentes_de_electricidad values 
('Barcelona',1587,0001,'whatsapp',2500,'Pablo', 'GPH-7','San Germán',14,'Barcelona','Y2-U','12584759R');
insert into centrales_fuentes_de_electricidad values 
(null,4587,0001,'twitter',2500,'Pedro', 'GPG-0',null,180,null,'YE-I','06328609K');
insert into centrales_fuentes_de_electricidad values 
(null,4781,0001,null,1258,'Cristiano', 'GPG-8',null,180,'Madrid','H9-J','44445555E');

--Aquí insertamos datos a la tabla transporte de suministro
insert into empresa_transporte_suministro values 
('Correos','45214587L','1298-P','08-sep-16','correosgmail.com');
insert into empresa_transporte_suministro values 
('Nacex','02587469G','8976-R','04-jun-06','antariagmail.com');
insert into empresa_transporte_suministro values 
('Fedex','12850047H','0058-E','03-apr-14','antariagmail.com');
insert into empresa_transporte_suministro values 
('Antaria','04589632J','0125-W','05-mar-16','antariagmail.com');

--Aquí alteramos las tres claves ajenas a null para así poder añadir telefonos a sólo una empresa específica
alter table telefono modify codigo_consumidores null;
alter table telefono modify codigo_autorizacion_administrativa null;
alter table telefono modify codigo_autorizacion_transporte null;

--Aquí insertamos datos a la tabla telefono
--Aquí insertamos telefonos a los productores
insert into telefono values(668784666,'J6-T',null,null);
insert into telefono values(668456123,'J6-T',null,null);
insert into telefono values(668789589,'J6-T',null,null);
insert into telefono values(667888999,'J5-F',null,null);
insert into telefono values(677333222,'J5-F',null,null);
insert into telefono values(666888999,'J5-F',null,null);
insert into telefono values(668784665,'U4-F',null,null);
insert into telefono values(668777555,'H9-J',null,null);
insert into telefono values(666666666,'P5-J',null,null);
insert into telefono values(668784644,'H7-H',null,null);
insert into telefono values(668784668,'H7-R',null,null);
insert into telefono values(658784666,'Y7-R',null,null);
insert into telefono values(668774666,'Y2-U',null,null);
insert into telefono values(668784696,'H8-L',null,null);

--Aquí insertamos telefonos a consumidores
insert into telefono values(668784444,null,'123_L',null);
insert into telefono values(685748254,null,'345_K',null);
insert into telefono values(687564231,null,'235_H',null);
insert into telefono values(668999888,null,'235_H',null);
insert into telefono values(668999887,null,'235_H',null);

insert into telefono values(657444888,null,null,'1298-P');
insert into telefono values(611222444,null,null,'8976-R');
insert into telefono values(688999777,null,null,'0058-E');
insert into telefono values(644758261,null,null,'0125-W');


--Aquí insertamos datos a la tabla termico
insert into termico values (90,8900,800,900000,'GPO-9');
insert into termico values (87,9582,900,1754744,'GPU-7');

--Aquí insertamos datos a la tabla ciclo combinado
insert into ciclo_combinado values 
('158-O','GPO-9');
insert into ciclo_combinado values 
('875-I','GPU-7');

--Aquí insertamos datos a la tabla centrales_estaciones
insert into centrales_estaciones values 
(8000,123,'GPG-0');
insert into centrales_estaciones values 
(259874,65,'GPG-8');
insert into centrales_estaciones values 
(45782,457,'GPW-3');

--Aquí insertamos datos a la tabla tipo 
insert into tipo values  
('GU-9-J','fotovoltaica');
insert into tipo values  
('GU-8-J','termodinamica');
insert into tipo values  
('GU-8-H','termodinamica');
insert into tipo values  
('YI-8-L','fotovoltaica');

--Aquí insertamos datos a la tabla solar
insert into solar values 
(4578,5872,'GPS-8','YI-8-L');
insert into solar values 
(6587,2000,'GPH-7','GU-8-J');
insert into solar values 
(6900,5800,'GPA-5','GU-9-J');



--Aquí insertamos datos a la tabla eolica
insert into eolica values 
(5,1234,7895,150,780,7000,'GPU-7');
insert into eolica values 
(6,7854,0052,160,820,7050,'GPG-8');
insert into eolica values 
(8,1258,0085,170,890,8950,'GPG-0');

--Aquí insertamos datos a la tabla hidroelectrica
insert into hidroelectrica values 
(5800,8000,4,'GPE-2');
insert into hidroelectrica values 
(6000,8000,4,'GPE-5');

--Aquí insertamos datos a la tabla suministrador
insert into suministrador values 
('Hermanos Alberto','Ecuador','PP-9');
insert into suministrador values 
('Hermanos González','Venezuela','PP-8');
insert into suministrador values 
('Hermanos Núñez','Costa rica','PP-7');

--Aquí insertamos datos a la tabla nuclear
insert into nuclear values 
(5,500,600,'GPS-8','PP-9');
insert into nuclear values 
(5,550,650,'GPH-7','PP-8');
insert into nuclear values 
(6,600,700,'GPE-2','PP-7');


--Aquí insertamos valores a la tabla de uranio
insert into uranio values 
('UR-0','PP-9','GPE-2');
insert into uranio values 
('UR-1','PP-8','GPH-7');

--Aquí insertamos valores a la tabla creada entre uranio y empresa
insert into uranio_empresa values 
('UR-0','1298-P');
insert into uranio_empresa values 
('UR-1','8976-R');

--Aquí añadimos una constraint a la tabla alertas
--En esta constraint decimos que los datos de tipo solo puedan ser: H,S,N,T,E
alter table alertas add constraint ck_tipo 
check(tipo='H'or tipo = 'S' or tipo = 'N' or tipo = 'T' or tipo = 'E');

--Aquí cambiamos todos los datos tipo fecha al siguiente formato: MM/DD/YYYY HH24:MI:SS
ALTER SESSION SET NLS_DATE_FORMAT = 'MM/DD/YYYY HH24:MI:SS';

--Aquí insertamos datos a la tabla de alertas
insert into alertas values 
('AL-00001','H',1258,7854,'APR-14-2016 19:15:02', 
'APR-14-2016 19:18:47','IN-0002','GPO-9');
insert into alertas values 
('AL-00002','T',5000,9000,'MAR-20-2018 11:15:02', 
'MAR-20-2018 11:18:47','IN-0003','GPE-2');
insert into alertas values 
('AL-00003','E',5001,9002,'SEP-15-2019 19:15:02', 
'SEP-15-2019 19:18:47','IN-0004','GPA-5');
insert into alertas values 
('AL-00004','S',5002,9003,'AUG-15-2020 19:15:02', 
'AUG-15-2020 19:18:47','IN-0005','GPH-7');

--Aquí mostramos todas las tablas con todos los datos ya insertados
SELECT * FROM alertas;

SELECT * FROM centrales_estaciones;

SELECT * FROM centrales_fuentes_de_electricidad;

SELECT * FROM ciclo_combinado;

SELECT * FROM compañias_electricidad;

SELECT * FROM consumidores;

SELECT * FROM cooperativas;

SELECT * FROM empresa_transporte_suministro;

SELECT * FROM eolica;

SELECT * FROM estaciones_primarias;

SELECT * FROM fecha;

SELECT * FROM fecha_consumidores;

SELECT * FROM hidroelectrica;

SELECT * FROM lineas;

SELECT * FROM nuclear;

SELECT * FROM otro_tipos_de_sociedades;

SELECT * FROM particulares;

SELECT * FROM persona;

SELECT * FROM productores_básicos_de_electricidad;

SELECT * FROM productores_estaciones;

SELECT * FROM provincia;

SELECT * FROM red_de_distribucion;

SELECT * FROM responsable;

SELECT * FROM solar;

SELECT * FROM subestacion;

SELECT * FROM suministrador;

SELECT * FROM telefono;

SELECT * FROM termico;

SELECT * FROM tipo;

SELECT * FROM uranio;

SELECT * FROM uranio_empresa;

SELECT * FROM zona_de_servicio;

SELECT * FROM zonaservicio_fecha;

SELECT * FROM zonaservicio_subestacion;

--Aquí ponemos el comando commit aunque no sea necesario
--Normalmente suele ser necesario en la herramienta sqlcl de oracle
commit;


