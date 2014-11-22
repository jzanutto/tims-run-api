create table USERS (
    name varchar(50) not null,
    token varchar(255) not null,
    uid int not null primary key
);

create table ORDERS (
    item varchar(255) not null,
    size varchar(10) not null,
    price decimal(10) not null,
    details varchar(255) not null
);

create table GROUPS (
    gid int not null,
    name varchar(255) not null,

    primary key (gid)
);

create table OWNING (
    balance decimal(10) not null,
    from_uid int not null,
    to_uid int not null,

    primary key (from_uid, to_uid),

    FOREIGN KEY (from_uid) REFERENCES USERS(uid),
    FOREIGN KEY (to_uid) REFERENCES USERS(uid)
);


create table USERGROUPS (
    name varchar(255) not null,
    uid int not null,
    gid int not null,

    primary key(uid, gid),
    FOREIGN KEY (uid) REFERENCES USERS(uid),
    FOREIGN KEY (gid) REFERENCES GROUPS(gid)
);
