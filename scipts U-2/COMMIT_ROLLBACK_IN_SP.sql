CREATE OR REPLACE PROCEDURE SP_VALORES_REG_STAFF (ID_STAFF NUMBER, PRIM_NOMBRE VARCHAR2, APELLIDO VARCHAR2 , CORREO VARCHAR2, TELEFONO VARCHAR2, REG_ACTIVO NUMBER, ID_STORE NUMBER, ID_MANAGER NUMBER)

IS
  MSJ NUMBER;
BEGIN 
    SP_INSERT_STAFFS(ID_STAFF, PRIM_NOMBRE, APELLIDO , CORREO, TELEFONO, REG_ACTIVO, ID_STORE, ID_MANAGER,MSJ);
    ---- INSERT INTO BITACORAS (...)
    IF(MSJ=1) THEN
        COMMIT;
    ELSIF (MSJ=0) THEN
      ROLLBACK;
    END IF;
END;



CREATE OR REPLACE PROCEDURE SP_INSERT_STAFFS(ID_STAFF NUMBER, PRIM_NOMBRE VARCHAR2, APELLIDO VARCHAR2 , CORREO VARCHAR2, TELEFONO VARCHAR2, REG_ACTIVO NUMBER, ID_STORE NUMBER, ID_MANAGER NUMBER, MSJ OUT NUMBER)

IS 

BEGIN 
  
    INSERT INTO STAFFS VALUES (ID_STAFF, PRIM_NOMBRE, APELLIDO , CORREO, TELEFONO , REG_ACTIVO , ID_STORE, ID_MANAGER);
    MSJ:=1;
    
    EXCEPTION 
      WHEN OTHERS THEN
        MSJ:=0;
END;