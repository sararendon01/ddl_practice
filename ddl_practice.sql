USE srendon4;
ALTER DATABASE srendon4 CHARACTER SET utf8 COLLATE utf8_unicode_ci;
DROP TABLE IF EXISTS articleTag;
DROP TABLE IF EXISTS article;
DROP TABLE IF EXISTS tag;
DROP TABLE IF EXISTS author;

CREATE TABLE author(
	authorId BINARY(16) NOT NULL,
	authorActivationToken CHAR(32),
	authorAvatarUrl VARCHAR (128),
	authorEmail VARCHAR (128) NOT NULL,
	authorHash CHAR(97) NOT NULL,
	authorUsername VARCHAR (32) NOT NULL,
	UNIQUE(authorEmail),
	UNIQUE(authorUsername),
	INDEX(authorEmail),
	PRIMARY KEY(authorId)
);

CREATE TABLE tag(
	tagId BINARY(16) NOT NULL,
	tagName VARCHAR(32) NOT NULL,
	PRIMARY KEY (tagId)
);


CREATE TABLE article(
	articleId BiNARY(16) NOT NULL,
	articleAuthorId BINARY(16) NOT NULL,
	articleContent VARCHAR(4000)NOT NULL,
	articleDate DATETIME(6)NOT NULL,
	articleImage VARCHAR(225),
	INDEX(articleAuthorId),
	FOREIGN KEY(articleAuthorId) REFERENCES author(authorId),
	PRIMARY KEY(articleId)
);

	/* weak entity */
	CREATE TABLE articleTag(
	articleTagArticleId BINARY(16) NOT NULL,
	articleTagTagId BINARY(16) NOT NULL,
	INDEX(articleTagArticleId),
	INDEX(articleTagArticleId),
	FOREIGN KEY(articleTagArticleId) REFERENCES article(articleId),
	FOREIGN KEY(articleTagTagId) REFERENCES tag(tagId),
	PRIMARY KEY(articleTagArticleId, articleTagTagId)
);