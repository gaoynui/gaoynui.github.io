/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/4/25 11:09:52                           */
/*==============================================================*/


drop table if exists Reserve_Hotel;

drop table if exists customer;

drop table if exists hotel;

drop table if exists room;

drop table if exists �ҾƵ�;

/*==============================================================*/
/* Table: Reserve_Hotel                                         */
/*==============================================================*/
create table Reserve_Hotel
(
   IP                   tinyint not null,
   ������                  int,
   primary key (IP)
);

/*==============================================================*/
/* Table: customer                                              */
/*==============================================================*/
create table customer
(
   ����                   char(256) not null,
   IP                   tinyint,
   ���֤��                 int not null,
   ��ϵ�绰                 int not null,
   primary key (����),
   key AK_Identifier_2 ()
);

/*==============================================================*/
/* Table: hotel                                                 */
/*==============================================================*/
create table hotel
(
   �Ƶ���                  char(256) not null,
   IP                   tinyint,
   ��ַ��Ϣ                 char(256),
   ��ͨ��Ϣ                 char(256),
   primary key (�Ƶ���)
);

/*==============================================================*/
/* Table: room                                                  */
/*==============================================================*/
create table room
(
   ����                   char(256) not null,
   �Ƶ���                  char(256),
   �۸�                   float,
   primary key (����)
);

/*==============================================================*/
/* Table: �ҾƵ�                                                   */
/*==============================================================*/
create table �ҾƵ�
(
   ����                   char(256) not null,
   �Ƶ���                  char(256) not null,
   primary key (����, �Ƶ���)
);

alter table customer add constraint FK_���� foreign key (IP)
      references Reserve_Hotel (IP) on delete restrict on update restrict;

alter table hotel add constraint FK_�Ǽ� foreign key (IP)
      references Reserve_Hotel (IP) on delete restrict on update restrict;

alter table room add constraint FK_���з��� foreign key (�Ƶ���)
      references hotel (�Ƶ���) on delete restrict on update restrict;

alter table �ҾƵ� add constraint FK_�ҾƵ� foreign key (����)
      references customer (����) on delete restrict on update restrict;

alter table �ҾƵ� add constraint FK_�ҾƵ�2 foreign key (�Ƶ���)
      references hotel (�Ƶ���) on delete restrict on update restrict;

