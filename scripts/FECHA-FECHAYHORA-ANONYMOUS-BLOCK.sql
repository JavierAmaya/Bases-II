DECLARE
  FECHA DATE;
  FECHA_HORA TIMESTAMP;
BEGIN
  FECHA := SYSDATE;
  DBMS_OUTPUT.PUT_LINE('LA FECHA ASIGNADA POR SYSDATE ES: ' || FECHA);
  
  FECHA_HORA := SYSTIMESTAMP;
  DBMS_OUTPUT.PUT_LINE('LA FECHA ASIGNADA POR SYSTIMESTAMP ES: ' || FECHA_HORA);
  
  FECHA:= TO_DATE('2018-05-12','YYYY-MM-DD');
  DBMS_OUTPUT.PUT_LINE('LA FECHA ASIGNADA POR TO_DATE ES: ' || FECHA);
  
  FECHA_HORA:= TO_TIMESTAMP('2018-05-12 11:12:12', 'YYYY-MM-DD HH:MI:SS');
  DBMS_OUTPUT.PUT_LINE('LA FECHA ASIGNADA POR TO_TIMESTAMPDATE ES: ' || FECHA_HORA);
  
  --- CAMBIAR FORMATO EN QUE SE IMPRIME LA FECHA
  DBMS_OUTPUT.PUT_LINE('USO DE TO_CHAR PARA CAMBIAR EL FORMATO DE IMPRESION DE FECHA: ' || TO_CHAR(FECHA,'DD-MM-YYYY'));
  DBMS_OUTPUT.PUT_LINE('LA FECHA ASIGNADA POR TO_TIMESTAMPDATE CON TO_CHAR: ' || TO_CHAR(FECHA_HORA,'DD-MM-YYYY HH24:MI:SS'));
  
  ---- FORMATO DE 24 HORAS
  FECHA_HORA:= TO_TIMESTAMP('2018-05-12 23:12:12', 'YYYY-MM-DD HH24:MI:SS');
  DBMS_OUTPUT.PUT_LINE('LA FECHA ASIGNADA POR TO_TIMESTAMPDATE ES: ' || FECHA_HORA);
  
  
  --- AGREGAR AM O PM AL FORMATO
  FECHA_HORA:= TO_TIMESTAMP('2018-05-12 11:12:12', 'YYYY-MM-DD HH:MI:SS AM');
  DBMS_OUTPUT.PUT_LINE('LA FECHA ASIGNADA POR TO_TIMESTAMPDATE (AGREGANDO AM) ES: ' || FECHA_HORA);
  
  --- MOSTRAR EL USUARIO QUE ESTA CONECTADO
  DBMS_OUTPUT.PUT_LINE('USUARIO CONECTADO : ' || USER);
  
END;

