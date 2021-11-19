-- RESET INFO borrando las tablas
DROP TABLE IF EXISTS Zapatos;
DROP TABLE IF EXISTS Colors;

-- DEFINICION DE LAS SECUENCIAS
CREATE SEQUENCE IF NOT EXISTS sec_zapatos
  start with 1
  increment by 1
  maxvalue 99999
  minvalue 1
;
CREATE SEQUENCE IF NOT EXISTS sec_colors
  start with 1
  increment by 1
  maxvalue 99999
  minvalue 1
;

-- REINICIO DE LAS SECUENCIAS
ALTER SEQUENCE sec_zapatos RESTART WITH 1;
ALTER SEQUENCE sec_colors RESTART WITH 1;

-- CREACION DE TABLAS
CREATE TABLE Zapatos (
	idZapato SERIAL PRIMARY KEY,
	description VARCHAR,
	idColor INT
);
CREATE TABLE Colors (
	idColor SERIAL PRIMARY KEY,
	description VARCHAR
);

-- AGREGAR RELACION DE TABLAS (FK)
ALTER TABLE Zapatos ADD CONSTRAINT zapatos_colors_fk
    FOREIGN KEY (idColor)
    REFERENCES Colors (idColor);

-- SEED
INSERT INTO Colors VALUES(nextval('sec_colors'), 'blanco');
INSERT INTO Colors VALUES(nextval('sec_colors'), 'negro');

INSERT INTO Zapatos VALUES(nextval('sec_zapatos'), 'AD-301', 1);
INSERT INTO Zapatos VALUES(nextval('sec_zapatos'), 'AD-302', 1);
INSERT INTO Zapatos VALUES(nextval('sec_zapatos'), 'AD-303', 2);

-- QUERYES
SELECT * FROM zapatos;
SELECT * FROM colors;

-- EJEMPLO DE JOIN BASICO
SELECT zapatos.description, colors.description FROM zapatos 
	INNER JOIN colors 
	ON zapatos.idColor = colors.idColor;

-- EJEMPLO DE JOIN BASICO CON ALIAS
SELECT Z.description, C.description FROM zapatos AS Z
	INNER JOIN colors as C
	ON Z.idColor = C.idColor;

