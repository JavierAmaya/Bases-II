--- CLASE 5 , SEMANA 4

---- INTRODUCCION A PROCEDIMIENTOS ALMACENADOS
--- ESTRUCTURA BASICA DE UN SP

CREATE OR REPLACE PROCEDURE <NOMBRE PROCEDIMIENTO> (<PARAMETROS>)
---DECLARE SE CAMBIA POR IS
IS
  <DECLARACION DE VARIABLES>
BEGIN
  <INSTRUCCIONES SQL>
END;
----- DECLARAR LOS PARAMETROS
<NOMBRE PARAMENTRO> IN | OUT | IN OUT <TIPO DE DATO> ---IN: SOLAMENTE SE UTILIZA PARA RECIBIR VALORES Y NO SE PUEDE MODIFICAR EN EL PROCEDIMIENTO   
----- OUT: SIGNIFICA QUE VAMOS A UTILIZAR EL PARAMENTRO PARA PODER MODIFICAR SU VALOR EN EL CUERPO DEL PROCEDIMIENTO Y PARA QUE ESE PROCEDIMIENTO PUEDA RETORNAR UN VALOR
------ IN OUT: SIGNIFICA QUE ESE PARAMETRO PUEDE RECIBIR VALORES Y PUEDEN SER MODIFICADOS EN EL CUERPO DEL PROCEDIMIENTO Y ESE MISMO VALOR MODIFICADO SE PUEDE RETORNAR AL  BLOQUE QUE LLAMO AL PROCEDIMIENTO
--- POR DEFECTO TODOS LOS PARAMETROS SON DE TIPO IN
EJEMPLO
NOMBRE VARCHAR2 --- CUANDO CREAMOS UNA DE ESTAS VARIABLES DE TIPO VARCHAR2 SI ESTAMOS EN UN SP NO SE INDICA EL RANGO O LA CANTIDAD DE DATOS QUE TIENE PERMITIDO  EJM: NVARCHAR(200)


----- EJERCICIO PRACTICA

--- CREAR UN SP (STORED PROCEDURE) OBTENER EL NOMBRE DE LAS CATEGORIAS E IMPRIMIR ESOS VALORES OBTENIDOS, ESE NOMBRE SE VA OBTENER EN BASE A UNA CONDICION, LA CATEGORIA =2 ;


CREATE OR REPLACE PROCEDURE SP_OBTENER_NOMBRE_CAT (IDCAT IN NUMBER)
IS
  NOMBRE_CAT CATEGORIES.CATEGORY_NAME%TYPE;

BEGIN
  
  SELECT CATEGORIES.CATEGORY_NAME INTO NOMBRE_CAT FROM CATEGORIES WHERE CATEGORIES.CATEGORY_ID = IDCAT;
  DBMS_OUTPUT.PUT_LINE('NOMBRE DE LA CATEGORIA: ' || NOMBRE_CAT);  
END;
----FORMA 1 DE EJECUTAR UN SP
EXECUTE SP_OBTENER_NOMBRE_CAT (2);

---- FORMA 2 DE EJECUTAR UN SP
BEGIN
  SP_OBTENER_NOMBRE_CAT (2);
END;



----- CREANDO UN SP QUE RETORNE UN VALOR A UN BLOQUE ANONIMO

CREATE OR REPLACE PROCEDURE SP_OBTENER_NOMBRE_CAT (IDCAT IN NUMBER, NOMBRE_CAT OUT CATEGORIES.CATEGORY_NAME%TYPE)
IS

BEGIN
  
  SELECT CATEGORIES.CATEGORY_NAME INTO NOMBRE_CAT FROM CATEGORIES WHERE CATEGORIES.CATEGORY_ID = IDCAT;
  
END;

---- BLOQUE ANONIMO

DECLARE 
  NOMBRE_CATEGORIA CATEGORIES.CATEGORY_NAME%TYPE;
  
BEGIN
  
  SP_OBTENER_NOMBRE_CAT (2,NOMBRE_CATEGORIA);
  DBMS_OUTPUT.put_line('EL NOMBRE DE LA CATEGORIA ES: ' || NOMBRE_CATEGORIA);
END;


-- USANDO IN OUT


CREATE OR REPLACE PROCEDURE SP_OBTENER_NOMBRE_CAT (IDCAT IN NUMBER, NOMBRE_CAT IN OUT CATEGORIES.CATEGORY_NAME%TYPE)
IS

BEGIN
  
  SELECT CATEGORIES.CATEGORY_NAME INTO NOMBRE_CAT FROM CATEGORIES WHERE CATEGORIES.CATEGORY_ID = IDCAT;
  
END;

---- BLOQUE ANONIMO

DECLARE 
  NOMBRE_CATEGORIA CATEGORIES.CATEGORY_NAME%TYPE:='valor antes de llamar al sp';
  
BEGIN
  DBMS_OUTPUT.put_line('EL NOMBRE DE LA CATEGORIA ES: ' || NOMBRE_CATEGORIA);
  SP_OBTENER_NOMBRE_CAT (2,NOMBRE_CATEGORIA);
  DBMS_OUTPUT.put_line('EL NOMBRE DE LA CATEGORIA ES: ' || NOMBRE_CATEGORIA);
END;