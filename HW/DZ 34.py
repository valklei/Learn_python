# Напишите функцию extract_emails(text),
# которая извлекает все адреса электронной почты
# из заданного текста и возвращает их в виде списка.

import re

def extract_emails(text: str) -> list:
    pattern = r'[\w.-]+@[\w.-]+\.[A-Za-z]+'
    return re.findall(pattern, text)


# Напишите функцию highlight_keywords(text, keywords),
# которая выделяет все вхождения заданных ключевых слов в тексте, о
# кружая их символами *.
# Функция должна быть регистронезависимой при поиске ключевых слов.

def highlight_keywords(text: str, keywords: list) -> str:
    for keyword in keywords:

        pattern = rf'(\b{keyword}\b)'

        text = re.sub(pattern, r"*\1*", text, flags=re.I)

    return text
