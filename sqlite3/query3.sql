/*
ALTER TABLE some_table - исп. для изменения структуры таблицы: внешних ключей, названия таблицы, столбца, типа поля, привилегий на таблицу.
CONSTRAINT - ограничения/правила, накладываются на столбцы в таблице или целые таблицы, чтобы сохр. целовстность данных. Т.е. например у поля
добавим unique, not null, check или primary key.
*/
create table if not exists users(
    users_id integer primary key autoincrement,
    tg_uid integer unique not null,
    cur_page integer,
    constraint positive_value check(0 < cur_page and cur_page <= 300),
);

create table if not exists bookmarks(
    bookmarks_id integer primary key autoincrement,
    page_number integer,
    users_id integer,
    constraint unique_user_page_number unique(page_number, users_id), /*уникальное правило*/
    constraint positive_value check(0 < page_number and page_number <= 300),
    foreign key (users_id) references users(users_id)
    on delete cascade  /*удаление пользователя удалит все с ним записи здесь*/
);

/*/start*/
INSERT INTO users(tg_uid, cur_page)
values (123423425, 1);

/*forward and backword*/
UPDATE users SET cur_page = cur_page + 1 WHERE tg_uid = 2;

/*в начало*/
UPDATE users SET cur_page = 1 WHERE tg_uid = 2;

/*/addbookmark*/
INSERT INTO bookmarks(page_number, users_id)
SELECT cur_page, users_id from users WHERE tg_uid = 1;

/*/deletebookmark (edit_bookmark: delete or cancel)*/
DELETE FROM bookmarks WHERE users_id = (SELECT users_id from users WHERE tg_uid = 1) and page_number = 12;

/*show boomarks*/
SELECT page_number from bookmarks WHERE users_id == (SELECT users_id from users WHERE tg_uid = 1);
