-- User Table
CREATE TABLE User (
    userId BIGSERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) CHECK (role IN ('ADMIN', 'READER')) NOT NULL
);

-- Category Table
CREATE TABLE Category (
    categoryId BIGSERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- Article Table
CREATE TABLE Article (
    articleId BIGSERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    dateCreation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    authorId BIGINT REFERENCES User(userId) ON DELETE CASCADE,
    categoryId BIGINT REFERENCES Category(categoryId) ON DELETE SET NULL
);

-- Tag Table
CREATE TABLE Tag (
    tagId BIGSERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Article_Tag Table (N to N relationship between Article and Tag)
CREATE TABLE ArticleTag (
    articleId BIGINT REFERENCES Article(article_id) ON DELETE CASCADE,
    tagId BIGINT REFERENCES Tag(tag_id) ON DELETE CASCADE,
    PRIMARY KEY (article_id, tag_id)
);

-- Comment Table
CREATE TABLE Comment (
    commentId BIGSERIAL PRIMARY KEY,
    comment TEXT NOT NULL,
    dateCreation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    userId BIGINT REFERENCES User(userId) ON DELETE CASCADE,
    articleId BIGINT REFERENCES Article(articleId) ON DELETE CASCADE
);

-- View Table
CREATE TABLE View (
    viewId BIGSERIAL PRIMARY KEY,
    dateView TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    visitorIp VARCHAR(45)  -- Supports both IPv4 and IPv6
    articleId BIGINT REFERENCES Article(articleId) ON DELETE CASCADE,
);
