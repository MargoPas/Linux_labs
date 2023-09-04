#!/bin/sh

echo "Введите поисковую строку: "
read string_to_find
echo "Введите файл для поиска: "
read file_where_find
echo "Введите число строк для вывода: "
read number_of_strings

echo "Результат: "
grep -m$number_of_strings $string_to_find $file_where_find 
