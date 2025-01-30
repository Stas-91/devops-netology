# devops-netology
# first commit
# second commit: add .gitignore
- "*.tfstate" - игнорируются файлы с расширением tfstate
- "*.tfstate.*" игнорируются все файлы которые содержат .tfstate. например terraform.tfstate.backup
- "**/.terraform/*" - игнорируется папка .terraform и ее содержимое, также в любой вложенной папке
- "crash.log" - игнорируется конкретный файл
- "crash.*.log" - игнорируется файл который начинается с crash. и заканчивается расширением log
