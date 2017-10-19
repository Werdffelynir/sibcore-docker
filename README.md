# Инструкция 

> 
> Инструкция находится в режиме написания и тестировки.
> 


sibcore
livenet
testnet
db
bws
copay watcher
copay server
insight-ui watcher
insight-ui server

[Описание]


[Схема/Диаграма]



## Зависимости

Тестировалось на Ubuntu 16.04.

На локальной среде запуска образов должно быть установленно:

#### Библиотеки

```bash
$ apt-get install libzmq3-dev build-essential
```

#### Docker, Docker Engine 
[Install using the convenience script](https://docs.docker.com/engine/installation/linux/docker-ce/debian/#install-using-the-convenience-script)

Для удобства `get-docker.sh` скрипт установки находится в корневой директории этого рипа. 


#### NVM, NodeJS, NPM  
[Node Version Manager](https://github.com/creationix/nvm#install-script)

`get-nvm.sh` скрипт установки находится в корневой директории.

После установки NVM установить NodeJS версии 4.8.4. NPM установится вместе с NodeJS

```bash
$ nvm install 4.8.4
```


## Файлы исходников сборки образов 

Все файлы исходников сборки находятся в `./composes`. В каждой директории есть основные файлы:

- `Dockerfile` - конфигурация
- `install.sh` - скрипт создания образа
- `induct.sh` - скрипт внутренего выполнения
- `run.sh` - запуск контейнера, конечный запуск
- `volumes` - директория, создается в процессе унстализации, содержит общие файлы, и/или исходники.

## Установка

Последовательность создания/установки важна. 

Первым должен быть создан образ `sibcore`, его используют другие образы как основу.

### Скачать исходники сборки

Сделать клон [sibcore-docker](https://github.com/Werdffelynir/sibcore-docker/) с github

```bash
$ git clone https://github.com/Werdffelynir/sibcore-docker.git
$ cd ./sibcore-docker/composes
```

### Создание образа

Внимание! Действия одинаковы для каждого экземпляра, но начиная с sibcore

Соборка образа sibcore
```bash
$ cd ./sibcore
$ bash ./install.sh
```

При успешной установке, по завершении будет создана директория `volumes`


### Запуск контейнера

Действия одинаковы для каждого экземпляра.+

```bash
$ cd ./sibcore
$ bash ./run.sh
```



### Файлы compose. Комбинация образов

Для упрощения запуска среды подготовлены файлы 
`docker-compose.yml`
`docker-compose-livenet.yml`
`docker-compose-testnet.yml`


