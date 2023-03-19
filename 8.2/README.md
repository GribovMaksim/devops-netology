### group_vars
| Переменная  | Значение | 
| ------------- | ------------- | 
| clickhouse_version | версия Clickhouse |
| clickhouse_packages | RPM пакеты Clickhouse, которые необходимо скачать |
| vector_url | URL адрес для скачивания RPM пакетов Vector |
| vector_versionl | версия Vector |	
| vector_home | каталог для скачивания RPM пакетов Vector |	
| lighthouse_url | ссылка на репозиторий Lighthouse |	
| lighthouse_dir | каталог для файлов Lighthouse |	
| lighthouse_nginx_user | пользователь, из-под которого будет работать Nginx. Для упрощения процесса на тестовом стенде используем root пользователя |	

### Inventory файл
Группа "clickhouse" состоит из 1 хоста clickhouse-01

Группа "vector" состоит из 1 хоста vector-01

Группа "lighthouse" состоит из 1 хоста lighthouse-01

### Playbook
Playbook состоит из 3 play.

Play "Install Clickhouse" применяется на группу хостов "Clickhouse" и предназначен для установки и запуска Clickhouse

Объявляем handler для запуска clickhouse-server.
```bash
handlers:
    - name: Start clickhouse service
      become: true
      ansible.builtin.service:
        name: clickhouse-server
        state: restarted
```
| Переменная  | Значение | 
| ------------- | ------------- | 
| Get clickhouse distrib | Скачивание RPM пакетов. Используется цикл с перменными clickhouse_packages. Так как не у всех пакетов есть noarch версии, используем перехват ошибки rescue |
| Install clickhouse packages | Установка RPM пакетов. Используем disable_gpg_check: true для отключения проверки GPG подписи пакетов. В notify указываем, что данный таск требует запуск handler Start clickhouse service |
| Flush handlers | Форсируем применение handler Start clickhouse service. Это необходимо для того, чтобы handler выполнился на текущем этапе, а не по завершению тасок. Если его не запустить сейчас, то сервис не будет запущен и следующий таск завершится с ошибкой |
| Create database | Создаем в Clickhouse БД с названием "logs". Также прописываем условия, при которых таск будет иметь состояние failed и changed |

Play "Install Vector" применяется на группу хостов "Vector" и предназначен для установки и запуска Vector

Объявляем handler для запуска vector.
```bash
 handlers:
    - name: Start Vector service
      become: true
      ansible.builtin.service:
        name: vector
        state: restarted
```
| Переменная  | Значение | 
| ------------- | ------------- | 
| Download packages | Скачивание RPM пакетов в текущую директорию пользователя |
| Install packages | Install clickhouse packages | Установка RPM пакетов. Используем disable_gpg_check: true для отключения проверки GPG подписи пакетов |
| Apply template | Применяем шаблон конфига vector. Здесь мы задаем путь конфига. Владельцем назначаем текущего пользователя ansible. После применения запускаем валидацию конфига |
| change systemd unit | Изменяем модуль службы vector. После этого указываем handler для старта службы vector |

Play "Install lighthouse" применяется на группу хостов "lighthouse" и предназначен для установки и запуска lighthouse

Объявляем handler для перезапуска Nginx.
```bash
 handlers:
    - name: Nginx reload
      become: true
      ansible.builtin.service:
        name: nginx
        state: restarted
```
| Переменная pretask  | Значение | 
| ------------- | ------------- | 
| Install git | Устанавливаем git |
| Install epel-release | Устанавливаем релизный репозиторий |
| Apply Install nginx | Устанавливаем Nginx |
| Apply nginx config | Применяем конфиг Nginx |

| Переменная task  | Значение | 
| ------------- | ------------- | 
| Clone repository | Клонируем репозиторий lighthouse из ветки master |
| Apply config | Применяем конфиг Nginx для lighthouse. После этого перезапускаем nginx для применения изменений |

### Template
Шаблон "vector.service.j2" используется для изменения модуля службы vector. В нем мы определяем строку запуска vector. Также указываем, что unit должен быть запущен под текущим пользователем ansible

Шаблон "vector.yml.j2" используется для настройки конфига vector. В нем мы указываем, что конфиг файл находится в переменной "vector_config" и его надо преобразовать в YAML.

Шаблон "nginx.conf.j2" используется для первичной настройки nginx. Мы задаем пользователя для работы nginx и удаляем настройки root директории по умолчанию.

Шаблон "lighthouse_nginx.conf.j2" настраивает nginx на работу с lighthouse. В нем прописываем порт 80, root директорию и index страницу.