# Домашнее задание к занятию «Сетевое взаимодействие в K8S. Часть 2»

### Цель задания

В тестовой среде Kubernetes необходимо обеспечить доступ к двум приложениям снаружи кластера по разным путям.

------

### Чеклист готовности к домашнему заданию

1. Установленное k8s-решение (например, MicroK8S).
2. Установленный локальный kubectl.
3. Редактор YAML-файлов с подключённым Git-репозиторием.

------

### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. [Инструкция](https://microk8s.io/docs/getting-started) по установке MicroK8S.
2. [Описание](https://kubernetes.io/docs/concepts/services-networking/service/) Service.
3. [Описание](https://kubernetes.io/docs/concepts/services-networking/ingress/) Ingress.
4. [Описание](https://github.com/wbitt/Network-MultiTool) Multitool.

------

### Задание 1. Создать Deployment приложений backend и frontend

1. Создать Deployment приложения _frontend_ из образа nginx с количеством реплик 3 шт.
2. Создать Deployment приложения _backend_ из образа multitool. 
3. Добавить Service, которые обеспечат доступ к обоим приложениям внутри кластера. 
4. Продемонстрировать, что приложения видят друг друга с помощью Service.
5. Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4.

Ответ: 

frontend

[deployment](https://github.com/GribovMaksim/devops-netology/blob/main/kubernetes/1.5/frontend/deployment.yml) 

[service](https://github.com/GribovMaksim/devops-netology/blob/main/kubernetes/1.5/frontend/service.yml)

backend

[deployment](https://github.com/GribovMaksim/devops-netology/blob/main/kubernetes/1.5/backend/deployment.yml) 

[service](https://github.com/GribovMaksim/devops-netology/blob/main/kubernetes/1.5/backend/service.yml) 

![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/205f72f5-f6ac-49cc-b075-bf44060f0479) 
![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/287f642f-0b10-4001-a895-6dda41b5c62d) 
------

### Задание 2. Создать Ingress и обеспечить доступ к приложениям снаружи кластера

1. Включить Ingress-controller в MicroK8S.
2. Создать Ingress, обеспечивающий доступ снаружи по IP-адресу кластера MicroK8S так, чтобы при запросе только по адресу открывался _frontend_ а при добавлении /api - _backend_.
3. Продемонстрировать доступ с помощью браузера или `curl` с локального компьютера.
4. Предоставить манифесты и скриншоты или вывод команды п.2.

Ответ: 

[ingress](https://github.com/GribovMaksim/devops-netology/blob/main/kubernetes/1.5/ingress.yml)

![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/af54c197-284c-4725-88b3-f35c9afea691) 
![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/85208d90-f4d1-4f67-afe7-3d4fcac9602c) 
![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/42feb968-1dcc-4fa9-b1ec-4685a7ba2898) 
![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/8c285db6-5a61-4a47-a066-66f744cd6727) 
------

### Правила приема работы

1. Домашняя работа оформляется в своем Git-репозитории в файле README.md. Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
2. Файл README.md должен содержать скриншоты вывода необходимых команд `kubectl` и скриншоты результатов.
3. Репозиторий должен содержать тексты манифестов или ссылки на них в файле README.md.

------
