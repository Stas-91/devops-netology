# Домашнее задание к занятию «Инструменты Git» Помельников Станислав

## Задание

В клонированном репозитории:

1. Найдите полный хеш и комментарий коммита, хеш которого начинается на `aefea`.
   - git log -1 --pretty=format:"%H %s" aefea - параметр -1 позволяет вывести информацию только об одном указанном коммите, это эвивалентно записи n -1. pretty=format задает вывод %H - хэш, %s - сообщение
```
stas@ubuntu-desk:~/git_terr$ git log -1 --pretty=format:"%H %s" aefea
aefead2207ef7e2aa5dc81a34aedf0cad4c32545 Update CHANGELOG.md
```
2. Ответьте на вопросы.

* Какому тегу соответствует коммит `85024d3`?
  -  tag: v0.12.23 - команда git log -1 85024d3
* Сколько родителей у коммита `b8d720`? Напишите их хеши.
  -  56cd7859e05c36c06b56d013b55a252d0bb7e158 9ea88f22fc6269854151c571162c5bcf958bee2b, 2 родителя. Как обычно в git есть множесто вариантов увидеть родителей, я выбрал самый короткий вывод - git log -1 --pretty=format:"%P" b8d720, можно так же git rev-list --parents -1 b8d720 или git cat-file -p b8d720 для большей наглядности
* Перечислите хеши и комментарии всех коммитов, которые были сделаны между тегами  v0.12.23 и v0.12.24.
```
stas@ubuntu-desk:~/git_terr$ git log --oneline v0.12.23..v0.12.24  
33ff1c03bb (tag: v0.12.24) v0.12.24  
b14b74c493 [Website] vmc provider links  
3f235065b9 Update CHANGELOG.md  
6ae64e247b registry: Fix panic when server is unreachable  
5c619ca1ba website: Remove links to the getting started guide's old location  
06275647e2 Update CHANGELOG.md  
d5f9411f51 command: Fix bug when using terraform login on Windows  
4b6d06cc5d Update CHANGELOG.md  
dd01a35078 Update CHANGELOG.md  
225466bc3e Cleanup after v0.12.23 release
```
* Найдите коммит, в котором была создана функция `func providerSource`, её определение в коде выглядит так: `func providerSource(...)` (вместо троеточия перечислены аргументы).
  - func providerSource(services *disco.Disco) - я использовал поиск с конца git log --reverse -S "func providerSource(", затем поиск в самом коммите git show 8c928e83589d90a031f811fae52a81be7153e82f | grep "func providerSource"
* Найдите все коммиты, в которых была изменена функция `globalPluginDirs`.
```
stas@ubuntu-desk:~/git_terr$ git log -S "globalPluginDirs" --oneline  
7c4aeac5f3 stacks: load credentials from config file on startup (#35952)  
65c4ba7363 Remove terraform binary  
125eb51dc4 Remove accidentally-committed binary  
22c121df86 Bump compatibility version to 1.3.0 for terraform core release (#30988)  
7c7e5d8f0a Don't show data while input if sensitive  
35a058fb3d main: configure credentials from the CLI config file  
c0b1761096 prevent log output during init  
8364383c35 Push plugin discovery down into command package
```
* Кто автор функции `synchronizedWriters`?
```
stas@ubuntu-desk:~/git_terr$ git log --reverse -S "synchronizedWriters"  
commit 5ac311e2a91e381e2f52234668b49ba670aa0fe5  
Author: Martin Atkins <mart@degeneration.co.uk>  
Date:   Wed May 3 16:25:41 2017 -0700  
  
    main: synchronize writes to VT100-faker on Windows
```
