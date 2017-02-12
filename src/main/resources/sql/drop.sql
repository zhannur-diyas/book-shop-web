ALTER TABLE "book" DROP CONSTRAINT IF EXISTS "book_fk0";

ALTER TABLE "book" DROP CONSTRAINT IF EXISTS "book_fk1";

ALTER TABLE "book" DROP CONSTRAINT IF EXISTS "book_fk2";

ALTER TABLE "book" DROP CONSTRAINT IF EXISTS "book_fk3";

ALTER TABLE "order" DROP CONSTRAINT IF EXISTS "order_fk0";

ALTER TABLE "order" DROP CONSTRAINT IF EXISTS "order_fk1";

ALTER TABLE "order" DROP CONSTRAINT IF EXISTS "order_fk2";

ALTER TABLE "order" DROP CONSTRAINT IF EXISTS "order_fk3";

ALTER TABLE "order" DROP CONSTRAINT IF EXISTS "order_fk4";

ALTER TABLE "order" DROP CONSTRAINT IF EXISTS "order_fk5";

ALTER TABLE "user" DROP CONSTRAINT IF EXISTS "user_fk0";

ALTER TABLE "user" DROP CONSTRAINT IF EXISTS "user_fk1";

ALTER TABLE "user" DROP CONSTRAINT IF EXISTS "user_fk2";

ALTER TABLE "userInfo" DROP CONSTRAINT IF EXISTS "userInfo_fk0";

ALTER TABLE "bookOrdered" DROP CONSTRAINT IF EXISTS "bookOrdered_fk0";

DROP TABLE IF EXISTS "book";

DROP TABLE IF EXISTS "language";

DROP TABLE IF EXISTS "author";

DROP TABLE IF EXISTS "domain";

DROP TABLE IF EXISTS "publisher";

DROP TABLE IF EXISTS "order";

DROP TABLE IF EXISTS "user";

DROP TABLE IF EXISTS "userInfo";

DROP TABLE IF EXISTS "gender";

DROP TABLE IF EXISTS "shippingAddress";

DROP TABLE IF EXISTS "bookOrdered";

DROP TABLE IF EXISTS "userRole";