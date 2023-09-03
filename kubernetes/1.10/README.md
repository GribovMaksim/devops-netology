# Домашнее задание к занятию «Обновление приложений»

### Цель задания

Выбрать и настроить стратегию обновления приложения.

### Чеклист готовности к домашнему заданию

1. Кластер K8s.

### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. [Документация Updating a Deployment](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#updating-a-deployment).
2. [Статья про стратегии обновлений](https://habr.com/ru/companies/flant/articles/471620/).

-----

### Задание 1. Выбрать стратегию обновления приложения и описать ваш выбор

1. Имеется приложение, состоящее из нескольких реплик, которое требуется обновить.
2. Ресурсы, выделенные для приложения, ограничены, и нет возможности их увеличить.
3. Запас по ресурсам в менее загруженный момент времени составляет 20%.
4. Обновление мажорное, новые версии приложения не умеют работать со старыми.
5. Вам нужно объяснить свой выбор стратегии обновления приложения.

Ответ:

Т.к. ресурсов очень мало остается две стратегии обновления rolling update и recreate. Т.к. обновление мажорное, то используем recreate, но пользователям придется подождать, пока всё поднимется. Rolling update не можем использовать, т.к. начнут валиться ошибки, из-за невозможности работать двум версиям сразу, из-за чего процесс обновления встанет, нам придется самим решать эту проблему.

### Задание 2. Обновить приложение

1. Создать deployment приложения с контейнерами nginx и multitool. Версию nginx взять 1.19. Количество реплик — 5.
2. Обновить версию nginx в приложении до версии 1.20, сократив время обновления до минимума. Приложение должно быть доступно.
3. Попытаться обновить nginx до версии 1.28, приложение должно оставаться доступным.
4. Откатиться после неудачного обновления.

Ответ:

Создал деплоймент приложения

![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/5a88f5ad-1da9-4056-91d7-d2a18aa9f1dc)

Обновил версию приложения nginx до 1.20

![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/8ec91a6e-9d1a-4de9-8b8b-81f4e265c542)

Обновил до 1.28

![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/b76b43d5-9214-4b8d-b651-5ded7689cb58)

Откат на рабочую версию (1.20)

![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/6b1c1176-dc68-476e-bbb6-4e3e588a3b2c)

## Дополнительные задания — со звёздочкой*

Задания дополнительные, необязательные к выполнению, они не повлияют на получение зачёта по домашнему заданию. **Но мы настоятельно рекомендуем вам выполнять все задания со звёздочкой.** Это поможет лучше разобраться в материале.   

### Задание 3*. Создать Canary deployment

1. Создать два deployment'а приложения nginx.
2. При помощи разных ConfigMap сделать две версии приложения — веб-страницы.
3. С помощью ingress создать канареечный деплоймент, чтобы можно было часть трафика перебросить на разные версии приложения.

### Правила приёма работы

1. Домашняя работа оформляется в своем Git-репозитории в файле README.md. Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
2. Файл README.md должен содержать скриншоты вывода необходимых команд, а также скриншоты результатов.
3. Репозиторий должен содержать тексты манифестов или ссылки на них в файле README.md.