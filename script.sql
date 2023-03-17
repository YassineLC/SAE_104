
DROP TABLE IF EXISTS personne CASCADE;
CREATE TABLE personne (
    idPersonne int,
    nom varchar,
    prenom varchar,
    PRIMARY KEY(idPersonne)
);



DROP TABLE IF EXISTS enseignant CASCADE;
CREATE TABLE enseignant (
    idEnseignant int,
    idPersonne int,
    PRIMARY KEY(idEnseignant)
);

ALTER TABLE enseignant
    ADD CONSTRAINT fk_personne
        FOREIGN KEY(idPersonne)
            REFERENCES personne(idPersonne)
;




DROP TABLE IF EXISTS etudiant CASCADE;
CREATE TABLE etudiant (
    idEtudiant int,
    idPersonne int,
    PRIMARY KEY(idEtudiant)
);

ALTER TABLE etudiant
    ADD CONSTRAINT fk_personne_etudiant
        FOREIGN KEY(idPersonne)
            REFERENCES personne(idPersonne)
;




DROP TABLE IF EXISTS module CASCADE;
CREATE TABLE module (
    idModule int,
    idEnseignant int,
    intitule varchar,
    code varchar,
    ue varchar,
    PRIMARY KEY(idModule)
);

ALTER TABLE module
    ADD CONSTRAINT fk_enseignant
        FOREIGN KEY(idEnseignant)
            REFERENCES enseignant(idEnseignant)
;



DROP TABLE IF EXISTS evaluation CASCADE;
CREATE TABLE evaluation (
    idEvaluation int,
    idModule int,
    idEtudiant int,
    idEnseignant int,
    date varchar,
    nom varchar,
    PRIMARY KEY(idEvaluation)
);

ALTER TABLE evaluation
    ADD CONSTRAINT fk_module
        FOREIGN KEY(idModule)
            REFERENCES module(idModule)
;
ALTER TABLE evaluation
    ADD CONSTRAINT fk_etudiant
        FOREIGN KEY(idEtudiant)
            REFERENCES etudiant(idEtudiant)
;
ALTER TABLE evaluation
    ADD CONSTRAINT fk_enseignant_eval
        FOREIGN KEY(idEnseignant)
            REFERENCES enseignant(idEnseignant)
;

\copy personne FROM personne.txt;
\copy etudiant FROM etudiant.txt;
\copy enseignant FROM enseignant.txt;
\copy module FROM module.txt;
\copy evaluation FROM evaluation.txt;
