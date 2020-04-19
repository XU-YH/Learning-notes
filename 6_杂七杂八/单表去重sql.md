# 单表去重sql

```sql
# 创建学生表
CREATE TABLE student ( 
	id BIGINT ( 20 ) PRIMARY KEY auto_increment, 
	name VARCHAR ( 10 ), 
	age INT ( 3 )
);
```

## 1、distinct

返回distinct后的字段都不重复的记录，如：distinct name, age，只会查询出name和age这两个字段的记录且不重复。

```sql
select distinct * from student;
select distinct name from student;
select distinct name, age from student;
```

## 2、group by

表拥有唯一性主键的情况下使用

```sql
# 查询，只保留最大id记录
select *
from student
where id in (
	select max(id)
	from student
	group by name, age
);
# 查询全部重复记录
select *
from student
where id not in (
	select min(id)
	from student
	group by name, age
	having count(name) < 2
);
# 查询所有重复记录中非最大id的记录，查询出多余的重复记录
select *
from student
where id not in (
	select max(id)
	from student
	group by name, age
);
# 删除多余的重复记录，只保留最大id（最新）的记录
delete from student
where id not in (
	select maxId from (
		select max(id) maxId
		from student
		group by name, age
	) s
);
```

## 3、自关联

自关联和group by感觉差不多

```sql
# 查询全部重复记录
select * 
from student a 
where (
	select count(1) num 
	from student b 
	where a.name = b.name
	and a.age = b.age
) > 1;
# 查询非重复记录
select * 
from student a 
where (
	select count(1) num 
	from student b 
	where a.name = b.name
	and a.age = b.age
) = 1;
# 查询，只保留最大id记录
select * 
from student a 
where id = (
	select max(id)
	from student b 
	where a.name = b.name
	and a.age = b.age
);
# 查询所有重复记录中非最大id的记录，查询出多余的重复记录
select * 
from student a 
where id != (
	select max(id)
	from student b 
	where a.name = b.name
	and a.age = b.age
);
# 删除多余的重复记录，只保留最大id（最新）的记录
delete from student 
where id = (
	select id from (
		select id 
		from student a 
		where id != (
			select max(id)
			from student b 
			where a.name = b.name
			and a.age = b.age
		)
	) s
);
```

这种关联方式，在两个不同的表中找相同数据也很好用

```sql
# 查询a表所有记录，且name在b表中不存在
select * from a where (select count(1) as num from b where a.name=b.name)=0;
select distinct aa.* from a aa left join b bb on aa.name = bb.name where bb.name is null;
# 查询a表所有记录且name在b表中存在
select * from a where (select count(1) as num from b where a.name=b.name)>0;
```

## 4、临时表