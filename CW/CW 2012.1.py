# Напишите программу, которая принимает путь к Python-файлу через консоль и выполняет
# его. Если файл содержит синтаксические ошибки, программа должна корректно обработать
# их и вывести сообщение об ошибке.
#
#
# Путь к Python-файлу передаётся через аргумент командной строки --exec.
# Если файл не существует или не является .py, вывести сообщение об ошибке.
# Если скрипт выполняется успешно, вывести его результат.
original_text = """Йухуинк%пурркин1%йхшмёє%фу%нмшьктнѓ%U~ymts&Ц%тецчшфеѓюнс%Тузѐс%иуйус&Фшцчё%ђчуч%иуй%цчеткч%йрє%тец%зцкъ%шцфкэтѐс%зу%зцкъ%цсѐцреъ?%тузѐъ%мтетно1%нтчкхкцтѐъ%фхукпчуз%н%зйуътузктнє3Лкреѓ1%ьчужѐ%цчхупн%пуйе%рулнрнцё%те%ђпхет%пеп%фуђмнє1%ериухнчсѐ%теъуйнрн%нйкерётѐк%хкэктнє1%е%жеин%уцчезернцё%рнэё%з%зуцфуснтетнєъ%шъуйєюкиу%иуйе&Фшцчё%теэк%цчхксрктнк%п%цузкхэктцчзш%н%цузскцчтеє%хежуче%фхнткцшч%тес%стулкцчзу%йуцчнлктно%н%фузуйуз%йрє%иухйуцчн3Н1%путкьту1%цьецчёє1%мйухузёє1%хейуцчн%н%чкфре%зес%н%зеэнс%жрнмпнс3Фшцчё%757:%иуй%жшйкч%иуйус%нцфуртктнє%лкретно%н%ткзкхуєчтѐъ%учпхѐчно&Ц%тенршьэнсн%фулкретнєсн1`Ujywz%[fyt{b"""

shift = 5
def decrypt(original_text, shift):
    decrypted_text = ""
    for char in original_text:
        decrypted_text += chr((ord(char) - shift) % 2500)
    return decrypted_text

encrypted_list = [original_text]

for text in encrypted_list:
    decrypted_text = decrypt(text, shift)
    print("Расшифрованный текст:")
    print(decrypted_text)