# 1. Напишите функцию, которая принимает на вход список чисел и возвращает сумму
# квадратов только четных чисел из списка, используя функциональные подходы
# (например, map, filter и reduce).
# Пример вывода:
# Введите числа: 4, 6, 3, 4, 2, 3, 9, 0, 7
# Результат: 72

def input_integer_list():
    while True:
        try:
            # Запрашиваем у пользователя ввод списка чисел
            user_input = input("Введите список целых чисел, разделенных пробелами: ")

            # Разбиваем ввод на отдельные строки и пытаемся преобразовать их в целые числа
            integer_list = [int(num) for num in user_input.split()]

            # Если преобразование прошло успешно, возвращаем список целых чисел
            return integer_list
        except ValueError:
            # Если возникла ошибка преобразования, выводим сообщение об ошибке и продолжаем запрашивать ввод
            print("Ошибка: Введенные данные не являются целыми числами. Пожалуйста, попробуйте снова.")


def sum_squares_even(data: list):
    result = reduce(lambda x, y: x + y, filter(lambda x: x % 2 == 0, map(lambda x: x ** 2, data)))
    return result


numbers = input_integer_list()
print("Вы ввели следующий список целых чисел:", numbers)
print('Результат:', sum_squares_even(numbers))

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

print(compose_functions(functions, user_num))

reduce_func = reduce(lambda acc, func: func(acc), functions, user_num)
print(reduce_func)


