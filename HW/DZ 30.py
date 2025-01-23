# 1. Создайте класс Rectangle для представления прямоугольника.
# Класс должен иметь атрибуты width (ширина) и height (высота)
# со значениями по умолчанию, а также методы calculate_area()
# для вычисления площади прямоугольника и calculate_perimeter()
# для вычисления периметра прямоугольника.
# Переопределить методы __str__, __repr__.
# Затем создайте экземпляр класса Rectangle и выведите информацию о нем,
#его площадь и периметр.

class Rectangle:
    def __init__(self, width: float, high: float):
        self.width = width
        self.high = high

    def calculate_area(self):
        return self.width * self.high

    def calculate_perimetr(self):
        return (self.width + self.high) * 2

    def __str__(self):
        return f'Прямоугольник со сторонами: {self.width}, {self.high}'

    def __repr__(self):
        return f'Отладка вычислений параметров прямоугольника со сторонами: {self.width}, {self.high}'


rect_1 = Rectangle(5.7, 3.2)
rect_2 = Rectangle(10.8, 7.4)

print(repr(rect_1))
print(rect_1, f"имеет площадь:{rect_1.calculate_area():.2f} и периметр: {rect_1.calculate_perimetr():.2f}")
print(repr(rect_2))
print(rect_2, f"имеет площадь:{rect_2.calculate_area():.2f} и периметр: {rect_2.calculate_perimetr():.2f}")


# 2. Создайте класс BankAccount для представления банковского счета.
# Класс должен иметь атрибуты account_number (номер счета) и balance (баланс),
# а также методы deposit() для внесения денег на счет и withdraw()
# для снятия денег со счета. Затем создайте экземпляр класса BankAccount,
# внесите на счет некоторую сумму и снимите часть денег.
# Выведите оставшийся баланс. Не забудьте предусмотреть вариант,
# при котором при снятии баланс может стать меньше нуля.
# В этом случае уходить в минус не будем, вместо чего будем возвращать сообщение
# "Недостаточно средств на счете".

class BankAccount:
    def __init__(self, account_number, balance):
        self.account_number = account_number
        self.balance = balance

    def deposit(self, amount):
        if amount > 0:
            self.balance += amount
            return f"Внесено на счет: {amount}. Новый баланс: {self.balance}"
        else:
            return f'сумма взноса должна быть положительной!'

    def withdrow(self, amount):
        if 0 < amount <= self.balance:
            self.balance -= amount
            return f"Снято со счета: {amount}. Новый баланс: {self.balance}"
        elif amount <= 0:
            return f'сумма снятия должна быть положительной!'
        else:
            return "Недостаточно средств на счетe"

    def __str__(self):
        return f'BankAccount(Номер счета = {self.account_number}, Баланс = {self.balance})'

    def __repr__(self):
        return f'Отладочные данные: BankAccount(account_number={self.account_number!r}, balance={self.balance!r})'


account = BankAccount(account_number='13135252', balance=1000)

print(account.deposit(700))
print(account.withdrow(200))
print(account.withdrow(2000))
print(account)
print(repr(account))

