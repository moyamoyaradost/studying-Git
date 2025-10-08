#!/bin/bash

# Лабораторная работа №5 "История" по Git
# Студент: Новыхин Максим
# Группа: МГКЭиТ 2-ИП 1-11-24
# GitHub: moyamoyaradost
# Репозиторий: studying-Git

# Цвета для вывода
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Проверка наличия Git
if ! command -v git &> /dev/null; then
    echo -e "${RED}Ошибка: Git не установлен!${NC}"
    exit 1
fi

# Файл для сохранения результатов
OUTPUT_FILE="lab5_output.txt"
echo "=== ЛАБОРАТОРНАЯ РАБОТА №5 - ИСТОРИЯ ===" > "$OUTPUT_FILE"
echo "Студент: Новыхин Максим" >> "$OUTPUT_FILE"
echo "Группа: МГКЭиТ 2-ИП 1-11-24" >> "$OUTPUT_FILE"
echo "Дата: 01.11.2024" >> "$OUTPUT_FILE"
echo "GitHub: moyamoyaradost" >> "$OUTPUT_FILE"
echo "Репозиторий: https://github.com/moyamoyaradost/studying-Git" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Функция для выполнения команды и сохранения результата
run_command() {
    local step_num=$1
    local description=$2
    local command=$3
    
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${GREEN}Пункт $step_num: $description${NC}"
    echo -e "${YELLOW}Команда: $command${NC}"
    echo ""
    
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" >> "$OUTPUT_FILE"
    echo "Пункт $step_num: $description" >> "$OUTPUT_FILE"
    echo "Команда: $command" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
    
    # Выполнение команды
    eval "$command" 2>&1 | tee -a "$OUTPUT_FILE"
    
    echo "" >> "$OUTPUT_FILE"
    echo ""
    sleep 0.5
}

echo -e "${GREEN}╔════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║   ЛАБОРАТОРНАЯ РАБОТА №5 - ИСТОРИЯ GIT            ║${NC}"
echo -e "${GREEN}║   Студент: Новыхин Максим                         ║${NC}"
echo -e "${GREEN}║   Группа: МГКЭиТ 2-ИП 1-11-24                      ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════════════╝${NC}"
echo ""

# 1. Полный лог коммитов
run_command "1" "Полный лог коммитов" "git log"

# 2. Детальные изменения
run_command "2" "Лог с детальными изменениями (diff)" "git log -p --max-count=1"

# 3. Короткий вид
run_command "3" "Короткий вид истории (oneline)" "git log --oneline"

# 4. Коммиты конкретного автора
AUTHOR=$(git config user.name)
run_command "4" "Коммиты автора: $AUTHOR" "git log --author='$AUTHOR'"

# 5. График веток
run_command "5a" "График текущей ветки" "git log --graph --oneline"

run_command "5b" "График с декорациями" "git log --graph --oneline --decorate"

run_command "5c" "График всех веток" "git log --all --graph --oneline --decorate"

# 6. Последние N записей
run_command "6" "Последние 2 коммита" "git log -n 2"

# 7. Поиск по сообщению
run_command "7" "Поиск по сообщению 'commit'" "git log --grep='commit' -i"

# 8. Поиск по дате
run_command "8" "Коммиты за последний месяц" "git log --since=1.month.ago"

# 9. Сочетание параметров
run_command "9" "Автор + дата (последний месяц)" "git log --author='$AUTHOR' --since=1.month.ago --oneline"

# 10. Сравнение изменений
run_command "10a" "Изменения с последнего коммита" "git diff HEAD"

run_command "10b" "Изменения с предпоследнего коммита" "git diff HEAD^"

run_command "10c" "Статистика изменений" "git diff --stat HEAD^"

run_command "10d" "Авторы строк в hello.html" "git blame hello.html"

# 11. Самостоятельные задания
run_command "11a" "История с переименованиями" "git log --follow hello.html"

run_command "11b" "Формат: одна строка на коммит" "git log --pretty=oneline"

run_command "11c" "Кастомный формат с графом" "git log --pretty=format:'%h %s' --graph"

run_command "11d" "Коммиты за последнюю неделю" "git log --author='$AUTHOR' --after={1.week.ago} --pretty=oneline --abbrev-commit"

run_command "11e" "Детали последнего коммита" "git show HEAD"

run_command "11f" "Файл hello.html в ветке main" "git show main:hello.html"

run_command "11g" "Статистика всех коммитов" "git log --stat"

run_command "11h" "Поиск изменений со строкой 'Hello'" "git log -S 'Hello' --oneline"

echo -e "${GREEN}╔════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║   ЛАБОРАТОРНАЯ РАБОТА №5 ЗАВЕРШЕНА!               ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${YELLOW}📁 Результаты сохранены в: $OUTPUT_FILE${NC}"
echo -e "${YELLOW}🌐 Репозиторий: https://github.com/moyamoyaradost/studying-Git${NC}"
echo -e "${YELLOW}📝 Коммиты: https://github.com/moyamoyaradost/studying-Git/commits/main${NC}"
echo ""

# Добавить итоговую информацию в файл
echo "" >> "$OUTPUT_FILE"
echo "════════════════════════════════════════════════════" >> "$OUTPUT_FILE"
echo "ЛАБОРАТОРНАЯ РАБОТА №5 ЗАВЕРШЕНА УСПЕШНО" >> "$OUTPUT_FILE"
echo "Результаты сохранены: $(date)" >> "$OUTPUT_FILE"
echo "════════════════════════════════════════════════════" >> "$OUTPUT_FILE"
