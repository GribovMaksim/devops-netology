# Домашнее задание к занятию «Базовые объекты K8S»

### Цель задания

В тестовой среде для работы с Kubernetes, установленной в предыдущем ДЗ, необходимо развернуть Pod с приложением и подключиться к нему со своего локального компьютера. 

------

### Чеклист готовности к домашнему заданию

1. Установленное k8s-решение (например, MicroK8S).
2. Установленный локальный kubectl.
3. Редактор YAML-файлов с подключенным Git-репозиторием.

------

### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. Описание [Pod](https://kubernetes.io/docs/concepts/workloads/pods/) и примеры манифестов.
2. Описание [Service](https://kubernetes.io/docs/concepts/services-networking/service/).

------

### Задание 1. Создать Pod с именем hello-world

1. Создать манифест (yaml-конфигурацию) Pod.
2. Использовать image - gcr.io/kubernetes-e2e-test-images/echoserver:2.2.
3. Подключиться локально к Pod с помощью `kubectl port-forward` и вывести значение (curl или в браузере).

------

### Задание 2. Создать Service и подключить его к Pod

1. Создать Pod с именем netology-web.
2. Использовать image — gcr.io/kubernetes-e2e-test-images/echoserver:2.2.
3. Создать Service с именем netology-svc и подключить к netology-web.
4. Подключиться локально к Service с помощью `kubectl port-forward` и вывести значение (curl или в браузере).

------

### Правила приёма работы

1. Домашняя работа оформляется в своем Git-репозитории в файле README.md. Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
2. Файл README.md должен содержать скриншоты вывода команд `kubectl get pods`, а также скриншот результата подключения.
3. Репозиторий должен содержать файлы манифестов и ссылки на них в файле README.md.

------

### Критерии оценки
Зачёт — выполнены все задания, ответы даны в развернутой форме, приложены соответствующие скриншоты и файлы проекта, в выполненных заданиях нет противоречий и нарушения логики.

На доработку — задание выполнено частично или не выполнено, в логике выполнения заданий есть противоречия, существенные недостатки.

### Решение
1.1. ![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/6cd0dcc4-c0d3-484f-8870-0693f2507868)

1.2. ![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/8c9d75b5-0968-4023-af32-1afc8e73023a)

1.3. ![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/121ed6d0-5bb6-4f43-b293-a63f430d36dd)

2.1. ![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/ab1aa2bd-5682-4986-924b-731102e28dcd)

2.2. ![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/8d67849e-5da4-48e0-9318-e072a710b34e)

2.3. ![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/e63fa439-7e1e-4c02-afbc-319fff77edf3)

### Манифесты
1. https://github.com/GribovMaksim/devops-netology/blob/main/pod.yaml
2. https://github.com/GribovMaksim/devops-netology/blob/main/netology-web.yaml
3. https://github.com/GribovMaksim/devops-netology/blob/main/service.yaml
