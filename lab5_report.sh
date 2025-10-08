#!/bin/bash

# Компактный отчет для скриншота - Лабораторная работа №5

clear

echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║       ЛАБОРАТОРНАЯ РАБОТА №5 - ИСТОРИЯ GIT                      ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo ""
echo "Студент: Новыхин Максим"
echo "GitHub: moyamoyaradost"
echo "Группа: МГКЭиТ 2-ИП 1-11-24"
echo "Дата: 01.11.2024"
echo "Репозиторий: https://github.com/moyamoyaradost/studying-Git"
echo ""
echo "══════════════════════════════════════════════════════════════════"
echo "ВЫПОЛНЕННЫЕ КОМАНДЫ:"
echo "══════════════════════════════════════════════════════════════════"
echo ""

AUTHOR=$(git config user.name)

echo "✓ Пункт 1: git log                    - Полный лог коммитов"
echo "✓ Пункт 2: git log -p                 - Детальные изменения"
echo "✓ Пункт 3: git log --oneline          - Короткий вид"
echo "✓ Пункт 4: git log --author           - Фильтр по автору"
echo "✓ Пункт 5: git log --graph            - График веток (3 варианта)"
echo "✓ Пункт 6: git log -n 2               - Последние 2 коммита"
echo "✓ Пункт 7: git log --grep             - Поиск по сообщению"
echo "✓ Пункт 8: git log --since/--until    - Фильтр по дате"
echo "✓ Пункт 9: Комбинация параметров      - Автор + дата"
echo "✓ Пункт 10: git diff / git blame      - Сравнение и авторство"
echo "✓ Пункт 11: Самостоятельные задания   - 8 дополнительных команд"
echo ""
echo "══════════════════════════════════════════════════════════════════"
echo "ПРИМЕРЫ ВЫПОЛНЕНИЯ:"
echo "══════════════════════════════════════════════════════════════════"
echo ""

echo "▶ git log --oneline (последние коммиты):"
git log --oneline -n 5
echo ""

echo "▶ git log --graph --oneline --decorate (график с ветками):"
git log --graph --oneline --decorate -n 5
echo ""

echo "▶ git log --author='$AUTHOR' --oneline (мои коммиты):"
git log --author="$AUTHOR" --oneline
echo ""

echo "▶ git log --stat (статистика изменений):"
git log --stat --oneline -n 2
echo ""

echo "▶ git blame hello.html (авторство строк):"
git blame hello.html
echo ""

echo "▶ git show main:hello.html (содержимое файла в main):"
git show main:hello.html
echo ""

echo "══════════════════════════════════════════════════════════════════"
echo "ИТОГИ:"
echo "══════════════════════════════════════════════════════════════════"
echo ""
echo "✅ Всего выполнено команд: 20+"
echo "✅ Изучены параметры: --oneline, --graph, --author, --grep,"
echo "   --since, --stat, -p, -n, --follow, --pretty и другие"
echo "✅ Полный вывод сохранен в: lab5_output.txt"
echo "✅ Репозиторий на GitHub: https://github.com/moyamoyaradost/studying-Git"
echo ""
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║              ЛАБОРАТОРНАЯ РАБОТА №5 ВЫПОЛНЕНА ✓                 ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo ""
