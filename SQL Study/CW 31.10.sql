#1. Выведите список студентов с курсом, на который каждый записан (результат содержит имя
#студента - name и course_id).
#2. Изменить предыдущий запрос так, чтобы вместо course_id выводилось название курса.
#3. Выведите список студентов, который не записаны на какой-либо курс.
#4. Выведите список преподавателей с компетенциями (имя преподавателя, competencies_id)
#5. Измените предыдущий запрос так, чтобы вместо competencies_id было название компетенции.
#6. Убедитесь, что в таблице teachers нет преподавателей без компетенций. 


#1. Выведите список студентов с курсом, на который каждый записан (результат содержит имя
#студента - name и course_id).

SELECT name, course_id 
FROM students.Students 
INNER join students.Students2Courses
on Students.id = Students2Courses.student_id;

#2. Изменить предыдущий запрос так, чтобы вместо course_id выводилось название курса.

SELECT name, title
FROM students.Students 
INNER join students.Students2Courses
on Students.id = Students2Courses.student_id
INNER join students.Courses
on students.Students2Courses.course_id = students.Courses.id;

#3. Выведите список студентов, который не записаны на какой-либо курс.


SELECT name, student_id, course_id
FROM students.Students 
left join students.Students2Courses
on Students.id = Students2Courses.student_id 
where student_id is NULL;

#4. Выведите список преподавателей с компетенциями (имя преподавателя, competencies_id)
use students;
SELECT teacher_id, name, competencies_id, title
from Teachers2Competencies
inner join Teachers
on Teachers.id = Teachers2Competencies.teacher_id
inner join Competencies
on Teachers2Competencies.competencies_id = Competencies.id;

#6. Убедитесь, что в таблице teachers нет преподавателей без компетенций. 

select * from Teachers2Competencies
right join Teachers 
on Teachers2Competencies.teacher_id = Teachers.id
where competencies_id is null;
