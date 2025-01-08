# 1. Напишите функцию, которая принимает на вход список чисел и возвращает сумму
# квадратов только четных чисел из списка, используя функциональные подходы
# (например, map, filter и reduce).
# Пример вывода:
# Введите числа: 4, 6, 3, 4, 2, 3, 9, 0, 7
# Результат: 72

list_numbers = [4, 6, 3, 4, 2, 3, 9, 0, 7]

def square(number: int) -> int:
    if number % 2 == 0:
        return number ** 2
    return 0

squared_numbers = sum(list(map(square, list_numbers)))
print(squared_numbers)

filter_numbers = list(filter(lambda x: x % 2 == 0, list_numbers))
squared_numbers_1 = sum(list(map(square, filter_numbers)))
print(squared_numbers_1)

# 2. Напишите функцию, которая принимает на вход список функций и значение, а затем
# применяет композицию этих функций к значению, возвращая конечный результат.
# Пример использования:
# add_one = lambda x: x + 1
# double = lambda x: x * 2
# subtract_three = lambda x: x - 3
# functions = [add_one, double, subtract_three]
# compose_functions(functions, 5) должно вывести 9
from functools import reduce

add_one = lambda x: x + 1
double = lambda x: x * 2
subtract_three = lambda x: x - 3
functions = [add_one, double, subtract_three]
user_num = 5

def compose_functions(functions: list, num):
    for function in functions:
        num = function(num)
    return num

print(compose_functions(functions, user_num))

reduce_func = reduce(lambda acc, func: func(acc), functions, user_num)
print(reduce_func)