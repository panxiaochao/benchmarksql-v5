create table bmsql_config (
  cfg_name    varchar(30) not null primary key,
  cfg_value   varchar(50) null
);

create table bmsql_warehouse (
  w_id        integer   not null,
  w_ytd       decimal(12,2) null,
  w_tax       decimal(4,4) null,
  w_name      varchar(10) null,
  w_street_1  varchar(20) null,
  w_street_2  varchar(20) null,
  w_city      varchar(20) null,
  w_state     char(2) null,
  w_zip       char(9) null
);

create table bmsql_district (
  d_w_id       integer       not null,
  d_id         integer       not null,
  d_ytd        decimal(12,2) null,
  d_tax        decimal(4,4) null,
  d_next_o_id  integer null,
  d_name       varchar(10) null,
  d_street_1   varchar(20) null,
  d_street_2   varchar(20) null,
  d_city       varchar(20) null,
  d_state      char(2) null,
  d_zip        char(9) null
);

create table bmsql_customer (
  c_w_id         integer        not null,
  c_d_id         integer        not null,
  c_id           integer        not null,
  c_discount     decimal(4,4) null,
  c_credit       char(2) null,
  c_last         varchar(16) null,
  c_first        varchar(16) null,
  c_credit_lim   decimal(12,2) null,
  c_balance      decimal(12,2) null,
  c_ytd_payment  decimal(12,2) null,
  c_payment_cnt  integer null,
  c_delivery_cnt integer null,
  c_street_1     varchar(20) null,
  c_street_2     varchar(20) null,
  c_city         varchar(20) null,
  c_state        char(2) null,
  c_zip          char(9) null,
  c_phone        char(16) null,
  c_since        timestamp null,
  c_middle       char(2) null,
  c_data         varchar(500)
);

create table bmsql_history (
  h_c_id   integer null,
  h_c_d_id integer null,
  h_c_w_id integer null,
  h_d_id   integer null,
  h_w_id   integer null,
  h_date   timestamp null,
  h_amount decimal(6,2) null,
  h_data   varchar(24) null
);

create table bmsql_new_order (
  no_w_id  integer   not null,
  no_d_id  integer   not null,
  no_o_id  integer   not null
);

create table bmsql_oorder (
  o_w_id       integer      not null,
  o_d_id       integer      not null,
  o_id         integer      not null,
  o_c_id       integer null,
  o_carrier_id integer null,
  o_ol_cnt     integer null,
  o_all_local  integer null,
  o_entry_d    timestamp null
);

create table bmsql_order_line (
  ol_w_id         integer   not null,
  ol_d_id         integer   not null,
  ol_o_id         integer   not null,
  ol_number       integer   not null,
  ol_i_id         integer   not null,
  ol_delivery_d   timestamp null,
  ol_amount       decimal(6,2) null,
  ol_supply_w_id  integer null,
  ol_quantity     integer null,
  ol_dist_info    char(24) null
);

create table bmsql_item (
  i_id     integer      not null,
  i_name   varchar(24) null,
  i_price  decimal(5,2) null,
  i_data   varchar(50) null,
  i_im_id  integer
);

create table bmsql_stock (
  s_w_id       integer       not null,
  s_i_id       integer       not null,
  s_quantity   integer null,
  s_ytd        integer null,
  s_order_cnt  integer null,
  s_remote_cnt integer null,
  s_data       varchar(50) null,
  s_dist_01    char(24) null,
  s_dist_02    char(24) null,
  s_dist_03    char(24) null,
  s_dist_04    char(24) null,
  s_dist_05    char(24) null,
  s_dist_06    char(24) null,
  s_dist_07    char(24) null,
  s_dist_08    char(24) null,
  s_dist_09    char(24) null,
  s_dist_10    char(24) null
);
