## PrimeCare-Hospital-Database
This database is designed to manage the essential information of PrimeCare Hospital, focusing on patients, doctors, appointments, and prescriptions. The database helps streamline hospital operations by providing organized data management of patient details, doctor profiles, appointment scheduling, medication records, and prescription history.

## Entities and Attributes
1. Patients
Medical Record Number (Primary Key): Unique identifier for each patient.
Full Name: Patient’s full name.
Gender: Patient’s gender.
Date of Birth: Date of birth of the patient.
Address: Residential address.
National Identification Number: Government-issued ID number.
Phone Number: Contact number for the patient.
2. Doctors
Doctor ID (Primary Key): Unique identifier for each doctor.
Full Name: Doctor’s full name.
Specialization: Medical specialties of the doctor (multiple specializations are allowed).
Phone Number: Contact number for the doctor.
Email Address: Email contact for the doctor.
3. Appointments
Appointment ID (Primary Key): Unique identifier for each appointment.
Appointment Date: Date of the appointment.
Appointment Time: Scheduled time of the appointment.
Medical Record Number (Foreign Key): Links to the patient.
Doctor ID (Foreign Key): Links to the doctor.
4. Medications
Medication Code (Primary Key): Unique identifier for each medication.
Medication Name: Name of the medication.
Description: Brief description of the medication.
Medication Category: Category or type of medication.
5. Prescriptions
Prescription Number (Primary Key): Unique identifier for each prescription.
Prescription Date: Date when the prescription was issued.
Prescription Description: Details regarding the prescribed dosage or usage.
Medical Record Number (Foreign Key): Links to the patient.
6. Prescription_Meds
Prescription Number (Foreign Key): Links to the prescription.
Medication Code (Foreign Key): Links to the medication.

## Relationships and Cardinality
- Patient (1 to Many) Appointment: Each patient may have multiple appointments, but each appointment is linked to only one patient.
- Doctor (1 to Many) Appointment: A doctor can have multiple appointments, but each appointment is associated with a single doctor.
- Patient (1 to Many) Prescription: Patients may have multiple prescriptions, but each prescription is issued for only one patient.
- Prescription (Many to Many) Medication: A prescription can include multiple medications, and a medication can be prescribed in multiple prescriptions.

## Assumptions
- Each entity (patient, doctor, appointment, etc.) has a unique identifier to avoid duplication.
- Essential details, such as full names, addresses, national ID numbers, phone numbers, and email addresses, are recorded.
- Appointment details (date and time) are standardized.
- Prescription records include date, description, and details about medication usage.
