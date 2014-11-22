create database if not exists mydb;

use mydb;

create table if not exists USERS (
    name varchar(50) not null,
    email varchar(255) not null,
    token varchar(255) not null,
    uid int not null primary key auto_increment
);

create table if not exists ORDERS (
    orid int not null primary key auto_increment,
    item varchar(255) not null,
    size varchar(10) not null,
    price decimal(5,2) not null,
    details varchar(255) not null
);

create table if not exists GROUPS (
    gid int not null primary key auto_increment,
    name varchar(255) not null
);
-- GET FUCKING OWNED
create table if not exists OWNING (
    balance decimal(5,2) not null,
    from_uid int not null,
    to_uid int not null,

    primary key (from_uid, to_uid),

    FOREIGN KEY (from_uid) REFERENCES USERS(uid),
    FOREIGN KEY (to_uid) REFERENCES USERS(uid)
);

create table if not exists REQUESTS (
    gid int not null,
    orid int not null,
    uid int not null,
    primary key (gid, orid, uid)
);

create table if not exists USERGROUPS (
    name varchar(255) not null,
    uid int not null,
    gid int not null,

    primary key(uid, gid),
    FOREIGN KEY (uid) REFERENCES USERS(uid),
    FOREIGN KEY (gid) REFERENCES GROUPS(gid)
);
