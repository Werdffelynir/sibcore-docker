
# Установка insight-api insight-ui

## Клонировать рип

```bash
$ git clone https://github.com/Werdffelynir/sibcore-docker.git
$ cd ./sibcore-docker/composes
```


## Создать образ `sibcore`

```bash
$ cd ./sibcore
$ bash ./install.sh
```

При успешной установке, по завершении будет создана директория `volumes` 


## Создать образ `livenet`

```bash
$ cd ../livenet
$ bash ./install.sh
```

При успешной установке, создастца директория `volumes`.

#### Отредактировать файл `./volumes/livenet/bitcore-node.json`;

заменить
```json
  "services": [
    "bitcoind",
    "web"
  ],
```
на 
```json
  "services": [
    "bitcoind",
    "insight-api",
    "insight-ui",
    "web"
  ],
```

Также поменять значение поля "exec":

```json
    "exec": "/home/sibcore/.nvm/versions/node/v4.8.4/lib/node_modules/bitcore/node_modules/bitcore-node/bin/bitcoind"
```



#### Отредактировать файл `./volumes/livenet/package.json`

заменить
```json
  "dependencies": {
    "bitcore-lib": "git+https://git@github.com/Werdffelynir/bitcore-lib.git",
    "bitcore-node": "git+https://git@github.com/Werdffelynir/bitcore-node.git"
  }
```
на 
```json
  "dependencies": {
    "bitcore-lib": "git+https://git@github.com/Werdffelynir/bitcore-lib.git",
    "bitcore-node": "git+https://git@github.com/Werdffelynir/bitcore-node.git",
    "insight-api": "git+https://git@github.com/Werdffelynir/insight-api.git",
    "insight-ui": "git+https://git@github.com/Werdffelynir/insight-ui.git"
  }
```



## Запуск контейнера `livenet`

```bash
$ bash ./run.sh
```

Будет запущена нода, Интерфейс "insight-ui" доступен по адресу [http://0.0.0.0:3001/insight](http://0.0.0.0:3001/insight)
