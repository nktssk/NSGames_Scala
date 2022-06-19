CREATE TABLE USERS
(
    ID           BIGSERIAL PRIMARY KEY,
    FIRST_NAME   VARCHAR NOT NULL,
    LAST_NAME    VARCHAR NOT NULL,
    PHONE_NUMBER VARCHAR NOT NULL UNIQUE,
    EMAIL        VARCHAR NOT NULL UNIQUE,
    PASSWORD     VARCHAR NOT NULL,
    STATE        VARCHAR NOT NULL,
    ROLE         VARCHAR NOT NULL,
    CONFIRM_CODE VARCHAR NULL
);

CREATE TABLE ARTICLE
(
    ID      BIGSERIAL PRIMARY KEY,
    USER_ID BIGSERIAL    NOT NULL REFERENCES USERS (ID) ON DELETE CASCADE,
    HEADER  VARCHAR(100) NOT NULL,
    BODY    VARCHAR      NOT NULL,
    VISIBLE BOOLEAN      NOT NULL
);

CREATE TABLE JWT
(
    ID           VARCHAR PRIMARY KEY,
    JWT          VARCHAR   NOT NULL,
    IDENTITY     BIGINT    NOT NULL REFERENCES USERS (ID) ON DELETE CASCADE,
    EXPIRY       TIMESTAMP NOT NULL,
    LAST_TOUCHED TIMESTAMP
);
