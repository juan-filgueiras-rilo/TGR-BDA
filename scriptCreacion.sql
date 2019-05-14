
DROP TABLE des_mod;
DROP TABLE modulo;
DROP TABLE proxecto;
DROP TABLE desenvolvedor;

CREATE TABLE desenvolvedor (
    nss INT,
    nome VARCHAR(15) CONSTRAINT desenv_notnull_nome NOT NULL,
    salario DECIMAL(10,8) CONSTRAINT desenv_notnull_salario NOT NULL,
    telefono VARCHAR(10) CONSTRAINT desenv_notnull_telefono NOT NULL,
    direccion VARCHAR(10) CONSTRAINT desenv_notnull_direccion NOT NULL,
    CONSTRAINT desenv_pk PRIMARY KEY (nss)
);


CREATE TABLE proxecto (
    cod_pro INT,
    nome VARCHAR(15) CONSTRAINT proxecto_notnull_nome NOT NULL,
    dataIni DATE CONSTRAINT proxecto_notnull_dataini NOT NULL,
    dataFin DATE,
    xefe_nss INT,
    CONSTRAINT proxecto_pk PRIMARY KEY (cod_pro),
    CONSTRAINT proxecto_fk_xefenss FOREIGN KEY (xefe_nss) REFERENCES desenvolvedor(nss)
);

CREATE TABLE modulo (
    cod_pro INT,
    nome VARCHAR(15),
    tecnoloxia VARCHAR(15) CONSTRAINT modulo_notnull_tecnoloxia NOT NULL,
    CONSTRAINT modulo_pk PRIMARY KEY (cod_pro, nome),
    CONSTRAINT modulo_fk_cod FOREIGN KEY (cod_pro) REFERENCES proxecto(cod_pro)
);

CREATE TABLE des_mod (
    cod_pro INT,
    nome VARCHAR(15),
    nss INT,
    CONSTRAINT des_mod_pk PRIMARY KEY (cod_pro, nome, nss),
    CONSTRAINT des_mod_fk_cod_nome FOREIGN KEY (cod_pro, nome) REFERENCES modulo(cod_pro, nome),
    CONSTRAINT des_mod_fk_nss FOREIGN KEY (nss) REFERENCES desenvolvedor(nss)
);