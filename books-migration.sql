USE books_db;

DROP TABLE IF EXISTS books;

CREATE TABLE IF NOT EXISTS books (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  author VARCHAR(100) NOT NULL DEFAULT 'Unknown',
  date_published DATE NOT NULL,
  description TEXT,
  bestseller_weeks INT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
);