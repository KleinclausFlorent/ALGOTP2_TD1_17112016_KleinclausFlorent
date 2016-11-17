create schema BANQUE;
create dbspace SP_BANQUE;

create  table CLIENT ( NUMCLIENT char (12) not null,
									NOM char (38) not null,
									PRENOM char (38) not null,
									ADRESSE char (60) not null,
								primary key (NUMCLIENT))
								in SP_BANQUE;
									
create table COMPTE ( NUMCOMPTE char (12) not null,
									 SOLDE decimal  (12) not null,
								primary key (NUMCOMPTE))
								in SP_BANQUE;
									 
create table CONTRAT ( NUMCONTRAT char (12) not null,
									   NUMCLIENT char (12) not null,
									   NUMCOMPTE char (12) not null,
									primary key (NUMCONTRAT),
									foreign key (NUMCLIENT) references CLIENT
									 on delete no action on update cascade,
									foreign key (NUMCOMPTE) references COMPTE
									 on delete no action on update cascade)
									in SP_BANQUE;
									
create table OPERATION_COMPTE ( NUMOPE char (12) not null,
														DATEOPE date not null,
														MONTANT decimal (12) not null,
														NUMCOMPTE char (12) not null,
													primary key (NUMOPE),
													foreign key (NUMCOMPTE) references COMPTE
													 on delete no action on update cascade)
													IN SP_BANQUE;
													
create unique index XCLI_NUMCLIENT on CLIENT(NUMCLIENT);
create unique index XCOMPTE_NUMCOMPTE on COMPTE(NUMCOMPTE);
create unique index XCONTRAT_NUMCONTRAT on CONTRAT(NUMCONTRAT);
create unique index XOPE_NUMOPE on OPERATION_COMPTE(NUMOPE);