# Домашнее задание к занятию Troubleshooting

### Цель задания

Устранить неисправности при деплое приложения.

### Чеклист готовности к домашнему заданию

1. Кластер K8s.

### Задание. При деплое приложение web-consumer не может подключиться к auth-db. Необходимо это исправить

1. Установить приложение по команде:
```shell
kubectl apply -f https://raw.githubusercontent.com/netology-code/kuber-homeworks/main/3.5/files/task.yaml
```
2. Выявить проблему и описать.
3. Исправить проблему, описать, что сделано.
4. Продемонстрировать, что проблема решена.

Ответ:

![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/1bccb8ac-d221-48d4-8f70-1ea3321d3ee2)

![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/fd3062db-7686-4fd7-afec-9ef2cb94454c)

![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/ac5c919c-0aeb-48cb-adbf-bf7cf96ddc2d)

Чтобы web-consumer подключился к auth-db, нужно поправить деплоймент web.
- while true; do curl auth-db.data; sleep 5; done

![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/ab3d08da-9a63-4edf-83ad-a3c318664722)

![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/4f07580b-52df-4e3b-b0de-d9e1f5c39267)

### Правила приёма работы

1. Домашняя работа оформляется в своём Git-репозитории в файле README.md. Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
2. Файл README.md должен содержать скриншоты вывода необходимых команд, а также скриншоты результатов.
3. Репозиторий должен содержать тексты манифестов или ссылки на них в файле README.md.
