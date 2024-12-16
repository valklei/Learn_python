use 160924_Valklei;
create table students
 (id int primary key auto_increment, 
  `name` varchar (128) not null,
  age int);
  
 create table teachers
 (id int primary key auto_increment, 
  `name` varchar (128) not null,
  age int); 
  
create table competencies
 (id int primary key auto_increment, 
  title varchar (128) not null);
  
create table teachers_competencies
 (id int primary key auto_increment, 
  teacher_id int,
  competencies_id int); 
  
create table courses
 (id int primary key auto_increment, 
  teacher_id int,
  title varchar (128) not null,
  headman_id int); 
  
create table students_courses
 (id int primary key auto_increment, 
  student_id int,
  course_id int);
  
# Петр 39 Максим 35 Антон 37 Всеволод 38 Егор 41 Светлана 32
insert into students
	 values('Анатолий', 29), 
			('Олег', 25),
			('Семен', 27),
			('Олеся', 28),
			('Ольга', 31),
			('Иван', 22);
     
  insert into teachers
	 values('Петр', 39), 
			('Максим', 35),
			('Антон', 37),
			('Всеволод', 38),
			('Егор', 41),
			('Светлана', 32);
            
            # Математика Информатика Программирование Графика
 insert into competencies
	 values('Математика'), 
			('Информатика'),
			('Программирование'),
			('Графика');
            
	# 1 1 2 1 2 3 3 2 4 1 5 3
			 
  insert into teachers_competencies
	 values(1, 1), 
			(2, 1),
			(2, 3),
			(3,2),
			(4, 1),
            (5, 3);
            
         # 1 Алгебра логики 2 2 Математическая статистика 3 4 Высшая математика 5 5 Javascript 1 5 Базовый Python 1  
  insert into courses
	 values(1, 'Алгебра логики', 2), 
			(2, 'Математическая статистика', 3),
			(4, 'Высшая математика', 5),
			(5, 'Javascript', 1),
			(5, 'Базовый Python', 1);
			
        #    1 1 2 1 3 2 3 3 4 5
  
  insert into students_courses
	 values(1, 1), 
			(2, 1),
			(3, 2),
			(3,2),
			(3, 3),
            (4, 5);


 
			