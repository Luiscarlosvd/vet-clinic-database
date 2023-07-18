CREATE DATABASE hospital_clinic;

CREATE TABLE patients (
  id INTEGER GENERATED ALWAYS AS IDENTITY ,
  name VARCHAR(255) NOT NULL ,
  date_of_birth DATE ,
  PRIMARY KEY (id)
);

CREATE TABLE medical_histories (
  id INTEGER GENERATED ALWAYS AS IDENTITY ,
  admited_at TIMESTAMP,
  patient_id INTEGER REFERENCES patiens(id),
  status VARCHAR(255),
  PRIMARY KEY (id)
);

