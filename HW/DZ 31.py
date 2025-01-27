# 1. Напишите декоратор validate_args, который будет проверять типы аргументов функции и выводить сообщение об ошибке, если переданы аргументы неправильного типа. Декоратор должен принимать ожидаемые типы аргументов в качестве параметров.
# Пример использования:
#
# @validate_args(int, str)
#
# def greet(age, name):
#
#     print(f"Привет, {name}! Тебе {age} лет.")
#
# greet(25, "Анна")  # Все аргументы имеют правильные типы
#
# greet("25", "Анна")  # Возникнет исключение TypeError
#
# Ожидаемый вывод:
#
# Привет, Анна! Тебе 25 лет.
#
# TypeError: Аргумент 25 имеет неправильный тип <class 'str'>. Ожидается <class 'int'>.


from typing import Callable


def validate_args(arg_1_type, arg_2_type):
    def decorator(func: Callable) -> Callable:
        def wrapper(*args, **kwargs):
            if not isinstance(args[0], arg_1_type):
                return f"TypeError: Аргумент {args[0]} имеет неправильный тип <class 'str'>. Ожидается <class 'int'>."
            if not isinstance(args[1], arg_2_type):
                return f"TypeError: Аргумент {args[1]} имеет неправильный тип <class 'int'>. Ожидается <class 'str'>."
            else:
                return func(*args, **kwargs)

        return wrapper

    return decorator


@validate_args(int, str)
def greet(age: int, name: str) -> str:
    return f"Привет, {name}! Тебе {age} лет."


print(greet(25, "Анна"))
print("-" * 100)
print(greet("25", "Анна"))
print("-" * 100)
print(greet(" ", "Анна"))
print("-" * 100)
print(greet(25, 34))
Привет, Анна! Тебе
25
лет.
----------------------------------------------------------------------------------------------------
TypeError: Аргумент
25
имеет
неправильный
тип <


class 'str'>.Ожидается < class 'int' >.


----------------------------------------------------------------------------------------------------
TypeError: Аргумент
имеет
неправильный
тип <


class 'str'>.Ожидается < class 'int' >.


----------------------------------------------------------------------------------------------------
TypeError: Аргумент
34
имеет
неправильный
тип <


class 'int'>.Ожидается < class 'str' >.
# %%
# 2. Напишите декоратор log_args, который будет записывать аргументы и результаты вызовов функции в лог-файл. Каждый вызов функции должен быть записан на новой строке в формате "Аргументы: <аргументы>, Результат: <результат>". Используйте модуль logging для записи в лог-файл.
#
# Пример использования:
#
# python
#
# @log_args
#
# def add(a, b):
#
#     return a + b
#
# add(2, 3)
#
# add(5, 7)
#
# Ожидаемый вывод в файле log.txt:
#
# Аргументы: 2, 3, Результат: 5
#
# Аргументы: 5, 7, Результат: 12
#
# Убедитесь, что перед запуском кода у вас создан файл log.txt в той же директории, где находится скрипт Python.


from typing import Callable


def log_args(func: Callable) -> Callable:
    def wrapper(*args, **kwargs):
        result = func(*args, **kwargs)
        with open("log.txt", "a", encoding="utf-8") as file:
            file.write(f"Аргументы: {args}, Результат: {result}.\n")
        return result

    return wrapper


@log_args
def add(a, b):
    return a + b


add(2, 3)
add(5, 7)
add(10, 11)
add(2, 8)
add(5, 7)