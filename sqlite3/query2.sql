/*присвоение номеров значениям как вычисляемое поле*/
/*f CAST(col as type) для преоьразования типа, чтобы в рез-те не округлялось до целого,
поэтому одно поле надо к плавающему числу привести*/
SELECT tg_uid, tries, memes,
    (SELECT count(*) FROM users t1 WHERE t1.memes <= t2.memes) n,
    ROUND(CAST(memes AS REAL) / tries * 100, 2) perc FROM
    users t2 ORDER BY memes;

/*присвоение номеров значениям как вычисляемое поле в порядке вычислемого поля*/
/*f ROW_NUMBER исп для присвоение порядкого номера значению в заданном порядке*/
SELECT ROW_NUMBER() OVER (ORDER BY perc DESC, memes DESC) as row_number, * FROM
    (SELECT tg_uid, tries, memes, ROUND(CAST(memes AS REAL) / tries * 100, 2) perc FROM users);
