DO $$
    BEGIN
        ALTER TABLE "doc_changes" ALTER COLUMN "change_date" SET DATA TYPE timestamp(6) without time zone;
        ALTER TABLE "task_result" ALTER COLUMN "last_open_date" SET DATA TYPE timestamp(6) without time zone;
        ALTER TABLE "task_result" ALTER COLUMN "created_at" DROP DEFAULT;
        ALTER TABLE "task_result" ALTER COLUMN "created_at" SET DATA TYPE timestamp(6) without time zone;
        ALTER TABLE "task_result" ALTER COLUMN "created_at" SET DEFAULT now();
    END;
$$