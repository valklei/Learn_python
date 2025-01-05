#!/bin/bash


cd /opt/160924-ptm/valklei
mkdir dir_v1 dir_v2

source_dir="/opt/160924-ptm/valklei/dir_v1"
target_dir="/opt/160924-ptm/valklei/dir_v2"

cd /opt/160924-ptm/valklei/dir_v1



# Создаем 100 файлов
for i in {1..100}
do
  # Генерируем случайное число
  filename=$RANDOM

  # Создаем файл с именем, основанным на случайном числе
  touch "${filename}"
done



for file in "$source_dir"/*; do
  filename=$(basename "$file")
  if [[ $filename =~ ^[0-9]+$ ]]; then
    if (( filename % 2 == 0 )); then
      mv "$file" "$target_dir"
      echo "Перемещен файл $filename в $target_dir"
    else
      echo "Файл $filename остается в $source_dir"
    fi
  else
    echo "Файл $filename не содержит числового имени, пропускаем"
  fi
done