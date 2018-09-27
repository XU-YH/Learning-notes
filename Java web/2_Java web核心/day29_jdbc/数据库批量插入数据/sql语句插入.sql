DROP PROCEDURE IF EXISTS proc_initData;--如果存在此存储过程则删掉
DELIMITER $
CREATE PROCEDURE proc_initData()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i<=100000 DO
        INSERT INTO text VALUES(i,CONCAT('姓名',i),'XXXXXXXXX');
        SET i = i+1;
    END WHILE;
END $
CALL proc_initData();