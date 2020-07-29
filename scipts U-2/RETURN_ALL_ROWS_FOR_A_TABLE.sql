--- CREAR UNA FUNCION QUE RETORNE TODAS LAS CATEGORIAS DE UNA SOLA TABLA

CREATE OR REPLACE FUNCTION FN_INF_CATEGORIAS
RETURN SYS_REFCURSOR
IS
  CDATOS SYS_REFCURSOR;
BEGIN
  OPEN CDATOS FOR SELECT CATEGORY_ID, CATEGORY_NAME FROM CATEGORIES WHERE CATEGORY_ID > 3;
  
  RETURN CDATOS;
END;

--- PROBANDO
DECLARE
  DATOS_CATEGORIA SYS_REFCURSOR;
  REGISTRO CATEGORIES%ROWTYPE;
BEGIN
  DATOS_CATEGORIA := FN_INF_CATEGORIAS;
  
  LOOP 
    FETCH DATOS_CATEGORIA INTO REGISTRO;
    
    EXIT WHEN DATOS_CATEGORIA%NOTFOUND;
    
    DBMS_OUTPUT.PUT_LINE('ID: ' || REGISTRO.CATEGORY_ID ||' ,' ||'NOMBRE DE LA CATEGORIA: '|| REGISTRO.CATEGORY_NAME);
  END LOOP;

END;