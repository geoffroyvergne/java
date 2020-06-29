-- Users / Roles
insert into user(id, name, login, password) values (1,'user','user','$2a$06$fnjWFUj1z/mlLGofyCsNouN1MLtdfTLygqRBhCLUcz4XAMBIaRJeS');
insert into user(id, name, login, password) values (2,'admin','admin','$2a$06$JsGFe3L4uHesbFHqbvq6we0Qpz8ZWTa/95YG09br9aLrLuj9oGCVO');
insert into user(id, name, login, password) values (3,'guest','guest','$2a$06$nJfxYGnsO1xTiL0H/bmvHO6UYp31dEva90kvJppDyOWZis2e1lDcy');

insert into role(id, name) values (1,'ROLE_USER');
insert into role(id, name) values (2,'ROLE_ADMIN');
insert into role(id, name) values (3,'ROLE_GUEST');

insert into user_role(user_id, role_id) values (1,1);
insert into user_role(user_id, role_id) values (2,1);
insert into user_role(user_id, role_id) values (2,2);
insert into user_role(user_id, role_id) values (3,3);
