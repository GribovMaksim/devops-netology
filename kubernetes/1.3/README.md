# Домашнее задание к занятию «Запуск приложений в K8S»

### Цель задания

В тестовой среде для работы с Kubernetes, установленной в предыдущем ДЗ, необходимо развернуть Deployment с приложением, состоящим из нескольких контейнеров, и масштабировать его.

------

### Чеклист готовности к домашнему заданию

1. Установленное k8s-решение (например, MicroK8S).
2. Установленный локальный kubectl.
3. Редактор YAML-файлов с подключённым git-репозиторием.

------

### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. [Описание](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) Deployment и примеры манифестов.
2. [Описание](https://kubernetes.io/docs/concepts/workloads/pods/init-containers/) Init-контейнеров.
3. [Описание](https://github.com/wbitt/Network-MultiTool) Multitool.

------

### Задание 1. Создать Deployment и обеспечить доступ к репликам приложения из другого Pod

1. Создать Deployment приложения, состоящего из двух контейнеров — nginx и multitool. Решить возникшую ошибку.
2. После запуска увеличить количество реплик работающего приложения до 2.
3. Продемонстрировать количество подов до и после масштабирования.
4. Создать Service, который обеспечит доступ до реплик приложений из п.1.
5. Создать отдельный Pod с приложением multitool и убедиться с помощью `curl`, что из пода есть доступ до приложений из п.1.

[Deployment](https://github.com/GribovMaksim/devops-netology/blob/main/kubernetes/1.3/deployment.yml)
![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/de391b93-bac3-40cf-9533-d7c3f8b9e63c)
![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/95b93f64-df46-4471-9d8b-689a4b883a57)
![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/024d25ff-a6a3-44a0-beb2-54022f6589c1)
![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/27a9001d-5eed-40dd-a68a-c92700ca6c53)
[Service](https://github.com/GribovMaksim/devops-netology/blob/main/kubernetes/1.3/service.yml)
![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/8786c420-40e1-4464-8ca5-f2e2f5cf0117)
![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/9b843385-5723-47d2-a60b-7cde7e8fd2dd)
![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/a9d4e356-399c-47a7-b5fd-7dfc252b48bc)
![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/3be40c8c-d1f3-43ec-839c-4dceca479c24)
![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/3378dc86-2e5d-450b-ad18-4ee159593526)
[Pod](https://github.com/GribovMaksim/devops-netology/blob/main/kubernetes/1.3/pod.yml)
![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/f4b560a3-93b4-4123-8788-6852f77ff008)
![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/42c75110-0782-4081-a2c9-140cf670fa39)
![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/385f7613-e7cd-4160-a12b-2eb14bfeacf7)
------

### Задание 2. Создать Deployment и обеспечить старт основного контейнера при выполнении условий

1. Создать Deployment приложения nginx и обеспечить старт контейнера только после того, как будет запущен сервис этого приложения.
2. Убедиться, что nginx не стартует. В качестве Init-контейнера взять busybox.
3. Создать и запустить Service. Убедиться, что Init запустился.
4. Продемонстрировать состояние пода до и после запуска сервиса.

[Deployment2](https://github.com/GribovMaksim/devops-netology/blob/main/kubernetes/1.3/deployments2.yml)
![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/f30c685a-1317-4925-97bd-b7b9287e0643)
![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/55c24ba1-e6c6-42c8-8703-7f47d1e65092)
[Service2](https://github.com/GribovMaksim/devops-netology/blob/main/kubernetes/1.3/service2.yml)
![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/d22bbd1a-ec08-4987-a564-990d10a1a27b)
------

### Правила приема работы

1. Домашняя работа оформляется в своем Git-репозитории в файле README.md. Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
2. Файл README.md должен содержать скриншоты вывода необходимых команд `kubectl` и скриншоты результатов.
3. Репозиторий должен содержать файлы манифестов и ссылки на них в файле README.md.

------
