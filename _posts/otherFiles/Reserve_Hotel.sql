/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/4/25 11:09:52                           */
/*==============================================================*/


drop table if exists Reserve_Hotel;

drop table if exists customer;

drop table if exists hotel;

drop table if exists room;

drop table if exists 找酒店;

/*==============================================================*/
/* Table: Reserve_Hotel                                         */
/*==============================================================*/
create table Reserve_Hotel
(
   IP                   tinyint not null,
   访问量                  int,
   primary key (IP)
);

/*==============================================================*/
/* Table: customer                                              */
/*==============================================================*/
create table customer
(
   姓名                   char(256) not null,
   IP                   tinyint,
   身份证号                 int not null,
   联系电话                 int not null,
   primary key (姓名),
   key AK_Identifier_2 ()
);

/*==============================================================*/
/* Table: hotel                                                 */
/*==============================================================*/
create table hotel
(
   酒店名                  char(256) not null,
   IP                   tinyint,
   地址信息                 char(256),
   交通信息                 char(256),
   primary key (酒店名)
);

/*==============================================================*/
/* Table: room                                                  */
/*==============================================================*/
create table room
(
   房型                   char(256) not null,
   酒店名                  char(256),
   价格                   float,
   primary key (房型)
);

/*==============================================================*/
/* Table: 找酒店                                                   */
/*==============================================================*/
create table 找酒店
(
   姓名                   char(256) not null,
   酒店名                  char(256) not null,
   primary key (姓名, 酒店名)
);

alter table customer add constraint FK_访问 foreign key (IP)
      references Reserve_Hotel (IP) on delete restrict on update restrict;

alter table hotel add constraint FK_登记 foreign key (IP)
      references Reserve_Hotel (IP) on delete restrict on update restrict;

alter table room add constraint FK_空闲房间 foreign key (酒店名)
      references hotel (酒店名) on delete restrict on update restrict;

alter table 找酒店 add constraint FK_找酒店 foreign key (姓名)
      references customer (姓名) on delete restrict on update restrict;

alter table 找酒店 add constraint FK_找酒店2 foreign key (酒店名)
      references hotel (酒店名) on delete restrict on update restrict;

