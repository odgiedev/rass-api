/*
  Warnings:

  - You are about to alter the column `platform` on the `reviews` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_reviews" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "author" TEXT NOT NULL,
    "link" TEXT NOT NULL,
    "platform" INTEGER NOT NULL,
    "rate" INTEGER NOT NULL,
    "feedback" TEXT
);
INSERT INTO "new_reviews" ("author", "feedback", "id", "link", "platform", "rate", "title") SELECT "author", "feedback", "id", "link", "platform", "rate", "title" FROM "reviews";
DROP TABLE "reviews";
ALTER TABLE "new_reviews" RENAME TO "reviews";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
