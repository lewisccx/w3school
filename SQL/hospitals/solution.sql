# Q1
select * from nurse where registered = false;


# Q2
select name as Name, position as Position from nurse where position = 'Head Nurse'


# Q3
select d.name as Department, p.name as Physician 
from physician p join department d on  p.employeeid = d.head 

# Q4
SELECT count(DISTINCT patient) AS "No. of patients taken at least one appointment"
FROM appointment;

# Q5
SELECT blockfloor as "Floor", blockcode as "Block" from room where roomnumber = 212

# Q6
select count(*) as "Number of available rooms" from room where unavailable = false

# Q7
select count(*) as "Number of unavailable rooms" from room where unavailable = true

# Q8
select p.name as Physician, d.name as Department
from physician p, department d, affiliated_with aw 
where p.employeeid = aw.physician and d.departmentid = aw.department 

# Q9
select phy.name as Physician, pro.name as Treatment
from physician phy, procedure pro, trained_in ti
where phy.employeeid = ti.physician and pro.code = ti.treatment

# Q10
select p.name as Physician, p.position, d.name as Department
from physician p, department d, affiliated_with aw 
where p.employeeid = aw.physician and d.departmentid = aw.department
and aw.primaryaffiliation = false

# Q11
SELECT p.name AS "Physician",
       p.position "Designation"
FROM physician p
LEFT JOIN trained_in t ON p.employeeid=t.physician
WHERE t.treatment IS NULL
ORDER BY employeeid;

# Q12
select pa.name as Patient, pa.address, phy.name as Physician
from  physician phy  join patient pa on pa.pcp = phy.employeeid

# Q13
select pa.name as Patient, count(appt.patient) as "Appointment for No. of Physicians" from 
patient pa join appointment appt on pa.ssn = appt.patient group by pa.name

# Q14
select count(DISTINCT patient) as "No. of patients got appointment for room C" 
from appointment
where examinationroom = 'C'

# Q15
select pa.name as Patient, appt.examinationroom as "Room No." , appt.start_dt_time as "Date and Time of appointment"
from appointment appt join patient pa on pa.ssn = appt.patient

# Q16
select n.name as "Name of the Nurse", appt.examinationroom as "Room No."
from nurse n join appointment appt on n.employeeid = appt.prepnurse

# Q17
SELECT t.name AS "Name of the patient",
       n.name AS "Name of the Nurse assisting the physician",
       p.name AS "Name of the physician",
       a.examinationroom AS "Room No.",
       a.start_dt_time
FROM patient t
JOIN appointment a ON a.patient=t.ssn
JOIN nurse n ON a.prepnurse=n.employeeid
JOIN physician p ON a.physician=p.employeeid
WHERE start_dt_time='2008-04-25 10:00:00';