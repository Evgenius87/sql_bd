-- Знайти 5 студентів із найбільшим середнім балом з усіх предметів.
SELECT s.fullname ROUND(AVG(g.grade), 2) AS average_grade
FROM grades g 
JOIN students s ON s.id  = g.student_id 
GROUP BY s.fullname 
ORDER BY average_grade 
LIMIT 5;

-- Знайти студента із найвищим середнім балом з певного предмета.
SELECT d.name, s.fullname, ROUND(AVG(g.grade)  ,2) AS average_grade  
FROM grades g 
JOIN students s  ON s.id = g.student_id 
JOIN disciplines d ON d.id  = g.discipline_id 
WHERE d.id = 5
GROUP BY s.fullname 
ORDER BY average_grade DESC 
LIMIT 1;

-- Знайти середній бал у групах з певного предмета.
SELECT d.name, gr.name , ROUND(AVG(g.grade)  ,2) AS average_grade  
FROM grades g 
JOIN students s  ON s.id = g.student_id 
JOIN disciplines d ON d.id  = g.discipline_id 
JOIN [groups] gr ON gr.id  = s.group_id  
WHERE d.id = 5
GROUP BY gr.name
ORDER BY average_grade DESC 
;

-- Знайти середній бал на потоці (по всій таблиці оцінок).
SELECT ROUND(AVG(g.grade) , 2) AS average_grade 
FROM grades g ;
 
--Знайти які курси читає певний викладач.
SELECT d.name AS disciplines, t.fullname 
FROM disciplines d 
JOIN teachers t ON t.id = d.teacher_id 
GROUP  BY d.name 
;

--Знайти список студентів у певній групі.
SELECT s.fullname 
FROM students s
JOIN [groups] g  ON g.id = s.group_id 
WHERE g.id = 2
--GROUP BY s.fullname 
--ORDER  BY g.name 
;

--Знайти оцінки студентів у окремій групі з певного предмета.
SELECT g.date_of, g.grade , s.fullname , gr.name AS [group]
FROM grades g 
JOIN students s ON s.id  = g.student_id  
JOIN [groups] gr ON gr.id  = s.group_id 
JOIN disciplines d  on d.id  = g.discipline_id 
WHERE gr.id  = 1 AND  d.id  = 1
ORDER BY g.date_of 
;

-- Знайти середній бал, який ставить певний викладач зі своїх предметів.
SELECT t.fullname, d.name,  ROUND(AVG(g.grade), 2) AS average_grade
FROM grades g 
JOIN disciplines d  ON d.id  = g.discipline_id 
JOIN teachers t ON t.id  = d.teacher_id 
GROUP BY d.name 
ORDER BY t.fullname  
;

--Знайти список курсів, які відвідує студент.
SELECT d.name 
FROM grades g 
JOIN disciplines d  ON d.id = g.discipline_id 
JOIN students s  ON s.id  = g.student_id 
WHERE s.id = 10
GROUP BY d.name
;

--Список курсів, які певному студенту читає певний викладач.
SELECT d.name 
FROM grades g 
JOIN teachers t ON t.id = d.teacher_id 
JOIN disciplines d  ON d.id = g.discipline_id 
JOIN students s  ON s.id  = g.student_id 
WHERE s.id = 30 AND t.id = 2
GROUP BY d.name
;

--Середній бал, який певний викладач ставить певному студентові
SELECT t.fullname AS teacher, s.fullname  , AVG(g.grade) AS average_grade
FROM grades g
JOIN disciplines d ON g.discipline_id = d.id 
JOIN teachers t ON d.teacher_id = t.id 
JOIN students s ON g.student_id = s.id 
WHERE student_id = 30 AND teacher_id = 1
;

--Оцінки студентів у певній групі з певного предмета на останньому занятті.
SELECT s.fullname AS students, MAX(g.date_of) AS last_lesson , g.grade  
FROM grades g 
JOIN students s ON s.id = g.student_id 
JOIN groups gr ON s.group_id = gr.id 
JOIN disciplines d ON d.id = g.discipline_id 
WHERE gr.id = 1 AND d.id = 3
GROUP BY s.fullname 
ORDER BY last_lesson
;

