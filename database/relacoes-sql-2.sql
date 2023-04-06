-- Active: 1679955875088@@127.0.0.1@3306

-- Práticas
CREATE TABLE users (
    id TEXT PRIMARY KEY NOT NULL UNIQUE,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    created_at TEXT DEFAULT(DATETIME('now', 'localtime')) NOT NULL
);

INSERT INTO users(id, name,email, password)
VALUES 
('u001','tonzera', 'tonzera@gmail.com', '12345'),
('u002','tutumaromba', 'tutumaromba@gmail.com', '12345'),
('u003','diefy', 'diefy@gmail.com', '12345');

SELECT * FROM users;

CREATE TABLE follows (
    follower_id TEXT NOT NULL,
    followed_id TEXT NOT NULL,
    FOREIGN KEY (follower_id) REFERENCES users(id),
    FOREIGN KEY (followed_id) REFERENCES users(id)
);

INSERT INTO follows (follower_id, followed_id)
VALUES
('u001', 'u002'),
('u001', 'u003'),
('u002', 'u001');

SELECT * FROM follows;

SELECT * FROM users
LEFT JOIN follows
ON follows.follower_id = users.id;

SELECT 
users.id,
users.name,
users2.name AS followed_name
 FROM users
LEFT JOIN follows
ON follows.follower_id = users.id
LEFT JOIN users AS users2
ON follows.followed_id = users2.id;