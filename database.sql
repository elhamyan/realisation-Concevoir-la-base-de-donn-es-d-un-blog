create database  Blog_Solicode;
use Blog_Solicode;
create table user(
id_user int primary key auto_increment,
nom varchar(45) not null,
prenom varchar(45) not null,
email varchar(45) not null unique,
mot_de_pass varchar(45) not null
);
create table categorie(
id_categorie int primary key auto_increment,
nom varchar(45) not null
);
create table commente(
id_commente int primary key auto_increment,
contenu text not null,
date_pub date not null,
id_utilisateur  int,
foreign key (id_utilisateur) references user(id_user)
);

create table post (
id_post int primary key auto_increment,
titre varchar(45) not null,
contenu text not null,
date_pub date,
statu enum ('publier,brouillon') ,
id_utilisateur int,
foreign key (id_utilisateur) references  user (id_user),
id_catg int,
foreign key (id_catg) references categorie(id_categorie),
id_commentaire int ,
foreign key (id_commentaire) references commente(id_commente)
);
alter table user comment = 'table des utilisateur du blog';
create index idx_email on user(email);