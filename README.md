## Вводная к ТЗ
>
    Сделать web api для взаимодействия с базой данных, в которой хранятся данные о видеоиграх, реализовать CRUD операции с ней, а также метод для получения списка игр определённого жанра.
    Информация о игре: название, студия разработчик, несколько жанров, которым соответствует игра.
    Используя любой фреймворк или без фреймворка.
    Действуя согласно SOLID MVC MVVM.
    Сделать минимум 3 слоя абстракций, а контроллеры "тонкими".

    используемые таблицы и схема связей в ./doc/data-games.dia
    описание API находится в каталоге задач ./doc/TZ
    postman коллекция для API в каталоге ./doc/apricode.postman_collection.json
    архив для сборки контейнеров для БД + инструменты управления БД в Web ./doc/2023-08-27-db-dev.zip
    список жанров игр - ./doc/ganres.json (seeders не реализовывался т.к. по ТЗ не нужно)
    копия БД с тестовыми записями - ./doc/2023-08-27.sql

### стек разработки и предустановленные пакеты
>
    docker + docker-compose + Nginx php-fpm + Laravel + postgres + Octane + pgadmin
    Nginx: в качестве баллансировщика и для статики (т.к. статика и баллансировка не требуется по ТЗ, то не используется и можно отключить)
    postgres ( PostgreSQL ) 14.3 ( Debian 14.3-1.pgdg110+1 )
    pgadmin
    php v8.2.9
    xdebug 3.2.2
    Laravel 10 + spatie/laravel-data (для DTO)

### используемые порты, ip
>
    php: внутренний 9000 / внешний 9010
    xdebug: отладка php 9008 / отладка по web 9003
    octane: внутренний 8000 / внешний 8010
    nginx: внутренни 80, 443 / внешний 80, 443
    postgres: внутренний 5432 / внешний 5432
    pgadmin: внутренний 80 / внешний 8082
    внешняя подсеть: 192.168.222.0/28
    postgres: 192.168.222.4
    локальный домен разработки: http://school.loc

### установка проекта в docker 
>
    проект настроен на структуру
        ./db-dev - каталог сборки контейнеров с БД + инструменты управления БД в Web
        ./name_project
            /src - каталог проекта Laravel

    предварительно выполнить
        распаковать 2023-08-27-db-dev.zip в каталог ./db-dev
        создать ./name_project -> src
        получить проект с github в ./name_project -> src
        cd ./name_project/src
        make up - сборка контейнера php-fpm + nginx + postgres + pgadmin
        все команды описаны в make файле
    
    выполнить миграции таблиц - php artisan migration

### роуты API (описание методов есть в контроллерах)
>
    GET|HEAD        api/developers developers.index › Component\StudioDevController@index
    POST            api/developers developers.store › Component\StudioDevController@store
    GET|HEAD        api/developers/{developer} developers.show › Component\StudioDevController@show
    PUT|PATCH       api/developers/{developer} developers.update › Component\StudioDevController@update
    DELETE          api/developers/{developer} developers.destroy › Component\StudioDevController@destroy
    GET|HEAD        api/games games.index › Component\GameController@index
    POST            api/games games.store › Component\GameController@store
    GET|HEAD        api/games/{game} games.show › Component\GameController@show
    PUT|PATCH       api/games/{game} games.update › Component\GameController@update
    DELETE          api/games/{game} games.destroy › Component\GameController@destroy
    GET|HEAD        api/genres genres.index › Component\GameGenreController@index
    POST            api/genres genres.store › Component\GameGenreController@store
    GET|HEAD        api/genres/{genre} genres.show › Component\GameGenreController@show
    PUT|PATCH       api/genres/{genre} genres.update › Component\GameGenreController@update
    DELETE          api/genres/{genre} genres.destroy › Component\GameGenreController@destroy
  

