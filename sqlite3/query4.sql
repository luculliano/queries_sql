/*Составной ключ - primary key, состоящий из нескольких полей. Это альтернаятива constraint unique как в пред. запросе.
PK-исп. для связи с др. таблицами, уникольное значение имеет для записи в т.ч. не нулевое.
В т.ч. можно задать в конце:
...,
PRIMARY KEY (name_id) или (name_id, one_more_column)
 */
 create table book_pages(
    book_id integer,
    page_number integer,
    page_text text,
    primary key (book_id, page_number)  /*составной перв. ключ - гарантир. уникальность обеих значений*/
);
