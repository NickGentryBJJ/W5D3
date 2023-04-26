PRAGMA foreign_keys = ON;

DROP TABLE if exists users;
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL,
);

DROP TABLE if exists questions;
CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
);

DROP TABLE if exists question_follows;
CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    
    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (questions_id) REFERENCES questions(id),
);

DROP TABLE if exists replies;
CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    body TEXT NOT NULL,

    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
    FOREIGN KEY (questions_id) REFERENCES questions(id),

);

DROP TABLE IF EXISTS question_likes;
CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (questions_id) REFERENCES questions(id),

);