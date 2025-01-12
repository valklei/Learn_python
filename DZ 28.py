


# Напишите программу, которая принимает список слов от пользователя и использует
# генераторное выражение (comprehension) для создания нового списка,
# содержащего только те слова, которые начинаются с гласной буквы.
# Затем программа должна использовать функцию map, чтобы преобразовать каждое слово
# в верхний регистр. В результате программа должна вывести новый список,
# содержащий только слова, начинающиеся с гласной буквы и записанные в верхнем регистре.


def get_user_input():
    while True:

        user_input = input("Введите список слов, разделенных пробелами: ")

        if not user_input.strip():
            print("Ошибка: Ввод не должен быть пустым. Пожалуйста, попробуйте снова.")
            continue

        words = user_input.split()

        if all(word.isalpha() for word in words):
            return words
        else:
            print("Ошибка: Ввод должен содержать только слова, разделенные пробелами. Пожалуйста, попробуйте снова.")


def processing_words(words):
    vowels = 'aeiouAEIOU'
    f_words = [word for word in words if word[0] in vowels]

    upp_words = list(map(str.upper, f_words))

    return upp_words


list_words = get_user_input()
print(processing_words(list_words))

# Напишите программу, которая принимает список чисел от пользователя и использует
# функцию reduce из модуля functools, чтобы найти произведение всех чисел в списке.
# Затем программа должна использовать функцию itertools.accumulate для накопления
# произведений чисел в новом списке.
# В результате программа должна вывести список, содержащий накопленные произведения.



import itertools
import operator
from functools import reduce


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


def mult_list(data: list):
    result = reduce(lambda x, y: x * y, data)
    return result


def mult_acc(data: list):
    result = list(itertools.accumulate(data, operator.mul))
    return result

numbers = input_integer_list()
print("Вы ввели следующий список целых чисел:", numbers)
print('Результат reduce:', mult_list(numbers))
print('Результат accumulate:', mult_acc(numbers))
