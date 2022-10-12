CREATE TABLE users (
    id INTEGER PRIMARY KEY NOT NULL,
    fname TEXT,
    lname TEXT,
    question_id INTEGER NOT NULL,
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY NOT NULL, 
    title TEXT, 
    body TEXT, 
    user_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY NOT NULL,    
    user_id INTEGER NOT NULL, 
    question_id INTEGER NOT NULL, 
    
    FOREIGN KEY (user_id) REFERENCES users(id)
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY NOT NULL,
    body TEXT,
    question_id INTEGER NOT NULL,
    reply_id INTEGER,
    user_id INTEGER NOT NULL,


    FOREIGN KEY (question_id) REFERENCES questions(id)
    FOREIGN KEY (reply_id) REFERENCES replies(id)
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_likes(
    id INTEGER PRIMARY KEY NOT NULL,
    user_id INTEGER NOT NULL,
    question_id INTEGER,

    FOREIGN KEY (user_id) REFERENCES users(id)
    FOREIGN KEY (question_id) REFERENCES questions(id)
)



