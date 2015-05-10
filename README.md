# russian-post-C5-addr
Стилевой файл LaTeX, позволяющий оформить конверты формата C5 приближенно к отечественным стандартам.

## Особенности
* Кодировка: UTF-8, T2A

## Структура
* **russian-post-C5-addr-class**: Стилевой файл `russian-post-C5-addr.cls` и пример его использования.
* **Pechkin**: Шрифт Pechkin, подготовленный для использования в TeX (T2A). Нужен для индекса получателя.
* **Pechkin-intermediate**: Некоторые промежуточные (от конвертации шрифта) и исходные файлы, взятые в Интернете (могут кому-то оказаться полезными). В частности, их можно использоваться для получения доступа к шрифту в Open/Libre Office.

## Установка
Пример для TeX Live в Ubuntu. Метод не претендует на универсальность и необходимость, но удовлетворяет достаточности решения задачи по печати на конвертах.

### Установка стилевого файла
Вариант 1: просто положить `russian-post-C5-addr.cls` в директорию с Вашим tex-файлом.

Вариант 2: включить стилевой файл в TeX:
* Скопировать файл в дерево каталогов TeX'а: `sudo mkdir -p /usr/local/share/texmf/tex/latex/russian-post-C5-addr/; sudo cp ./Class/russian-post-C5-addr.cls /usr/local/share/texmf/tex/latex/russian-post-C5-addr/`
* Обновить базу TeX: `sudo mktexlsr`

### Установка шрифта Pechkin
* Скопировать директории dvips и fonts в дерево каталогов TeX'а: `sudo cp ./Pechkin/{dvips,fonts} /usr/local/share/texmf/`
* Для `updmap` необходимо создать конфиг-файл: `sudo mkdir -p /etc/texmf/updmap.d/; sudo echo -e "# Pechkin\nMap Pechkin.map" > /etc/texmf/updmap.d/20Pechkin.cfg`
* Обновить базу TeX: `sudo mktexlsr; sudo update-updmap; sudo mktexlsr; sudo updmap-sys; sudo mktexlsr`. Выполнять лучше из каталога, не относящегося к TeX'у.



