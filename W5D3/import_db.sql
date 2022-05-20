
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS replies;

PRAGMA foreign_keys = ON;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    parent_id INTEGER,
    replier_id  INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id)
    FOREIGN KEY (parent_id) REFERENCES replies(id)
    FOREIGN KEY (replier_id ) REFERENCES users(id)
   
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    liked_id INTEGER NOT NULL,
    liker_id INTEGER NOT NULL,
    
    FOREIGN KEY (liked_id) REFERENCES questions(id)
    FOREIGN KEY (liker_id) REFERENCES users(id)
);

INSERT INTO
    users(fname, lname)
VALUES 
    ("Eve", "Sam"),
    ("Aiden", "Soot"),
    ("Berry", "Kim"),
    ("Jimmy", "Chang"),
    ("Sarah", "Hang");

INSERT INTO
    questions(title, body, author_id)
VALUES
    ("What time is it?", "1140", (SELECT id FROM users WHERE fname = "Eve")),
    ("Where are you?", "App academy", (SELECT id FROM users WHERE fname = "Aiden")),
    ("What time is it now?", "1200", (SELECT id FROM users WHERE fname = "Berry")),
    ("am i broke?", "yes", (SELECT id FROM users WHERE fname = "Jimmy")),
    ("am i wasting time?", "you are probably wasting time", (SELECT id FROM users WHERE fname = "Sarah"));


INSERT INTO 
    replies(question_id, parent_id, replier_id )
VALUES
    (1, NULL ,3),
    (2, 1, 4),
    (1,1,5),
    (5,2,2);

INSERT INTO
    question_likes(liked_id, liker_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 1),
    (4, 1);

INSERT INTO
    question_follows(user_id, question_id)
VALUES
    (1,2),
    (2,4),
    (3,1),
    (4,3);


