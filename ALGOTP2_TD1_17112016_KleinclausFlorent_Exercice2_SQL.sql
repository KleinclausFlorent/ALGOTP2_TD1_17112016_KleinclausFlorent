create schema MAGASIN;
create dbspace SP_MAGASIN;

create  table CLIENT ( NUMCLIENT char (12) not null,
									NOM char (38) not null,
									PRENOM char (38) not null,
									ADRESSE char (60) not null,
								primary key (NUMCLIENT))
								in SP_MAGASIN;
									
create table COMMANDE ( NUMCOM char (12) not null,
										  ADRESSELIV char (60) not null,
										  NUMCLIENT char (12) not null,
								primary key (NUMCOM),
								foreign key (NUMCLIENT) references CLIENT
								 on delete no action on update cascade)
								in SP_MAGASIN;
									 
create table PRODUIT (  REF_PROD char (12) not null,
									   LIBELLE char (12) not null,
									   PRIXU decimal (12) not null,
									primary key (REF_PROD))
									in SP_MAGASIN;
									
create table LOT ( NUMCOM char (12) not null,
							  REF_PROD char (12) not null,
							  QUANTITE decimal (12) not null,
							primary key (NUMCOM,REF_PROD),
							foreign key (NUMCOM) references COMMANDE
							 on delete no action on update cascade,
							foreign key (REF_PROD) references PRODUIT
							 on delete no action on update cascade)
													IN SP_MAGASIN;
													
create unique index XCLI_NUMCLIENT on CLIENT(NUMCLIENT);
create unique index XCOMMANDE_NUMCOM on COMPTE(NUMCOM);
create unique index XPRODUIT_REF_PROD on PRODUIT(REF_PROD);