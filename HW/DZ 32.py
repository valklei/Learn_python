class Counter:
    def __init__(self, initial_value=0):
        self.value = initial_value

    def __add__(self, other):
        if isinstance(other, (int)):
            self.value += other
        else:
            raise TypeError("Оператор += поддерживает только числовые значения")
        return self

    def __sub__(self, other):
        if isinstance(other, (int)):
            self.value -= other
        else:
            raise TypeError("Оператор -= поддерживает только числовые значения")
        return self

    def __str__(self):
        return str(self.value)

    def __int__(self):
        return int(self.value)

counter = Counter(5)

counter += 3
print(counter)

counter -= 2
print(int(counter))


# Реализовать класс Email, представляющий электронное письмо.
# Класс должен поддерживать следующие операции:
# - Сравнение писем по дате (операторы <, >, <=, >=, ==, !=)
# - Преобразование письма в строку (метод __str__)
# - Получение длины текста письма (метод __len__)
# - Получение хеш-значения письма (метод __hash__)
# - Проверка наличия текста в письме (метод __bool__)

from datetime import datetime


class Email:
    def __init__(self, sender, recipient, subject, body, date):
        self.sender = sender
        self.recipient = recipient
        self.subject = subject
        self.body = body
        self.date = datetime.strptime(date, "%Y-%m-%d")

    def __lt__(self, other):
        return self.date < other.date

    def __le__(self, other):
        return self.date <= other.date

    def __gt__(self, other):
        return self.date > other.date

    def __ge__(self, other):
        return self.date >= other.date

    def __eq__(self, other):
        return self.date == other.date

    def __ne__(self, other):
        return self.date != other.date

    def __str__(self):
        return (f"From: {self.sender}\n"
                f"To: {self.recipient}\n"
                f"Subject: {self.subject}\n"
                f"Date: {self.date.strftime('%Y-%m-%d')}\n"
                f"Body: {self.body}")

    def __len__(self):
        return len(self.body)

    def __hash__(self):
        return hash((self.sender, self.recipient, self.subject, self.body, self.date))

    def __bool__(self):
        return bool(self.body)


email1 = Email("john@example.com", "jane@example.com", "Meeting", "Hi Jane, let's have a meeting tomorrow.",
               "2022-05-10")
email2 = Email("jane@example.com", "john@example.com", "Re: Meeting", "Sure, let's meet at 2 PM.", "2022-05-10")
email3 = Email("alice@example.com", "bob@example.com", "Hello", "Hi Bob, how are you?", "2022-05-09")

print(email1)

print(email1 < email2)
print(email1 > email3)
print(email1 == email2)
print(email1 != email3)

print(len(email1))
print(hash(email1))

print(bool(email1))
print(bool(Email("john@example.com", "jane@example.com", "Meeting", "", "2022-05-10")))


