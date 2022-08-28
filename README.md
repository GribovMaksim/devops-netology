# devops-netology
#first line
# Local .terraform directories
Все каталоги и файлы входящие в каталог .terraform
# .tfstate files
Файлы, содержащие .tfstate
# Crash log files
Файлы с именем crash.log
# Exclude all .tfvars files, which are likely to contain sensitive data, such as
# password, private keys, and other secrets. These should not be part of version 
# control as they are data points which are potentially sensitive and subject 
# to change depending on the environment.
Файлы содержащие потенциально конфиденциальные данные с расширением .tfvars
# Ignore override files as they are usually used to override resources locally and so
# are not checked in
Файлы переопределения override.tf, override.tf.json, и любые файлы, которые содержат в названии _override.tf или _override.tf.json
# Include override files you do wish to add to version control using negated pattern
# !example_override.tf
# Include tfplan files to ignore the plan output of command: terraform plan -out=tfplan
# example: *tfplan*
# Ignore CLI configuration files
Кофнигурационные файлы terraform.rc и .terraformrc