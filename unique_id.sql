CREATE FUNCTION `unique_id`( id INT ) RETURNS varchar(5) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
    DETERMINISTIC
BEGIN
    DECLARE r1 VARCHAR(36) DEFAULT '389b67jznpme4lxot5yv2cdarhiwksufgq01';
 	DECLARE len INT DEFAULT CHAR_LENGTH(r1);
 	DECLARE lenHalf INT DEFAULT FLOOR(len / 2);
 	DECLARE lenSquared INT DEFAULT POW(len, 2);
 	DECLARE lenCubed INT DEFAULT POW(len, 3);
 	DECLARE lenFourth INT DEFAULT POW(len, 4);
 	DECLARE lenFifth INT DEFAULT POW(len, 5);
	DECLARE r2 VARCHAR(36) DEFAULT CONCAT(
		SUBSTRING(r1, 1 + lenHalf, len),
		SUBSTRING(r1, 1, lenHalf)
	);
	DECLARE r3 VARCHAR(36) DEFAULT CONCAT(
		REVERSE(SUBSTRING(r1, 1 + lenHalf, len)),
		SUBSTRING(r1, 1, lenHalf)
	);
	DECLARE r4 VARCHAR(36) DEFAULT CONCAT(
		SUBSTRING(r1, 1 + lenHalf, len),
		REVERSE(SUBSTRING(r1, 1, lenHalf))
	);
	DECLARE r5 VARCHAR(36) DEFAULT CONCAT(
		REVERSE(SUBSTRING(r1, 1 + lenHalf, len)),
		REVERSE(SUBSTRING(r1, 1, lenHalf))
	);
    DECLARE sn INT;
    DECLARE c0 INT;
    DECLARE c1 INT;
    DECLARE c2 INT;
    DECLARE c3 INT;
    DECLARE c4 INT; 
    DECLARE result VARCHAR(5);
	SET sn = id - 1; 
	IF sn - lenCubed >= 0 THEN
		SET sn = sn - lenCubed;
        IF sn < lenFourth THEN
            SET c0 = FLOOR(sn / lenCubed); 
            SET sn = sn % lenCubed;
            SET c1 = FLOOR(sn / lenSquared);
            SET sn = sn % lenSquared;
            SET c2 = FLOOR(sn / len);
            SET c3 = sn % len;
            SET result = CONCAT(
            	SUBSTRING(r3, 1 + c0, 1), 
            	SUBSTRING(r4, 1 + c1, 1), 
            	SUBSTRING(r1, 1 + c2, 1), 
            	SUBSTRING(r2, 1 + c3, 1)
            );
        	RETURN result;
        ELSE
            SET sn = sn - lenFourth;
            SET c0 = FLOOR(sn / lenFourth);
            SET sn = sn % lenFourth; 
            SET c1 = FLOOR(sn / lenCubed);
            SET sn = sn % lenCubed;
            SET c2 = FLOOR(sn / lenSquared); 
            SET sn = sn % lenSquared;
            SET c3 = FLOOR(sn / len);
            SET c4 = sn % len;
            SET result = CONCAT(
            	SUBSTRING(r4, 1 + c0, 1), 
            	SUBSTRING(r3, 1 + c1, 1), 
            	SUBSTRING(r5, 1 + c2, 1), 
            	SUBSTRING(r2, 1 + c3, 1), 
            	SUBSTRING(r1, 1 + c4, 1)
            );
        	RETURN result;
		END IF;
	ELSE
        SET c0 = FLOOR(sn / lenSquared); 
        SET sn = sn % lenSquared;
        SET c1 = FLOOR(sn / len);
        SET c2 = sn % len;
		SET result = CONCAT(
			SUBSTRING(r1, 1 + c0, 1), 
			SUBSTRING(r2, 1 + c1, 1), 
			SUBSTRING(r3, 1 + c2, 1)
		); 
        RETURN result;
	END IF;
END
