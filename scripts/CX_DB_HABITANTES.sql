---SELECT * FROM TBLDEPARTAMENTOS;
--- HABILITAR SALIDA DE DATOS ESTANDAR
SET SERVEROUTPUT ON;

DECLARE
  ---NOMBRE_HABITANTE NVARCHAR2(100);
  NOMBRE TBLDEPARTAMENTOS.NOMBREDEPARTAMENTO%TYPE;
  ITERACION NUMBER(10);
  CANTIDAD_DEPARTAMENTOS NUMBER(10);
BEGIN
   SELECT COUNT(NOMBREDEPARTAMENTO) INTO CANTIDAD_DEPARTAMENTOS FROM TBLDEPARTAMENTOS;
   ITERACION:=0; 
   LOOP 
      EXIT WHEN ITERACION > CANTIDAD_DEPARTAMENTOS;
    DBMS_OUTPUT.put_line(NOMBRE);
    ITERACION:= ITERACION+1; 
   END LOOP;
   
END;
--- CONOCER LA ESTRUCTURA DE UNA TABLA
---DESC TBLDEPARTAMENTOS;