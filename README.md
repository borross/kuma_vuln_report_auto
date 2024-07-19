# kuma_vuln_report_auto
Скрипт автоматизации добавления активов с уязвимостями в KUMA

На примере отчетов от МР8:
1. Создайте отчет
   ![image](https://github.com/user-attachments/assets/dd979564-bcdf-4c2b-bf45-639bbd844c0d)
2. Разместите сгенерированные отчеты в расшаренную папку
3. Примонтируйте расшаренную папку к KUMA c компонентом ядро - [инструкция](https://kb.kuma-community.ru/books/integracii/page/montirovanie-papki-v-kuma)
4. Убедитесь, что утилита добавления активов `maxpatrol-tool` находится на ядре, обычно она находится в папке установки `/root/kuma-ansible-installer/roles/kuma/files/`
5. Загрузите скрипт автоматизации импорта активов с уязвимостями для KUMA `vuln_report_auto.sh` с этого репозитория
6. Исправьте путь папки отчетов в скрипте, например `REPORT_PATH=/mnt/mp8report/`
7. Добавьте значение API токена с соответствующими правами в файл `.apitoken` и укажите его в скрипте, пример `TOKEN_FILE=/root/.apitoken`. 
8. Добавьте возможность запуска скрипта `chmod +x vuln_report_auto.sh`
9. Добавьте скрипт в планировщик задач CRON. Для собстевнного расписания можно использовать этот ресурс https://crontab.guru/ 
