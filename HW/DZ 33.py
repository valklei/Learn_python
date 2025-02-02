# 1. Реализуйте класс Employee, представляющий сотрудника компании.
# Класс должен иметь статическое поле company с названием компании, а также методы:
# ● set_company(cls, name): метод класса для изменения названия компании
# ● __init__(self, name, position): конструктор, принимающий имя и должность сотрудника
# ● get_info(self): метод, возвращающ

class Employee:
    company = 'Google'

    @classmethod
    def set_company(cls, new_comp_name):
        cls.company = new_comp_name

    def __init__(self, name, position):
        self.name = name
        self.position = position

    def get_info(self):
        return f"Name: {self.name}\nPosition: {self.position}\nCompany: {self.company}"


employee = Employee('John', 'CEO')
employee1 = Employee('Alex', 'Software Engineer')
print(employee.get_info())
print("*" * 50)
print(employee1.get_info())
print("*" * 50)

Employee.set_company("Apple")

print(employee.get_info())
print("*" * 50)
print(employee1.get_info())


# 2. Реализуйте абстрактный базовый класс Shape (фигура),
# а от него унаследуйте классы Rectangle (прямоугольник)
# и Circle (круг).
# Класс Shape должен иметь абстрактный метод area,
# который должен быть реализован в каждом дочернем классе.
# Классы Rectangle и Circle также должны иметь метод perimeter для расчета периметра.
# Выведите площадь и периметр прямоугольника и круга на экран.



from abc import ABC, abstractmethod


class Shape(ABC):
    @abstractmethod
    def area(self):
        pass

    @abstractmethod
    def perimeter(self):
        pass

    def get_figure_info(self):
        return f"Figure {self.__class__.__name__} with Area {self.area():.2f} and Perimeter {self.perimeter():.2f}"

class Triangle(Shape):
    def __init__(self, side_a, side_b, side_c):
        self.side_a = side_a
        self.side_b = side_b
        self.side_c = side_c

    def area(self):
        per = (self.side_a + self.side_b + self.side_c) / 2
        return (per * (per -self.side_a) * (per -self.side_b) * (per -self.side_c)) ** 0.5

    def perimeter(self):
        return self.side_a + self.side_b + self.side_c



class Rectangle(Shape):
    def __init__(self, width, height):
        self.width = width
        self.height = height

    def area(self):
        return self.width * self.height

    def perimeter(self):
        return (self.width + self.height) * 2


class Circle(Shape):
    def __init__(self, radius):
        self.radius = radius

    def area(self):
        return 3.14 * self.radius ** 2

    def perimeter(self):
        return 2 * 3.14 * self.radius


shapes = [Triangle(5, 7, 11), Rectangle(5, 10), Circle(3)]
for shape in shapes:
     print(shape.get_figure_info())

