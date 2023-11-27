USE onlyoffice;
GO

DECLARE @nameOfDefaultDatetimeConstraint NVARCHAR(100)
SELECT @nameOfDefaultDatetimeConstraint = c.name
FROM sys.default_constraints c
JOIN sys.objects o ON o.object_id = c.parent_object_id
WHERE o.name = 'task_result' AND c.definition = '(getdate())';

EXECUTE('alter table task_result drop constraint ' + @nameOfDefaultDatetimeConstraint);
GO

ALTER TABLE task_result ALTER column created_at DATETIME2(6) NOT NULL;
ALTER TABLE task_result ADD CONSTRAINT DF_task_result_created_at DEFAULT CURRENT_TIMESTAMP FOR created_at;
ALTER TABLE task_result ALTER column last_open_date DATETIME2(6) NOT NULL;
ALTER TABLE doc_changes ALTER column change_date DATETIME2(6) NOT NULL;
GO