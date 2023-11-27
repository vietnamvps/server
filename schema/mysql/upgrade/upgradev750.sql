DELIMITER DLM00

DROP PROCEDURE IF EXISTS upgrade750 DLM00

CREATE PROCEDURE upgrade750()
BEGIN
	SET SQL_SAFE_UPDATES=0;
	ALTER TABLE `task_result` CHANGE COLUMN `last_open_date` `last_open_date` datetime(6) NOT NULL;
    ALTER TABLE `task_result` CHANGE COLUMN `created_at` `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6);
    ALTER TABLE `doc_changes` CHANGE COLUMN `change_date` `change_date` datetime(6) NOT NULL;
	SET SQL_SAFE_UPDATES=1;
END DLM00

CALL upgrade750() DLM00

DELIMITER ;