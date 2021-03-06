---- CREAR UNA FUNCION QUE OBTENGA LOS CAMPOS NOMBRE DE TIENDA, TELEFONO, CORREO, Y CALLE DE LA TABLA STORES, Y ESTO SE VA RETORNAR EN BASE AL ID_TIENDA

CREATE OR REPLACE FUNCTION FN_DATOS_TIENDA (ID_TIENDA STORES.STORE_ID%TYPE, TELEFONO OUT STORES.PHONE%TYPE, CORREO OUT STORES.EMAIL%TYPE, DIRECCION OUT STORES.STREET%TYPE)
RETURN VARCHAR2 
IS 
  
  NOMBRE_TIENDA STORES.STORE_NAME%TYPE;
BEGIN 
  SELECT 
    STORE_NAME,
    PHONE,
    EMAIL,
    STREET
  INTO NOMBRE_TIENDA, TELEFONO, CORREO, DIRECCION
  FROM STORES
  WHERE STORE_ID = ID_TIENDA;

  RETURN NOMBRE_TIENDA;
END;

---- PROBANDO
DECLARE
 NOMBRE_TIENDA STORES.STORE_NAME%TYPE; 
 TELEFONO STORES.PHONE%TYPE;
 CORREO STORES.EMAIL%TYPE;
 DIRECCION STORES.STREET%TYPE;
BEGIN 
  
  NOMBRE_TIENDA:= FN_DATOS_TIENDA(2,TELEFONO, CORREO, DIRECCION);
  DBMS_OUTPUT.PUT_LINE('NOMBRE TIENDA: '||NOMBRE_TIENDA||' ,TELEFONO: '||TELEFONO ||', CORREO: '|| CORREO ||', DIRECCION: '|| DIRECCION);
END;



------ RETORNAR UN REGISTRO COMPLETO

CREATE OR REPLACE FUNCTION FN_DATOS_REG_TIENDA (ID_TIENDA STORES.STORE_ID%TYPE)
RETURN STORES%ROWTYPE
IS 
  REGISTRO STORES%ROWTYPE;
BEGIN 
  SELECT * INTO REGISTRO FROM STORES WHERE STORE_ID = ID_TIENDA;

  RETURN REGISTRO;
END;

----- PROBANDO
DECLARE
 REG STORES%ROWTYPE;
BEGIN 
  
  REG:= FN_DATOS_REG_TIENDA(2);
  DBMS_OUTPUT.PUT_LINE('NOMBRE TIENDA: '||REG.STORE_NAME||' ,TELEFONO: '||REG.PHONE ||', CORREO: '|| REG.EMAIL ||', DIRECCION: '|| REG.STREET);
END;
