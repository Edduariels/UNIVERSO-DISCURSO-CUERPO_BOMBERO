--Autor:Eddu Ariel Saldarriaga Carrillo
--Materia:Gestion de Base de Datos 5 "A"
--Docente: Robert Moreira
--Tema:Univero Discurso Cuerpo De Bomberos
--Fecha:20/11/2022
--LENGUAJE PROCEDIMENTAL PLSQL ORACLE
 
 
 
 set serveroutput on;
 --CURSOR
    DECLARE 
      CURSOR C_CURSOR IS SELECT NOMBRES, 
      COUNT(C.FK_IDBOMBERO)CURSOS ,sum(A.CANTIDADASIGNADA) RECURSOS,
       EXTRACT (YEAR FROM FECHACURSO) FECHACURSOS, EXTRACT (YEAR FROM FECHAASIGNADA) FECHAASIGNADAS
      FROM LINE_ASIGNACIONES_CURSOS L
        INNER JOIN BOMBERO B  ON B.IDBOMBERO = L.FK_IDBOMBERO
        INNER JOIN ASIGNACION A  ON A.IDASIGNACION = L.FK_IDASIGNACION
        INNER JOIN CURSOS C  ON C.IDCURSOS = L.FK_IDCURSOS
          WHERE EXTRACT (YEAR FROM FECHACURSO  )= 2020 OR EXTRACT (YEAR FROM FECHAASIGNADA  )= 2020
        GROUP BY NOMBRES,FECHACURSO,FECHAASIGNADA,CANTIDADASIGNADA;
          SUMARECURSOS INT;
          SUMACURSOS INT;
        BEGIN
        SUMARECURSOS := 0;
        SUMACURSOS := 0;
        FOR DATOS IN C_CURSOR
            LOOP 
        dbms_output.put_line( 'Nombres: '  || DATOS.nombres || '|Recursos Asignados: ' ||DATOS.RECURSOS ||' |FECHA RECURSOS: ' || DATOS.FECHAASIGNADAS       
        || ' |Cursos Realizados '|| DATOS.CURSOS  || ' |FECHA CURSO: ' || DATOS.FECHACURSOS);
                 SUMARECURSOS :=SUMARECURSOS+DATOS.RECURSOS;
                SUMACURSOS :=SUMACURSOS+DATOS.CURSOS;
            END LOOP;   
            dbms_output.put_line(' SUMA TOTAL DE RECURSOS: '  || SUMARECURSOS);
            dbms_output.put_line(' SUMA TOTAL DE CURSOS: '  || SUMACURSOS);
        END;
     