
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS post;
DROP TABLE IF EXISTS eventt;

CREATE TABLE organization (
 org_id INTEGER PRIMARY KEY AUTOINCREMENT,
 
 orgname TEXT NOT NULL,
 email TEXT UNIQUE NOT NULL,
 username TEXT UNIQUE NOT NULL,
 bio TEXT NOT NULL,
 password TEXT NOT NULL
);
 
CREATE TABLE post (
 post_id INTEGER PRIMARY KEY AUTOINCREMENT,
 org_id INTEGER NOT NULL,
 
 created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 post_title TEXT NOT NULL,
 post_body TEXT NOT NULL,
 FOREIGN KEY (org_id) REFERENCES organization (org_id)
);
 
CREATE TABLE eventt (
 eventt_id INTEGER PRIMARY KEY AUTOINCREMENT,
 org_id INTEGER NOT NULL,
 
 eventt_title TEXT NOT NULL,
 eventt_date TEXT NOT NULL,
 eventt_location TEXT NOT NULL,
 eventt_summary TEXT NOT NULL,
 eventt_price INTEGER NOT NULL,
 FOREIGN KEY (org_id) REFERENCES organization (org_id)
 
);
 
