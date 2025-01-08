import argparse


parser = argparse.ArgumentParser(description="My awesome desc")

parser.add_argument("name", help="Required user name") # positional argument
parser.add_argument("-a", "--age", type=int) # name argument
parser.add_argument("--verbose", action="store_true") # name argument


args = parser.parse_args()

print(f"Hello, {args.name}")

if args.age:
print(f"You are {args.age} years old.")
if args.verbose:
print("Detailed output")


def clean_function(a: int, b: int) -> int:
return a + b


total = 0


def dirty_function(a: int, b: int) -> int:
global total

total = a + b

with open('asd.txt') as f:
...

return total


def check_req_fields(data: dict[str, Any], req_fields: list[str]) -> bool:
return all(data.get(value) for value in req_fields)


user_data = {
"email": "test@example.com", # req
"password": "qwerty123", # req
"name": "Alice" # non req
}

req = ["email", "password"]

if check_req_fields(data=user_data, req_fields=req):
print("ALL GOOD")
else:
print("MISSED REQUIRED FIELDS")



def has_any_permission(user_roles, required_roles):
return any(role in user_roles for role in required_roles)

# Пример использования
user_current_roles = ["editor", "viewer", "moderator"]


roles_needed = ["admin", "moderator"]

if has_any_permission(user_current_roles, roles_needed):
print("У пользователя есть доступ к этой операции.")
else:
print("У пользователя НЕТ доступа.")

some_list = ["Alex", "Dan", "Anya", "Olya", "Irina", "Vladislav"]


for i in range(len(some_list)): # 0, 1, ..., len(some_list)
print(f"Index: {i}. Element by index: {some_list[i]}")

for i, elem in enumerate(some_list):
print(f"Index: {i}. Element by index: {elem}")
# letters = ["a", "b", "c"]
# numbers_ = [1, 2, 3, 4]
#
# my_zip_1 = zip(letters, numbers_)
# my_zip_2 = zip(letters)
# my_zip_3 = zip(numbers_)
#
# print(list(my_zip_1))
# print(dict(zip(letters, numbers_)))
# print(tuple(my_zip_2))
# print(set(my_zip_3))

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]

def square(x):
if x % 2 == 0:
return x ** 2
return x // 2


squared_numbers = map(square, numbers)
squared_numbers_2 = map(lambda x: x ** 2, numbers)
print(list(squared_numbers))
print(list(squared_numbers_2))


# map(cust_func, us_inp.split())

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]


def is_even(x):
return x % 2 == 0


odd_nums = list(filter(lambda elem: elem % 2 != 0, numbers))
even_nums = list(filter(is_even, numbers))

print(odd_nums)
print(even_nums)

from functools import reduce

numbers_ = [1, 2, 3, 4, 5]
numbers_3 = [2, 4, 6, 8, 10]
letters = ["h", "e", "l", "l", "o"]


def multiply_(x, y):
return x * y


def concatinate(x, y):
return x + y

res_1 = reduce(multiply_, numbers_)
res_2 = reduce(multiply_, numbers_3, 4)
res_3 = reduce(concatinate, letters)

print(res_1)
print(res_2)
print(res_3)

