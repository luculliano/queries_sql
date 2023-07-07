-- sample of 100 numbers as grouped
with sample as
	(select round(random() * 10) as value from generate_series(1, 100))
select
	(case
		when value between 0 and 2 then '0-3'
		when value between 3 and 5 then '3-5'
		when value between 6 and 8 then '6-8'
		else '9-11'
		end) as range_, count(value)
from sample group by range_;


-- filter в группах: join on нужные поля.
select distinct period_, year_, a.codename, a.sum_ from get_categories_dynamic_statistics() a join
	(select codename, min(sum_), max(sum_) from get_categories_dynamic_statistics() group by codename) b
		on a.codename = b.codename and (a.sum_ = b.min or a.sum_ = b.max) where period_ =
		(select min(period_) from get_categories_dynamic_statistics()) or period_ = (select max(period_) from get_categories_dynamic_statistics())
		order by codename;
