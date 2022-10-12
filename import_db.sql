PRAGMA foreign_keys = ON;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS questions; 
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY NOT NULL,
    fname TEXT,
    lname TEXT
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY NOT NULL, 
    title TEXT, 
    body TEXT, 
    user_id INTEGER,

    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY NOT NULL,    
    user_id INTEGER, 
    question_id INTEGER, 
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY NOT NULL,
    reply TEXT,
    question_id INTEGER,
    user_id INTEGER,
    reply_id INTEGER,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (reply_id) REFERENCES replies(id)
);

CREATE TABLE question_likes(
    id INTEGER PRIMARY KEY NOT NULL,
    user_id INTEGER,
    question_id INTEGER,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);


INSERT INTO
    users (fname, lname)
VALUES
    ('kory', 'fitzgerald');
INSERT INTO
    users (fname, lname)
VALUES
    ('ethan', 'graham');
INSERT INTO
    users (fname, lname)
VALUES
    ('amin', 'barber');

INSERT INTO
    questions (title, body, user_id)
VALUES
    ('sequel', 'does sequel make any sense or is it just me?', (SELECT id FROM users WHERE fname = 'kory'));
INSERT INTO
    questions (title, body, user_id)
VALUES
    ('sequel', 'why?', (SELECT id FROM users WHERE lname = 'fitzgerald'));
INSERT INTO
    questions (title, body, user_id)
VALUES
    ('sequel', 'what is psql?', (SELECT id FROM users WHERE fname = 'ethan'));
INSERT INTO
    questions (title, body, user_id)
VALUES
    ('football', 'when is d''hop coming back?', (SELECT id FROM users WHERE lname = 'fitzgerald'));
INSERT INTO
    questions (title, body, user_id)
VALUES
    ('football', 'who''s winning the superbowl?', (SELECT id FROM users WHERE lname = 'graham'));
INSERT INTO
    questions (title, body, user_id)
VALUES
    ('football', 'what is football?', (SELECT id FROM users WHERE fname = 'amin'));
INSERT INTO
    questions (title, body, user_id)
VALUES
    ('sequel', 'you are all idiots this isnt a question', (SELECT id FROM users WHERE lname = 'amin'));

INSERT INTO 
    question_follows (user_id, question_id)
VALUES 
    ((SELECT id FROM users WHERE fname = 'amin'), (SELECT id FROM questions WHERE body = 'who''s winning the superbowl?'));

INSERT INTO 
    question_likes (user_id, question_id)
VALUES 
    ((SELECT id FROM users WHERE fname = 'ethan'), (SELECT id FROM questions WHERE body = 'who''s winning the superbowl?'));

INSERT INTO 
    replies (reply, question_id, user_id, reply_id)
VALUES 
    ("great reply idiot", (SELECT id FROM questions WHERE body = 'what is football?'), (SELECT id FROM users WHERE fname = "amin"), (SELECT id FROM replies WHERE reply_id = 3));
INSERT INTO 
    replies (reply, question_id, user_id, reply_id)
VALUES 
    ('blah blah blah blah blah', (SELECT id FROM questions WHERE body = 'who''s winning the superbowl?'), (SELECT id FROM users WHERE fname = "amin"), (SELECT id FROM replies WHERE reply_id = 2));
;


