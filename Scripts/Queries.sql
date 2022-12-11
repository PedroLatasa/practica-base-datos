REM Programa todas los queries y/o procedimientos necesarios para consultar, al
REM menos, las siguientes informaciones:

--i. Todos los datos de los productores que generan electricidad con más
--de dos fuentes de energía, con autorización en vigor y tengan la forma
--de Sociedades Anónimas (S.A.) 

SELECT
NIF,
c.denominacion,
correo_e,
fecha_inicio,
fecha_fin
FROM 
productores_básicos_de_electricidad P INNER JOIN
centrales_fuentes_de_electricidad c ON  p.codigo_autorizacion_administrativa = c.codigo_autorizacion_administrativa
WHERE
c.denominacion like '%S.A.' 
AND c.codigo_autorizacion_administrativa>2;

--ii.Todos los datos de las centrales eólicas en las que se haya producido
--electricidad durante el último mes, cuya producción media superior a la
--media de cualquier otra central.

SELECT 
AVG(producción_hora) as "Producción media total",
AVG(c.producción_hora) as "Producción eólica"
FROM centrales_fuentes_de_electricidad c inner join eolica e on
c.codigo_central = e.codigo_central
WHERE 1<2;

--iii.Siempre que sea posible, programa los elementos necesarios para
--calcular automáticamente todos los campos que se refieren a valores
--medios o máximos.

--Siempre que queramos calcular el valor medio utilizaremos directamente la función AVG
--y siempre que queramos calcular el valor máximo utilizaremos la función MAX

--iv. Ante una alerta tipo “N” debes lanzar automáticamente una consulta
--que nos permita ver todos los datos vinculados al caso. 

CREATE OR REPLACE TRIGGER alertas_tipoN
AFTER INSERT ON alertas
FOR EACH ROW WHEN(new.tipo = 'N')
BEGIN
select alertas_vista_tipoN from practicas; 
END;




--v.Todas las centrales conectadas a una estación primaria facilitada por el
--usuario 

declare
    est_primaria number := &valor;
    central number;
begin
    select c.denominacion into central from
    centrales_fuentes_de_electricidad c inner join centrales_estaciones c1 on
    c.codigo_central = c1.codigo_central inner join estaciones_primarias e
    on c1.codigo_estacion_primaria = e.codigo_estacion_primaria
	where e.codigo_estacion_primaria = est_primaria;
    dbms_output.put_line('Las centrales conectadas a la estacion primaria ' || est_primaria || ' son: ' || central);
end;


--vi. Todas las centrales, líneas, estaciones y subestaciones que pertenezcan
--al mismo área de servicio y estén en una determinada provincia, ambas
--facilitadas por el usuario, indicando el consumo medio de dicho área
--diferenciándolo por fuente de energía 


declare
    zn_servicio varchar2(20) := &valor;
	cod_provincia varchar2 := &valor;
    central varhcar2(50);
begin
    SELECT
    denominacion 
    numero_de_red, 
    codigo_estacion_primaria, 
    codigo_subestacion, 
    AVG(c.producción_hora)
	into central from
    centrales_fuentes_de_electricidad c inner join centrales_estaciones c1 on
    c.codigo_central = c1.codigo_central inner join estaciones_primarias e
    on c1.codigo_estacion_primaria = e.codigo_estacion_primaria inner join red_de_distribucion r on 
	r.codigo_estacion_primaria = e.codigo_estacion_primaria inner join lineas l on r_numero_de_red = l.numero_de_red inner join
    subestacion s on s.numero_de_red = r.numero_de_red inner join zona_de_servicio z on z.codigo_subestacion = s.codigo_subestacion inner join provincia p on
    s.codigo_provincia = p.codigo_provincia
    where z.codigo_zona_servicio = zn_servicio and p.codigo_provincia = cod_provincia
    GROUP BY c.codigo_central;
    dbms_output.put_line('Todas las centrales, líneas, estaciones y subestaciones que pertenezcan
    al mismo área de servicio' || zn_servicio || ' y a la misma provincia' || cod_provincia ||' son: ' || central);
end;








