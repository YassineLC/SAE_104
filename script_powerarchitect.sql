CREATE TABLE Personne (
                idPersonne INTEGER NOT NULL,
                nom VARCHAR NOT NULL,
                prenom VARCHAR NOT NULL,
                CONSTRAINT idpersonne PRIMARY KEY (idPersonne)
);


CREATE TABLE Etudiant (
                idEtudiant INTEGER NOT NULL,
                idPersonne INTEGER NOT NULL,
                CONSTRAINT idetudiant PRIMARY KEY (idEtudiant, idPersonne)
);


CREATE TABLE Enseignant (
                idEnseignant INTEGER NOT NULL,
                idPersonne INTEGER NOT NULL,
                CONSTRAINT idenseignant PRIMARY KEY (idEnseignant, idPersonne)
);


CREATE TABLE Module (
                idModule INTEGER NOT NULL,
                idEnseignant INTEGER NOT NULL,
                intitule VARCHAR NOT NULL,
                code INTEGER NOT NULL,
                UE VARCHAR NOT NULL,
                CONSTRAINT idmodule PRIMARY KEY (idModule, idEnseignant)
);


CREATE TABLE Evaluation (
                idEvaluation INTEGER NOT NULL,
                idModule INTEGER NOT NULL,
                idEtudiant INTEGER NOT NULL,
                idEnseignant INTEGER NOT NULL,
                date VARCHAR NOT NULL,
                nom VARCHAR NOT NULL,
                CONSTRAINT idevaluation PRIMARY KEY (idEvaluation, idModule, idEtudiant, idEnseignant)
);


ALTER TABLE Etudiant ADD CONSTRAINT personne_etudiant_fk
FOREIGN KEY (idPersonne)
REFERENCES Personne (idPersonne)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Enseignant ADD CONSTRAINT personne_enseignant_fk
FOREIGN KEY (idPersonne)
REFERENCES Personne (idPersonne)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Evaluation ADD CONSTRAINT etudiant_evaluation_fk
FOREIGN KEY (idEtudiant)
REFERENCES Etudiant (idEtudiant)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Module ADD CONSTRAINT enseignant_module_fk
FOREIGN KEY (idEnseignant)
REFERENCES Enseignant (idEnseignant)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Evaluation ADD CONSTRAINT enseignant_evaluation_fk
FOREIGN KEY (idEnseignant)
REFERENCES Enseignant (idEnseignant)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Evaluation ADD CONSTRAINT module_evaluation_fk
FOREIGN KEY (idModule)
REFERENCES Module (idModule)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;