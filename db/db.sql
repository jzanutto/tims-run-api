create table USERS (
    name varchar(50) not null,
    token varchar(255) not null,
    uid int not null primary key auto_increment
);

create table ORDERS (
    orid int not null primary key auto_increment
    item varchar(255) not null,
    size varchar(10) not null,
    price decimal(10) not null,
    details varchar(255) not null
);

create table GROUPS (
    gid int not null primary key auto_increment,
    name varchar(255) not null
);

create table OWNING (
    balance decimal(10) not null,
    from_uid int not null,
    to_uid int not null,

    primary key (from_uid, to_uid),

    FOREIGN KEY (from_uid) REFERENCES USERS(uid),
    FOREIGN KEY (to_uid) REFERENCES USERS(uid)
);

create table REQUESTS (
    gid int not null,
    orid int not null,
    uid int not null,
    primary key (gid, orid, uid)
);

create table USERGROUPS (
    name varchar(255) not null,
    uid int not null,
    gid int not null,

    primary key(uid, gid),
    FOREIGN KEY (uid) REFERENCES USERS(uid),
    FOREIGN KEY (gid) REFERENCES GROUPS(gid)
);
