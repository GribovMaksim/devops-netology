# Домашнее задание к занятию 9 «Процессы CI/CD»

## Подготовка к выполнению

1. Создайте два VM в Yandex Cloud с параметрами: 2CPU 4RAM Centos7 (остальное по минимальным требованиям).
![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/3c0c612a-2e39-4f9b-9654-868be6fc449b)
2. Пропишите в [inventory](./infrastructure/inventory/cicd/hosts.yml) [playbook](./infrastructure/site.yml) созданные хосты.
3. Добавьте в [files](./infrastructure/files/) файл со своим публичным ключом (id_rsa.pub). Если ключ называется иначе — найдите таску в плейбуке, которая использует id_rsa.pub имя, и исправьте на своё.
4. Запустите playbook, ожидайте успешного завершения.
![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/ef8a98bf-2e73-4925-ab02-b12abf25b55e)
5. Проверьте готовность SonarQube через [браузер](http://localhost:9000).
6. Зайдите под admin\admin, поменяйте пароль на свой.
![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/0621329a-0b57-42f4-bdb7-181129cc8a37)
7.  Проверьте готовность Nexus через [бразуер](http://localhost:8081).
8. Подключитесь под admin\admin123, поменяйте пароль, сохраните анонимный доступ.
![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/ed31c008-c42a-4a9b-9279-ae468d98f4b1)

## Знакомоство с SonarQube

### Основная часть

1. Создайте новый проект, название произвольное.
![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/b295a258-6322-4516-b0fc-9e295c08d8ee)
2. Скачайте пакет sonar-scanner, который вам предлагает скачать SonarQube.
3. Сделайте так, чтобы binary был доступен через вызов в shell (или поменяйте переменную PATH, или любой другой, удобный вам способ).
4. Проверьте `sonar-scanner --version`.
```bash
vagrant@vagrant:~/home9.3/infrastructure$ sonar-scanner —version
INFO: Scanner configuration file: /home/vagrant/home9.3/infrastructure/sonar-scanner-4.8.0.2856-linux/conf/sonar-scanner.properties
INFO: Project root configuration file: /home/vagrant/home9.3/infrastructure/sonar-project.properties
INFO: SonarScanner 4.8.0.2856
INFO: Java 11.0.17 Eclipse Adoptium (64-bit)
INFO: Linux 5.4.0-136-generic amd64
```
5. Запустите анализатор против кода из директории [example](./example) с дополнительным ключом `-Dsonar.coverage.exclusions=fail.py`.
```bash
sonar-scanner \
-Dsonar.projectKey=devops \
-Dsonar.sources=. \
-Dsonar.host.url=http://51.250.88.85:9000 \
-Dsonar.login=6bd3511dcda15d548d8423114155bc89c4756ed7
```
6. Посмотрите результат в интерфейсе.
![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/dce2174f-d342-416e-95f3-ed9e7a778ee5)
7. Исправьте ошибки, которые он выявил, включая warnings.
8. Запустите анализатор повторно — проверьте, что QG пройдены успешно.
9. Сделайте скриншот успешного прохождения анализа, приложите к решению ДЗ.
![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/d828e27b-03db-4359-8346-54140130699a)

## Знакомство с Nexus

### Основная часть

1. В репозиторий `maven-public` загрузите артефакт с GAV-параметрами:

 *    groupId: netology;
 *    artifactId: java;
 *    version: 8_282;
 *    classifier: distrib;
 *    type: tar.gz.
   
2. В него же загрузите такой же артефакт, но с version: 8_102.
3. Проверьте, что все файлы загрузились успешно.
4. В ответе пришлите файл `maven-metadata.xml` для этого артефекта.
```bash
<?xml version="1.0" encoding="UTF-8"?>
<metadata modelVersion="1.1.0">
  <groupId>netology</groupId>
  <artifactId>java</artifactId>
  <versioning>
    <latest>8_282</latest>
    <release>8_282</release>
    <versions>
      <version>8_102</version>
      <version>8_282</version>
    </versions>
    <lastUpdated>20230518214103</lastUpdated>
  </versioning>
</metadata>
```
![image](https://github.com/GribovMaksim/devops-netology/assets/112322500/87199eb0-e1c2-41b8-acb6-bda382be1caa)

### Знакомство с Maven

### Подготовка к выполнению

1. Скачайте дистрибутив с [maven](https://maven.apache.org/download.cgi).
2. Разархивируйте, сделайте так, чтобы binary был доступен через вызов в shell (или поменяйте переменную PATH, или любой другой, удобный вам способ).
3. Удалите из `apache-maven-<version>/conf/settings.xml` упоминание о правиле, отвергающем HTTP- соединение — раздел mirrors —> id: my-repository-http-unblocker.
4. Проверьте `mvn --version`.
5. Заберите директорию [mvn](./mvn) с pom.
```bash
vagrant@vagrant:~/home9.3/apache-maven-3.9.2$ mvn --version
Apache Maven 3.9.2 (c9616018c7a021c1c39be70fb2843d6f5f9b8a1c)
Maven home: /home/vagrant/home9.3/apache-maven-3.9.2
Java version: 11.0.19, vendor: Ubuntu, runtime: /usr/lib/jvm/java-11-openjdk-amd64
Default locale: en_US, platform encoding: UTF-8
OS name: "linux", version: "5.4.0-136-generic", arch: "amd64", family: "unix"
```

### Основная часть

1. Поменяйте в `pom.xml` блок с зависимостями под ваш артефакт из первого пункта задания для Nexus (java с версией 8_282).
```bash 
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
<modelVersion>4.0.0</modelVersion>

<groupId>com.netology.app</groupId>
<artifactId>simple-app</artifactId>
<version>1.0-SNAPSHOT</version>
<repositories>
<repository>
<id>my-repo</id>
<name>maven-public</name>
<url>http://51.250.93.183:8081//repository/maven-public/</url>
</repository>
</repositories>
<dependencies>
<dependency>
<groupId>netology</groupId>
<artifactId>java</artifactId>
<version>8_282</version>
<classifier>distrib</classifier>
<type>tar.gz</type>
</dependency>
</dependencies>
</project>
```
2. Запустите команду `mvn package` в директории с `pom.xml`, ожидайте успешного окончания.
```bash 
  [INFO] Building jar: /home/vagrant/home9.3/mvn/target/simple-app-1.0-SNAPSHOT.jar
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  12.710 s
```
3. Проверьте директорию `~/.m2/repository/`, найдите ваш артефакт.
```bash
-rw-rw-r-- 1 vagrant vagrant    0 Jun 03 23:04 java-8_282-distrib.tar.gz
-rw-rw-r-- 1 vagrant vagrant   40 Jun 03 23:04 java-8_282-distrib.tar.gz.sha1
-rw-rw-r-- 1 vagrant vagrant  394 Jun 03 23:04 java-8_282.pom.lastUpdated
-rw-rw-r-- 1 vagrant vagrant  175 Jun 03 23:04 _remote.repositories
```
4. В ответе пришлите исправленный файл `pom.xml`.

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---
