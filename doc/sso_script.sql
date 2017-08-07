--------------------------------------------
-- Export file for user SSO               --
-- Created by yohn on 2010/11/7, 19:51:19 --
--------------------------------------------

spool sso_script.log

prompt
prompt Creating table SSO_TICKET_REGISTRY
prompt ==================================
prompt
create table SSO_TICKET_REGISTRY
(
  SEQ_ID      NUMBER(38) not null,
  TICKET_ID   VARCHAR2(256) not null,
  TICKET      BLOB not null,
  TICKET_TYPE VARCHAR2(200) not null,
  CREATE_TIME DATE default sysdate,
  HOST_NAME      VARCHAR2(4000)
)
;
alter table SSO_TICKET_REGISTRY
  add constraint PK_SSO_TICKET_REGISTRY primary key (SEQ_ID);
create unique index IDX_SSO_TICKET_REGISTRY_U01 on SSO_TICKET_REGISTRY (TICKET_ID);

prompt
prompt Creating sequence S_SSO_ID
prompt ==========================
prompt
create sequence S_SSO_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 121
increment by 1
cache 20;


spool off
