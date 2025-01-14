# 1. Создайте класс Rectangle для представления прямоугольника.
# Класс должен иметь атрибуты width (ширина) и height (высота),
# а также метод calculate_area(), который вычисляет площадь прямоугольника.
# Затем создайте экземпляр класса Rectangle с заданными значениями ширины и высоты
# и выведите его площадь.

class Rectangle:
    def __init__(self, width: float, high: float):
        self.width = width
        self.high = high
    def calculate_area(self):
        return self.width * self.high


rect_1 = Rectangle(5.7, 3.2)
rect_2 = Rectangle(10.8, 7.4)

print(f"Прямоугольник со сторонами: {rect_1.width}, {rect_1.high} имеет площадь:{rect_1.calculate_area():.2f}")
print(f"Прямоугольник со сторонами: {rect_2.width}, {rect_2.high} имеет площадь:{rect_2.calculate_area():.2f}")


# 2. Создайте класс Student для представления студента.
# Класс должен иметь атрибуты name (имя) и age (возраст),
# а также метод display_info(), который выводит информацию о студенте.
# Затем создайте экземпляр класса Student с заданным именем и возрастом
# и вызовите метод display_info().

class Student:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def display_info(self):
        return f"Student: {self.name}, Age: {self.age}"


dmitry = Student('Dmitry', 25)

print(dmitry.display_info())
