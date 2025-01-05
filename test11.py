import time
import csv
import sys

def follow_csv(path):
    with open(path, encoding='utf-8') as csvfile:
        reader = csv.DictReader(csvfile)
        fieldnames = reader.fieldnames
        csvfile.seek(0,2)
        while True:
            line = csvfile.readline()
            if not line:
                time.sleep(3)
                continue
            row = csv.DictReader([line], fieldnames).__next__()
            if row['moderated'] == '0':
                yield f'New non-moderated: {row}\n'

for news in follow_csv(sys.argv[1]):
    sys.stdout.write(news)
    sys.stdout.flush()

# 41,Donald Trump as new president of United States of America.,This news has caused a truly huge worldwide outcry,9,0,2024-12-16 03:15:36,

