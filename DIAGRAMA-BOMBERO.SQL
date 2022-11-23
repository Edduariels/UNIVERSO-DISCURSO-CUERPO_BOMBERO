--Autor:Eddu Ariel Saldarriaga Carrillo
--Materia:Gestion de Base de Datos 5 "A"
--Docente: Robert Moreira
--Tema:Univero Discurso Cuerpo De Bomberos
--Fecha:20/11/2022
--LENGUAJE PROCEDIMENTAL PLSQL ORACLE



--DIAGRAMA     
SELECT INCIDENTE, COUNT(LUGAR), LUGAR
    FROM JORNADA J
    INNER JOIN MISIONES M ON M.IDMISIONES = J.FK_IDMISIONES
    INNER JOIN BOMBERO B  ON B.IDBOMBERO = J.FK_IDBOMBERO
    GROUP BY INCIDENTE,LUGAR