DROP DATABASE IF EXISTS medical;
CREATE DATABASE medical;

\c medical

CREATE TABLE doctors(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(15) NOT NULL,
    last_name VARCHAR(15) NOT NULL,
    specialty TEXT NOT NULL,
    dob DATE NOT NULL,
    ssn VARCHAR(11) NOT NULL,
    phone_number VARCHAR(15) UNIQUE,
    email VARCHAR(64) UNIQUE,
    mail_address TEXT NOT NULL,
    hired_date DATE NOT NULL,
    termination_date DATE DEFAULT NULL
);

CREATE TABLE patients(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(15) NOT NULL,
    last_name VARCHAR(15) NOT NULL,
    dob DATE NOT NULL,
    ssn VARCHAR(11) NOT NULL,
    insurance TEXT NOT NULL,
    phone_number VARCHAR(15) UNIQUE,
    email VARCHAR(64) UNIQUE,
    mail_address TEXT NOT NULL
);

CREATE TABLE diseases(
    id SERIAL PRIMARY KEY,
    name_disease TEXT NOT NULL,
    description_disease TEXT NOT NULL
);

CREATE TABLE appointments(
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients,
    doctor_id INTEGER REFERENCES doctors,
    appointment_date TIMESTAMP NOT NULL
);

CREATE TABLE diagnoses(
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients,
    doctor_id INTEGER REFERENCES doctors,
    diagnosis_id INTEGER REFERENCES diseases,
    diagnose_date TIMESTAMP NOT NULL
);
