/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     24/01/2022 11:00:57                          */
/*==============================================================*/


/*drop index RELATIONSHIP_10_FK;

drop index ANO_BIBLIOTECARIO_PK;

drop table ANO_BIBLIOTECARIO;

drop index BIBLIOTECARIO_PK;

drop table BIBLIOTECARIO;

drop index CLIENTE_PK;

drop table CLIENTE;

drop index TIENE_FK;

drop index EJEMPLAR_PK;

drop table EJEMPLAR;

drop index LIBRO_PK;

drop table LIBRO;

drop index RELATIONSHIP_8_FK;

drop index RELATIONSHIP_3_FK;

drop index RELATIONSHIP_2_FK;

drop index PRESTAMO_PK;

drop table PRESTAMO;

drop index PROVEEDORES_PK;

drop table PROVEEDORES;

drop index RELATIONSHIP_5_FK;

drop index RELATIONSHIP_11_FK;

drop index RELATIONSHIP_5_PK;

drop table RELATIONSHIP_5;

drop index RELATIONSHIP_7_FK;

drop index RELATIONSHIP_12_FK;

drop index RELATIONSHIP_7_PK;

drop table RELATIONSHIP_7;

drop index RELATIONSHIP_9_FK;

drop index RELATIONSHIP_6_FK;

drop index SERVICIO_VISITA_PK;

drop table SERVICIO_VISITA;*/

/*==============================================================*/
/* Table: ANO_BIBLIOTECARIO                                     */
/*==============================================================*/
create table ANO_BIBLIOTECARIO (
   ID_ANO               SERIAL               not null,
   ID_BIBLIOTECARIO     INT4                 not null,
   ANOS_BIBLIOTECARIO   VARCHAR(9)           not null,
   constraint PK_ANO_BIBLIOTECARIO primary key (ID_ANO)
);

/*==============================================================*/
/* Index: ANO_BIBLIOTECARIO_PK                                  */
/*==============================================================*/
create unique index ANO_BIBLIOTECARIO_PK on ANO_BIBLIOTECARIO (
ID_ANO
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_10_FK on ANO_BIBLIOTECARIO (
ID_BIBLIOTECARIO
);

/*==============================================================*/
/* Table: BIBLIOTECARIO                                         */
/*==============================================================*/
create table BIBLIOTECARIO (
   ID_BIBLIOTECARIO     SERIAL               not null,
   CI_BIBLIOTECARIO     VARCHAR(10)          not null,
   NOMBRE_BIBLIOTECARIO VARCHAR(50)          not null,
   APELLIDO_BIBLIOTECARIO VARCHAR(50)          not null,
   constraint PK_BIBLIOTECARIO primary key (ID_BIBLIOTECARIO)
);

/*==============================================================*/
/* Index: BIBLIOTECARIO_PK                                      */
/*==============================================================*/
create unique index BIBLIOTECARIO_PK on BIBLIOTECARIO (
ID_BIBLIOTECARIO
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           SERIAL               not null,
   NOMBRE_CLIENTE       VARCHAR(50)          not null,
   CI_CLIENTE           VARCHAR(10)          not null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
ID_CLIENTE
);

/*==============================================================*/
/* Table: EJEMPLAR                                              */
/*==============================================================*/
create table EJEMPLAR (
   ID_EJEMPLAR          SERIAL               not null,
   ID_LIBRO             INT4                 not null,
   CODIGO_EJEMPLAR      VARCHAR(5)           not null,
   ASPECTO_EJEMPLAR     VARCHAR(7)           not null,
   ESTADO               VARCHAR(7)           not null,
   FECHA_BAJA           DATE                 null,
   constraint PK_EJEMPLAR primary key (ID_EJEMPLAR)
);

/*==============================================================*/
/* Index: EJEMPLAR_PK                                           */
/*==============================================================*/
create unique index EJEMPLAR_PK on EJEMPLAR (
ID_EJEMPLAR
);

/*==============================================================*/
/* Index: TIENE_FK                                              */
/*==============================================================*/
create  index TIENE_FK on EJEMPLAR (
ID_LIBRO
);

/*==============================================================*/
/* Table: LIBRO                                                 */
/*==============================================================*/
create table LIBRO (
   ID_LIBRO             SERIAL               not null,
   NOMBRE_LIBRO         VARCHAR(1024)        not null,
   VERSION_LIBRO        VARCHAR(5)           not null,
   AUTOR                VARCHAR(100)         not null,
   ISBN                 VARCHAR(17)          not null,
   EDITORIAL_LIBRO      VARCHAR(50)          not null,
   NO_EJEMPLARES        NUMERIC              not null,
   VERSION_DIGITAL      VARCHAR(2)           not null,
   constraint PK_LIBRO primary key (ID_LIBRO)
);

/*==============================================================*/
/* Index: LIBRO_PK                                              */
/*==============================================================*/
create unique index LIBRO_PK on LIBRO (
ID_LIBRO
);

/*==============================================================*/
/* Table: PRESTAMO                                              */
/*==============================================================*/
create table PRESTAMO (
   ID_PRESTAMO          SERIAL               not null,
   ID_EJEMPLAR          INT4                 not null,
   ID_CLIENTE           INT4                 not null,
   ID_BIBLIOTECARIO     INT4                 not null,
   FECHA_PRESTAMO       DATE                 not null,
   FECHA_ENTREGA        DATE                 null,
   PENALIZACION         DECIMAL(5)           null,
   APECTO_ENTREGA       VARCHAR(7)           null,
   OBSERVACIONES        VARCHAR(500)         null,
   COSTO_PRESTAMO       DECIMAL              not null,
   constraint PK_PRESTAMO primary key (ID_PRESTAMO)
);

/*==============================================================*/
/* Index: PRESTAMO_PK                                           */
/*==============================================================*/
create unique index PRESTAMO_PK on PRESTAMO (
ID_PRESTAMO
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_2_FK on PRESTAMO (
ID_EJEMPLAR
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_3_FK on PRESTAMO (
ID_CLIENTE
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_8_FK on PRESTAMO (
ID_BIBLIOTECARIO
);

/*==============================================================*/
/* Table: PROVEEDORES                                           */
/*==============================================================*/
create table PROVEEDORES (
   ID_PROVEEDOR         SERIAL               not null,
   NOMBRE_PROVEEDOR     VARCHAR(50)          not null,
   PRECIO_VENTA         DECIMAL              not null,
   FECHA_VENTA          DATE                 not null,
   constraint PK_PROVEEDORES primary key (ID_PROVEEDOR)
);

/*==============================================================*/
/* Index: PROVEEDORES_PK                                        */
/*==============================================================*/
create unique index PROVEEDORES_PK on PROVEEDORES (
ID_PROVEEDOR
);

/*==============================================================*/
/* Table: RELATIONSHIP_5                                        */
/*==============================================================*/
create table RELATIONSHIP_5 (
   ID_EJEMPLAR          INT4                 not null,
   ID_VISITA            INT4                 not null,
   constraint PK_RELATIONSHIP_5 primary key (ID_EJEMPLAR, ID_VISITA)
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_PK                                     */
/*==============================================================*/
create unique index RELATIONSHIP_5_PK on RELATIONSHIP_5 (
ID_EJEMPLAR,
ID_VISITA
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_11_FK on RELATIONSHIP_5 (
ID_VISITA
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_5_FK on RELATIONSHIP_5 (
ID_EJEMPLAR
);

/*==============================================================*/
/* Table: RELATIONSHIP_7                                        */
/*==============================================================*/
create table RELATIONSHIP_7 (
   ID_EJEMPLAR          INT4                 not null,
   ID_PROVEEDOR         INT4                 not null,
   constraint PK_RELATIONSHIP_7 primary key (ID_EJEMPLAR, ID_PROVEEDOR)
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_PK                                     */
/*==============================================================*/
create unique index RELATIONSHIP_7_PK on RELATIONSHIP_7 (
ID_EJEMPLAR,
ID_PROVEEDOR
);

/*==============================================================*/
/* Index: RELATIONSHIP_12_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_12_FK on RELATIONSHIP_7 (
ID_PROVEEDOR
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_7_FK on RELATIONSHIP_7 (
ID_EJEMPLAR
);

/*==============================================================*/
/* Table: SERVICIO_VISITA                                       */
/*==============================================================*/
create table SERVICIO_VISITA (
   ID_VISITA            SERIAL               not null,
   ID_CLIENTE           INT4                 not null,
   ID_BIBLIOTECARIO     INT4                 not null,
   HORA_ENTRADA         DATE                 not null,
   HORA_SALIDA          DATE                 null,
   constraint PK_SERVICIO_VISITA primary key (ID_VISITA)
);

/*==============================================================*/
/* Index: SERVICIO_VISITA_PK                                    */
/*==============================================================*/
create unique index SERVICIO_VISITA_PK on SERVICIO_VISITA (
ID_VISITA
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_6_FK on SERVICIO_VISITA (
ID_CLIENTE
);

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_9_FK on SERVICIO_VISITA (
ID_BIBLIOTECARIO
);

alter table ANO_BIBLIOTECARIO
   add constraint FK_ANO_BIBL_RELATIONS_BIBLIOTE foreign key (ID_BIBLIOTECARIO)
      references BIBLIOTECARIO (ID_BIBLIOTECARIO)
      on delete restrict on update restrict;

alter table EJEMPLAR
   add constraint FK_EJEMPLAR_TIENE_LIBRO foreign key (ID_LIBRO)
      references LIBRO (ID_LIBRO)
      on delete restrict on update restrict;

alter table PRESTAMO
   add constraint FK_PRESTAMO_RELATIONS_EJEMPLAR foreign key (ID_EJEMPLAR)
      references EJEMPLAR (ID_EJEMPLAR)
      on delete restrict on update restrict;

alter table PRESTAMO
   add constraint FK_PRESTAMO_RELATIONS_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table PRESTAMO
   add constraint FK_PRESTAMO_RELATIONS_BIBLIOTE foreign key (ID_BIBLIOTECARIO)
      references BIBLIOTECARIO (ID_BIBLIOTECARIO)
      on delete restrict on update restrict;

alter table RELATIONSHIP_5
   add constraint FK_RELATION_RELATIONS_SERVICIO foreign key (ID_VISITA)
      references SERVICIO_VISITA (ID_VISITA)
      on delete restrict on update restrict;

alter table RELATIONSHIP_5
   add constraint FK_RELATION_RELATIONS_EJEMPLAR foreign key (ID_EJEMPLAR)
      references EJEMPLAR (ID_EJEMPLAR)
      on delete restrict on update restrict;

alter table RELATIONSHIP_7
   add constraint FK_RELATION_RELATIONS_PROVEEDO foreign key (ID_PROVEEDOR)
      references PROVEEDORES (ID_PROVEEDOR)
      on delete restrict on update restrict;

alter table RELATIONSHIP_7
   add constraint FK_RELATION_RELATIONS_EJEMPLAR foreign key (ID_EJEMPLAR)
      references EJEMPLAR (ID_EJEMPLAR)
      on delete restrict on update restrict;

alter table SERVICIO_VISITA
   add constraint FK_SERVICIO_RELATIONS_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table SERVICIO_VISITA
   add constraint FK_SERVICIO_RELATIONS_BIBLIOTE foreign key (ID_BIBLIOTECARIO)
      references BIBLIOTECARIO (ID_BIBLIOTECARIO)
      on delete restrict on update restrict;

/*INSERCIONES*/
INSERT INTO PROVEEDORES(NOMBRE_PROVEEDOR, PRECIO_VENTA, FECHA_VENTA) 
VALUES ('SCIELO', 25.0, '03-01-2010'), ('SANTIANA', 15.0, '09-04-2011'),
('LEE', 30.0, '09-03-2011'), ('MAGNAMENT', 20.0,'09-08-2012' ),
('MERCADEZ', 27.50,'08-06-2013' ),('JULIOUS', 14.26, '25-05-2014'),
('ARCANE', 32.00, '12-02-2015'),('POUDER', 22.50,'06-03-2016' ),
('TEABOOK', 40.00,'26-12-2017' ),('SHETBOOK', 36.20,'14-02-2018' );

insert into cliente(NOMBRE_CLIENTE, CI_CLIENTE)
VALUES ('JUAN MANUEL MERO MERO', '1351825487' ),
('PEDRO PABLO GUERRERO PAZ', '1354545454' ),
('ANDRIAN FRAN COL MERO', '1387874456' ),
('MATEO JOSE ALVEZ AVAN', '0945454574' ),
('MARIA JOSE CHAVEZ PAZ', '0874545123' ),
('MARILIN LUZ TENA MEZA', '1587464545' ),
('RUBEN ANTONIO DOBLAS GURDENSEN', '1548793252' ),
('MIGUEL ANGEL MERO ??UNEZ', '1387424123' ),
('ALEJANDRO ANTONIO MURCIA VELEZ', '1382362938' ),
('MARIA JOSEFA CORBACHO CORREDERA', '1360749236' ),
('CATALINA LUZ CASADO ROMERO ', '1361699416' ),
('DOLORES ALBERT DE LA CALLE', '1322183574' ),
('EMILIA CONSTANTIN BARBER', '1345694612' ),
('MARIA MELGAR ASTORGA', '1382278211' ),
('JUAN MANUEL MIGUELEZ TERUEL', '1366372161' ),
('JOSE ANTONIO ALVAREZ BARBER', '1357193062' ),
('ADRIAN FELIPE LOBATO', '1350629300' ),
('SANTIAGO DEL HOYO ESCUDERO', '1325583795' ),
('DANIEL CASELLAS DOVAL', '1363850496' ),
('SERGIO ARRANZ ARRIAGA', '1344474727' ),
('JUAN FRANCISCO VERGES LAVADOO', '1362612708' ),
('SAMUEL REDONDO HERRAIZ', '1377948963' ),
('AURORA DEL VALLE REBOLLO', '1349067774' ),
('ANGELA BONILLO GAY', '1397239951' ),
('CLAUDIA ALCALDE TORRENT', '1311291940' );


insert into bibliotecario(CI_BIBLIOTECARIO, NOMBRE_BIBLIOTECARIO, APELLIDO_BIBLIOTECARIO)
VALUES ('1313553859', 'JULEXI NICOLE', 'MARQUEZ COBE??A'),
('1313553859', 'BELCALIS MARLENIS', 'ALM??NZAR PEREZ'),
('1398765432', 'AMALA RATNA', 'ZANDILE CEVALLOS'),
('1312345678', 'ABEL MAKKONEN', 'TESFAYE PONCE'),
('1354378912', 'TYLER ROBERT', 'JOSEPH LOOR');


insert into libro(NOMBRE_LIBRO, VERSION_LIBRO, AUTOR, ISBN, EDITORIAL_LIBRO, NO_EJEMPLARES, VERSION_DIGITAL)
VALUES('Gesti??n de bases de datos', '??NICA', 'Pablo Valderrey Sanz',  '9788492650798', 'RA-MA Editorial', 2 , 'SI'),
('Bases datos distribuidas', 'V1.0', 'Maidel de la Rosa T??llez', '9789591603364', 'Editorial Universitaria', 2 , 'SI'),
('Computadores para bases de datos (UF1465)', 'V1', 'Mar??a de la Cruz B??jar Heredia',  '9788416173464' , 'IC Editorial', 2, 'SI'),
('Gesti??n de bases de datos', 'V3.0', 'Pablo Valderrey Sanz',  '9789171248861' , 'RA-MA Editorial', 2 , 'SI'),
('Aplicaciones de R en estad??stica b??sica y textual', 'V5', 'Cirino Isern Rius',  '9789368088933' , 'Tirant Lo Blanch', 2 , 'SI'),
('Estad??stica inferencial aplicada', 'V1.2', 'Iris Cano Sans',  '9789510068285' , 'Alianza Editorial', 2 , 'SI'),
('Estad??stica descriptiva e inferencial', 'V9.0', 'Charo del Pacheco',  '9789829466589' , 'Aranzadi', 2 , 'SI'),
('El proceso de modelado en econom??a y ciencias de la gesti??n', 'V1.2', 'Sandalio Torralba Rivera',  '9789675199137' , 'Ediciones C??tedra', 2 , 'SI'),
('As?? se miente con estad??sticas: c??mo nos manipulan con gr??ficos y curvas', 'V2.1', 'Martirio Roca Barrag??n',  '9789177146812' , 'Editorial S??ntesis', 2 , 'SI'),
('An??lisis cuantitativo: t??cnicas para describir y explicar en Ciencias Sociales', 'V6.0', 'Ximena Asenjo',  '9789138059498' , 'Ariel', 2 , 'SI'),
('Voces de la educaci??n', 'V7.0', 'Ram??n Garriga Arjona',  '9789572226968' , 'Marcial Pons', 2 , 'SI'),
('Ciberinteligencia y cibercontrainteligencia: aplicaci??n e impacto en la seguridad nacional', 'V7.1', 'Domitila Gallo-Sandoval',  '9789534167563' , 'Tecnos', 2 , 'SI'),
('Administraci??n integral del condominio: marco legal, aspecto contable-financiero y r??gimen fiscal', 'V3.3', 'Nieves Perales Montalb??n',  '9789884651057' , 'Editorial CSIC', 2 , 'SI'),
('El abogado del ma??ana: una introducci??n a tu futuro', 'V2.3', 'Apolinar Ochoa Pi??eiro',  '9789179625272' , 'Ediciones Akal', 2 , 'SI'),
('La Europa ciudadana', 'V2.2', 'Ruth Ricart Perales',  '9789433501176' , 'Editorial Comares', 2 , 'SI'),
('Arbitraje y propiedad industrial', 'V3.4', 'Caridad Arranz Morell',  '9789594945911' , 'Civitas', 2 , 'SI'),
('La valoraci??n urban??stica en la Ley del suelo', 'V4.1', 'Eutimio Soriano V??zquez',  '9789915944199' , 'Dykinson', 2 , 'SI'),
('Por los derechos de la infancia y de la adolescencia', 'V4.2', 'Fidela Vega-Cervera',  '9789623103538' , 'Ediciones Pir??mide', 2 , 'SI'),
('Latini', 'V5.0', 'Pablo Valderrey Sanz',  '9789770391734' , 'Editorial Cr??tica', 2 , 'SI'),
('Precios de transferencia', 'V9', 'Ana Lasa Melero',  '9789484150847' , 'GREDOS', 2 , 'SI'),
('Metamorfosis.', 'V7.3', 'Luna Angulo Burgos',  '9789956530800' , 'Editorial PUV ', 2 , 'SI'),
('Di??logos', 'V6.3', 'Esmeralda ??ngel Lamas',  '9789975993768' , 'Editorial La Muralla, S.A.', 2 , 'SI'),
('La ortograf??a latina en la baja edad media', 'V0.2', 'Lupe Folch Chamorro',  '9789948065089' , 'Arco Libros, S.L', 2 , 'SI'),
('Psicolog??a del arte: crear y cambiar', 'V0.6', 'Nicanor del Bertr??n',  '9789604814650' , 'Iberoamericana / Vervuert', 2 , 'NO'),
('Creatividad: curiosidad, motivaci??n y juego', 'V0.5', 'Pablo Valderrey Sanz',  '9789954539414' , 'Ediciones Paid??s', 2 , 'NO'),
('VARONA, Revista Cient??fico-Metodol??gica', 'V9.3', 'Lucila Busquets-Cazorla',  '9789276173194' , 'Ediciones Trea', 2 , 'SI'),
('El arte a contratiempo: historia, obsolescencia, est??ticas migratorias', 'V2', 'Vinicio Gelabert Espa??a',  '9789111958527' , 'Ediciones Novedades Educativas', 2 , 'NO'),
('Dibujando en el Museo del Prado', 'V1.5', 'Cristina Pe??as Galv??n',  '9789668338356' , 'Ediciones UDP', 2 , 'SI'),
('Jugando a ser Dios: experimentos en vida artificial', 'V2.9', 'Elisa Cuenca Colomer',  '9789795448083' , 'Editorial Comares', 2 , 'SI'),
('Geograf??a y medio ambiente', 'V3.8', 'Pelayo Mayoral Aguado',  '9789295124027' , 'EDULP', 2 , 'NO'),
('Sistem??tica de las conformaciones', 'V4.7', 'Florinda Cintia Barral Andreu',  '9789799245634' , 'Editorial EUDEBA', 2 , 'SI'),
('Los bacteri??fagos: los virus que combaten infecciones', 'V5.8', 'Adolfo Aroca I??iguez',  '9789819566550' , 'Editorial Macro', 2 , 'SI'),
('Inmunolog??a de Janeway', 'V6.4', 'Severino Gabriel Alba Carb??',  '9789518752285' , 'Editorial Tirant Lo Blanch', 2 , 'SI'),
('Ecolog??a oral', 'V7.7', 'Dorotea Beatriz Sotelo Bl??zquez',  '9789906439124' , 'Editorial UCR', 2 , 'NO'),
('Microbiolog??a cl??nica', 'V8.2', 'Manola Feijoo Lopez',  '9789991574173' , 'Plural Editores', 2 , 'SI'),
('Scientia Marina', 'V9.03', 'Benigno Bello Aznar',  '9789319560457' , 'Prometeo Editorial', 2 , 'SI'),
('??tica de las nanotecnolog??as', 'V0.01', 'Octavio Jim??nez Rivas',  '9789901111425' , 'AUSTRAL', 2 , 'SI'),
('Metrolog??a geom??trica aplicada en elementos mec??nicos', 'V8.5', 'Perla Luna Ribera',  '9789234776360' , 'BOOKET', 2 , 'SI'),
('Biotecnolog??a para principiantes', 'V6.8', 'Fito Maupoey, Pedro',  '9788429174830' , 'Editorial Revert??', 2 , 'SI'),
('Introducci??n al secado de alimentos por aire caliente', 'V9.2', 'Fern??ndez???L??pez, Jos?? Antonio',  '9788497050258' , 'Editorial Polit??cnica de Valencia', 2 , 'SI');


insert into ano_bibliotecario (id_bibliotecario, anos_bibliotecario)
values (1, '2010'),
(1, '2011'), (2, '2012'), (2, '2013'),
(3, '2014'), (3, '2015'), (4, '2016'),
(4, '2017'), (5, '2018'), (5, '2019');


insert into ejemplar (id_libro, codigo_ejemplar, aspecto_ejemplar, estado)
values (1, '0001', 'bueno', 'activo'),(1, '0002', 'bueno', 'activo'),(2, '0003', 'bueno', 'activo'),
(2, '0004', 'bueno', 'activo'),(3, '0005', 'bueno', 'activo'),(3, '0006', 'bueno', 'activo'),
(4, '0007', 'bueno', 'activo'),(4, '0008', 'bueno', 'activo'),(5, '0009', 'bueno', 'activo'),
(5, '0010', 'bueno', 'activo'),(6, '0011', 'bueno', 'activo'),(6, '0012', 'bueno', 'activo'),
(7, '0013', 'bueno', 'activo'),(7, '0014', 'bueno', 'activo'),(8, '0015', 'bueno', 'activo'),
(8, '0016', 'bueno', 'activo'),(9, '0017', 'bueno', 'activo'),(9, '0018', 'bueno', 'activo'),
(10, '0019', 'bueno', 'activo'),(10, '0020', 'bueno', 'activo'),(11, '0021', 'bueno', 'activo'),
(11, '0022', 'bueno', 'activo'),(12, '0023', 'bueno', 'activo'),(12, '0024', 'bueno', 'activo'),
(13, '0025', 'bueno', 'activo'),(13, '0026', 'bueno', 'activo'),(14, '0027', 'bueno', 'activo'),
(14, '0028', 'bueno', 'activo'),(15, '0029', 'bueno', 'activo'),(15, '0030', 'bueno', 'activo'),
(16, '0031', 'bueno', 'activo'),(16, '0032', 'bueno', 'activo'),(17, '0033', 'bueno', 'activo'),
(17, '0034', 'bueno', 'activo'),(18, '0035', 'bueno', 'activo'),(18, '0036', 'bueno', 'activo'),
(19, '0037', 'bueno', 'activo'),(19, '0038', 'bueno', 'activo'),(20, '0039', 'bueno', 'activo'),
(20, '0040', 'bueno', 'activo'),(21, '0041', 'bueno', 'activo'),(21, '0042', 'bueno', 'activo'),
(22, '0043', 'bueno', 'activo'),(22, '0044', 'bueno', 'activo'),(23, '0045', 'bueno', 'activo'),
(23, '0046', 'bueno', 'activo'),(24, '0047', 'bueno', 'activo'),(24, '0048', 'bueno', 'activo'),
(26, '0051', 'bueno', 'activo'),(26, '0052', 'bueno', 'activo'),(27, '0053', 'bueno', 'activo'),
(27, '0054', 'bueno', 'activo'),(28, '0055', 'bueno', 'activo'),(28, '0056', 'bueno', 'activo'),
(29, '0057', 'bueno', 'activo'),(29, '0058', 'bueno', 'activo'),(30, '0059', 'bueno', 'activo'),
(30, '0060', 'bueno', 'activo'),(31, '0061', 'bueno', 'activo'),(31, '0062', 'bueno', 'activo'),
(32, '0063', 'bueno', 'activo'),(32, '0064', 'bueno', 'activo'),(33, '0065', 'bueno', 'activo'),
(33, '0066', 'bueno', 'activo'),(34, '0067', 'bueno', 'activo'),(34, '0068', 'bueno', 'activo'),
(35, '0069', 'bueno', 'activo'),(35, '0070', 'bueno', 'activo'),(36, '0071', 'bueno', 'activo'),
(36, '0072', 'bueno', 'activo'),(37, '0073', 'bueno', 'activo'),(37, '0074', 'bueno', 'activo'),
(38, '0075', 'bueno', 'activo'),(38, '0076', 'bueno', 'activo'),(39, '0077', 'regular', 'activo'),
(39, '0078', 'regular', 'activo'),(40, '0079', 'bueno', 'activo'),(40, '0080', 'bueno', 'activo');

insert into ejemplar (id_libro, codigo_ejemplar, aspecto_ejemplar, estado, fecha_baja)
values (25, '0049', 'malo', 'de baja', '2014-01-09'),(25, '0050', 'malo', 'de baja', '2014-01-09');


insert into servicio_visita (id_cliente, id_bibliotecario, hora_entrada, hora_salida)
values(1, 1, '2010-05-26 15:46:52', '2010-05-26 16:46:52'),
(1, 1, '2010-05-12 15:36:24' , '2010-05-12 18:46:52'),
(2, 1, '2010-03-21 10:46:42', '2010-03-21 11:46:52'),
(3, 1, '2011-04-25 09:45:02', '2011-04-25 10:46:52'),
(4, 1, '2010-02-26 12:52:00', '2010-02-26 14:46:52'),
(5, 1, '2011-07-15 13:11:12', '2011-07-15 16:46:52'),
(6, 1, '2010-05-12 13:15:31', '2010-05-12 13:46:52'),
(2, 1, '2011-09-19 14:32:34', '2011-09-19 15:46:52'),
(2, 1, '2011-04-17 16:10:45', '2011-04-17 18:46:52'),
(1, 1, '2011-04-18 11:02:00', '2011-04-18 12:46:52'),
(3, 1, '2011-08-24 16:06:40', '2011-08-24 18:46:52'),
(4, 1, '2010-05-16 13:54:52', '2010-05-16 14:46:52'),
(3, 1, '2011-07-22 10:32:12', '2011-07-22 11:46:52'),
(4, 1, '2010-12-12 09:28:21', '2010-12-12 10:46:52'),
(1, 1, '2011-11-10 09:18:04', '2011-11-10 09:46:52'),
(6, 1, '2010-04-25 11:09:02', '2010-04-25 12:46:52'),
(6, 1, '2011-12-21 12:17:52', '2011-12-21 18:46:52'),
(2, 1, '2010-05-29 18:01:52', '2010-05-29 18:46:52'),
(4, 1, '2010-06-28 18:27:52', '2010-06-28 18:46:52'),
(3, 1, '2011-07-01 18:47:54', '2011-07-01 19:00:00'),
(7, 2, '2012-05-26 15:46:52', '2012-05-26 16:46:52'),
(8, 2, '2012-05-12 15:36:24' , '2012-05-12 18:46:52'),
(9, 2, '2012-03-21 10:46:42', '2012-03-21 11:46:52'),
(10, 2, '2012-04-25 09:45:02', '2012-04-25 10:46:52'),
(7, 2, '2012-02-26 12:52:00', '2012-02-26 14:46:52'),
(8, 2, '2012-07-15 13:11:12', '2012-07-15 16:46:52'),
(9, 2, '2012-05-12 13:15:31', '2012-05-12 13:46:52'),
(10, 2, '2012-09-19 14:32:34', '2012-09-19 15:46:52'),
(7, 2, '2013-04-17 16:10:45', '2013-04-17 18:46:52'),
(8, 2, '2013-04-18 11:02:00', '2013-04-18 12:46:52'),
(9, 2, '2013-08-24 16:06:40', '2013-08-24 18:46:52'),
(10, 2, '2013-05-16 13:54:52', '2013-05-16 14:46:52'),
(7, 2, '2013-07-22 10:32:12', '2013-07-22 11:46:52'),
(8, 2, '2013-12-12 09:28:21', '2013-12-12 10:46:52'),
(9, 2, '2013-11-10 09:18:04', '2013-11-10 09:46:52'),
(10, 2, '2013-04-25 11:09:02', '2013-04-25 12:46:52'),
(11, 3, '2014-05-26 15:46:52', '2014-05-26 16:46:52'),
(12, 3, '2014-05-12 15:36:24' , '2014-05-12 18:46:52'),
(13, 3, '2014-03-21 10:46:42', '2014-03-21 11:46:52'),
(14, 3, '2014-04-25 09:45:02', '2014-04-25 10:46:52'),
(15, 3, '2014-02-26 12:52:00', '2014-02-26 14:46:52'),
(11, 3, '2014-07-15 13:11:12', '2014-07-15 16:46:52'),
(12, 3, '2014-05-12 13:15:31', '2014-05-12 13:46:52'),
(13, 3, '2015-09-19 14:32:34', '2015-09-19 15:46:52'),
(14, 3, '2015-04-17 16:10:45', '2015-04-17 18:46:52'),
(15, 3, '2015-04-18 11:02:00', '2015-04-18 12:46:52'),
(11, 3, '2015-08-24 16:06:40', '2015-08-24 18:46:52'),
(12, 3, '2015-05-16 13:54:52', '2015-05-16 14:46:52'),
(13, 3, '2015-07-22 10:32:12', '2015-07-22 11:46:52'),
(16, 4, '2016-05-26 15:46:52', '2016-05-26 16:46:52'),
(17, 4, '2016-05-12 15:36:24' , '2016-05-12 18:46:52'),
(18, 4, '2016-03-21 10:46:42', '2016-03-21 11:46:52'),
(19, 4, '2016-04-25 09:45:02', '2016-04-25 10:46:52'),
(20, 4, '2016-02-26 12:52:00', '2016-02-26 14:46:52'),
(21, 4, '2016-07-15 13:11:12', '2016-07-15 16:46:52'),
(22, 4, '2016-05-12 13:15:31', '2016-05-12 13:46:52'),
(16, 4, '2017-09-19 14:32:34', '2017-09-19 15:46:52'),
(17, 4, '2017-04-17 16:10:45', '2017-04-17 18:46:52'),
(18, 4, '2017-04-18 11:02:00', '2017-04-18 12:46:52'),
(19, 4, '2017-08-24 16:06:40', '2017-08-24 18:46:52'),
(20, 4, '2017-05-16 13:54:52', '2017-05-16 14:46:52'),
(23, 5, '2018-05-26 15:46:52', '2018-05-26 16:46:52'),
(24, 5, '2018-05-12 15:36:24' , '2018-05-12 18:46:52'),
(23, 5, '2018-03-21 10:46:42', '2018-03-21 11:46:52'),
(24, 5, '2018-04-25 09:45:02', '2018-04-25 10:46:52'),
(25, 5, '2018-02-26 12:52:00', '2018-02-26 14:46:52'),
(23, 5, '2019-07-15 13:11:12', '2019-07-15 16:46:52'),
(23, 5, '2019-05-12 13:15:31', '2019-05-12 13:46:52'),
(24, 5, '2019-09-19 14:32:34', '2019-09-19 15:46:52'),
(25, 5, '2019-04-17 16:10:45', '2019-04-17 18:46:52'),
(22, 5, '2019-04-18 11:02:00', '2019-04-18 12:46:52'),
(23, 5, '2018-08-24 16:06:40', '2018-08-24 18:46:52'),
(24, 5, '2018-05-16 13:54:52', '2018-05-16 14:46:52'),
(25, 5, '2018-07-22 10:32:12', '2018-07-22 11:46:52'),
(24, 5, '2018-12-12 09:28:21', '2018-12-12 10:46:52'),
(23, 5, '2018-11-10 09:18:04', '2018-11-10 09:46:52'),
(25, 5, '2019-04-25 11:09:02', '2019-04-25 12:46:52'),
(23, 5, '2019-12-21 12:17:52', '2019-12-21 18:46:52'),
(24, 5, '2019-05-29 18:01:52', '2019-05-29 18:46:52'),
(25, 5, '2019-06-28 18:27:52', '2019-06-28 18:46:52'),
(25, 5, '2019-07-01 18:47:54', '2019-07-01 19:00:00');

insert into prestamo (id_ejemplar, id_cliente, id_bibliotecario, fecha_prestamo, fecha_entrega, penalizacion, apecto_entrega, observaciones, costo_prestamo)
values(1, 1, 1, '2010-01-03', '2010-01-05', 0.00, 'bueno', 'ninguno', 3.00),
(2, 2, 1, '2010-02-01', '2010-02-03', 0.00, 'bueno', 'ninguno', 3.00),
(3, 3, 1, '2010-03-02', '2010-03-04', 1.50, 'regular', 'ray??n', 3.00),
(4, 4, 1, '2010-04-03', '2010-04-05', 0.00, 'bueno', 'ninguno', 3.00),
(5, 5, 1, '2010-05-04', '2010-05-06', 0.00, 'bueno', 'ninguno', 3.00),
(6, 6, 1, '2010-06-05', '2010-06-07', 0.00, 'bueno', 'ninguno', 3.00),
(7, 7, 1, '2010-07-06', '2010-07-08', 0.00, 'bueno', 'ninguno', 3.00),
(8, 8, 1, '2010-08-03', '2010-08-05', 0.00, 'bueno', 'ninguno', 3.00),
(9, 9, 1, '2010-09-01', '2010-09-03', 0.00, 'bueno', 'ninguno', 3.00),
(10, 10, 1, '2010-10-02', '2010-10-04', 1.50, 'regular', 'ray??n', 3.00),
(11, 11, 1, '2010-11-03', '2010-11-05', 0.00, 'bueno', 'ninguno', 3.00),
(12, 12, 1, '2010-12-04', '2010-12-06', 0.00, 'bueno', 'ninguno', 3.00),
(13, 13, 1, '2011-01-05', '2011-01-07', 0.00, 'bueno', 'ninguno', 3.00),
(14, 14, 1, '2011-02-06', '2011-02-08', 0.00, 'bueno', 'ninguno', 3.00),
(15, 15, 1, '2011-03-03', '2011-03-05', 0.00, 'bueno', 'ninguno', 3.00),
(16, 16, 1, '2011-04-01', '2011-04-03', 0.00, 'bueno', 'ninguno', 3.00),
(17, 17, 1, '2011-05-02', '2011-05-04', 1.50, 'regular', 'ray??n', 3.00),
(18, 18, 1, '2011-06-03', '2011-06-05', 0.00, 'bueno', 'ninguno', 3.00),
(19, 19, 1, '2011-07-04', '2011-07-06', 0.00, 'bueno', 'ninguno', 3.00),
(20, 20, 1, '2011-08-05', '2011-08-08', 0.00, 'bueno', 'ninguno', 3.00),
(21, 21, 2, '2012-01-07', '2012-01-09', 0.00, 'bueno', 'ninguno', 3.00),
(22, 22, 2, '2012-02-08', '2012-02-10', 0.00, 'bueno', 'ninguno', 3.00),
(23, 23, 2, '2012-03-09', '2012-03-11', 0.00, 'bueno', 'ninguno', 3.00),
(24, 24, 2, '2012-04-10', '2012-04-12', 3.00, 'regular', 'Hoja menos', 3.00),
(25, 25, 2, '2012-05-11', '2012-05-13', 0.00, 'bueno', 'ninguno', 3.00),
(26, 1, 2, '2012-06-12', '2012-06-14', 0.00, 'bueno', 'ninguno', 3.00),
(79, 2, 2, '2012-07-07', '2012-07-09', 0.00, 'bueno', 'ninguno', 3.00),
(80, 3, 2, '2012-08-08', '2012-08-10', 2.00, 'regular', 'rayon', 3.00),
(79, 4, 2, '2012-09-09', '2012-09-11', 2.00, 'regular', 'rayon', 3.00),
(80, 5, 2, '2013-10-10', '2013-10-12', 3.00, 'regular', 'Hoja menos', 3.00),
(79, 6, 2, '2013-11-11', '2013-11-13', 2.00, 'regular', 'rayones', 3.00),
(80, 7, 2, '2013-12-07', '2013-12-09', 2.00, 'regular', 'rayones', 3.00),
(79, 8, 2, '2013-01-08', '2013-01-10', 2.00, 'malo', 'rayones', 3.00),
(80, 9, 2, '2013-02-09', '2013-02-11', 5.00, 'malo', '2 hojas', 3.00),
(79, 10, 2, '2013-03-10', '2013-03-12', 8.00, 'malo', 'Portada, 15 hojas menos', 3.00),
(80, 11, 2, '2013-04-11', '2013-04-13', 10.00, 'malo', 'Sin pasta', 3.00),
(79, 2, 2, '2012-05-07', '2012-05-09', 0.00, 'bueno', 'ninguno', 3.00),
(80, 3, 2, '2012-06-08', '2012-06-10', 2.00, 'regular', 'rayon', 3.00),
(79, 4, 2, '2012-07-09', '2012-07-11', 2.00, 'regular', 'rayon', 3.00),
(80, 5, 2, '2013-08-10', '2013-08-12', 3.00, 'regular', 'Hoja menos', 3.00),
(79, 6, 2, '2013-09-11', '2013-09-13', 2.00, 'regular', 'rayones', 3.00),
(80, 7, 2, '2013-10-07', '2013-10-09', 2.00, 'regular', 'rayones', 3.00),
(79, 8, 2, '2013-11-08', '2013-11-10', 2.00, 'malo', 'rayones', 3.00),
(80, 9, 2, '2013-12-09', '2013-12-11', 5.00, 'malo', '2 hojas', 3.00),
(79, 10, 2, '2013-01-10', '2013-03-12', 8.00, 'malo', 'Portada, 15 hojas menos', 3.00),
(80, 11, 2, '2013-02-11', '2013-04-13', 10.00, 'malo', 'Sin pasta', 3.00),
(27, 12, 3, '2014-01-13', '2014-01-15', 0.00, 'bueno', 'ninguno', 3.00),
(28, 13, 3, '2014-02-14', '2014-02-16', 0.00, 'bueno', 'ninguno', 3.00),
(29, 14, 3, '2014-03-15', '2014-03-17', 0.00, 'bueno', 'ninguno', 3.00),
(30, 15, 3, '2014-04-16', '2014-04-18', 0.00, 'bueno', 'ninguno', 3.50),
(31, 16, 3, '2014-05-17', '2014-05-19', 0.00, 'bueno', 'ninguno', 3.50),
(32, 17, 3, '2014-06-18', '2014-06-20', 0.00, 'bueno', 'ninguno', 3.50),
(33, 18, 3, '2014-07-13', '2014-07-15', 0.00, 'bueno', 'ninguno', 3.00),
(34, 19, 3, '2014-08-14', '2014-08-16', 0.00, 'bueno', 'ninguno', 3.00),
(35, 20, 3, '2014-09-15', '2014-09-17', 0.00, 'bueno', 'ninguno', 3.00),
(36, 21, 3, '2014-10-16', '2014-10-18', 0.00, 'bueno', 'ninguno', 3.50),
(37, 22, 3, '2014-11-17', '2014-11-19', 0.00, 'bueno', 'ninguno', 3.50),
(38, 23, 3, '2014-12-13', '2014-12-15', 0.00, 'bueno', 'ninguno', 3.00),
(39, 24, 3, '2015-01-14', '2015-01-16', 0.00, 'bueno', 'ninguno', 3.00),
(40, 25, 3, '2015-02-15', '2015-02-17', 0.00, 'bueno', 'ninguno', 3.00),
(41, 1, 3, '2015-03-16', '2015-03-18', 0.00, 'bueno', 'ninguno', 3.50),
(42, 2, 3, '2015-04-17', '2015-04-19', 0.00, 'bueno', 'ninguno', 3.50),
(43, 3, 3, '2015-05-13', '2015-05-15', 0.00, 'bueno', 'ninguno', 3.00),
(44, 4, 3, '2015-06-14', '2015-06-16', 0.00, 'bueno', 'ninguno', 3.00),
(45, 5, 3, '2015-07-15', '2015-07-17', 0.00, 'bueno', 'ninguno', 3.00),
(46, 6, 3, '2015-08-16', '2015-08-18', 0.00, 'bueno', 'ninguno', 3.50),
(47, 7, 3, '2015-09-17', '2015-09-19', 0.00, 'bueno', 'ninguno', 3.50),
(48, 8, 4, '2016-01-19', '2016-01-21', 5.00, 'regular', 'Pasta da??ada', 3.50),
(51, 9, 4, '2016-02-20', '2016-02-22', 0.00, 'bueno', 'ninguno', 3.50),
(52, 10, 4, '2016-03-21', '2016-03-23', 0.00, 'bueno', 'ninguno', 3.50),
(53, 11, 4, '2016-04-22', '2017-04-24', 0.00, 'bueno', 'ninguno', 3.50),
(54, 12, 4, '2016-05-23', '2017-05-25', 0.00, 'bueno', 'ninguno', 3.50),
(55, 13, 4, '2016-06-24', '2017-06-26', 0.00, 'bueno', 'ninguno', 3.50),
(56, 14, 4, '2016-07-25', '2017-07-27', 0.00, 'bueno', 'ninguno', 3.50),
(57, 15, 4, '2016-08-19', '2016-08-21', 5.00, 'regular', 'Pasta da??ada', 3.50),
(58, 16, 4, '2016-09-20', '2016-09-22', 0.00, 'bueno', 'ninguno', 3.50),
(59, 17, 4, '2016-10-21', '2016-10-23', 0.00, 'bueno', 'ninguno', 3.50),
(60, 18, 4, '2016-11-22', '2016-11-24', 0.00, 'bueno', 'ninguno', 3.50),
(61, 19, 4, '2016-12-23', '2016-12-25', 0.00, 'bueno', 'ninguno', 3.50),
(62, 20, 4, '2017-01-19', '2017-01-21', 5.00, 'regular', 'Pasta da??ada', 3.50),
(63, 21, 4, '2017-02-20', '2017-02-22', 0.00, 'bueno', 'ninguno', 3.50),
(64, 22, 4, '2017-03-21', '2017-03-23', 0.00, 'bueno', 'ninguno', 3.50),
(65, 23, 4, '2017-04-22', '2017-04-24', 0.00, 'bueno', 'ninguno', 3.50),
(66, 24, 4, '2017-05-23', '2017-05-25', 0.00, 'bueno', 'ninguno', 3.50),
(67, 25, 4, '2017-06-19', '2017-06-21', 5.00, 'regular', 'Pasta da??ada', 3.50),
(68, 1, 4, '2017-07-20', '2017-07-22', 0.00, 'bueno', 'ninguno', 3.50),
(69, 2, 4, '2017-08-21', '2017-08-23', 0.00, 'bueno', 'ninguno', 3.50),
(70, 3, 4, '2017-09-22', '2017-09-24', 0.00, 'bueno', 'ninguno', 3.50),
(71, 4, 4, '2017-10-23', '2017-10-25', 0.00, 'bueno', 'ninguno', 3.50),
(72, 5, 5, '2018-01-26', '2018-01-28', 2.00, 'regular', 'Pasta pelada', 3.50),
(73, 6, 5, '2018-02-25', '2018-02-28', 0.00, 'bueno', 'ninguno', 3.50),
(74, 7, 5, '2018-03-28', '2018-03-30', 0.00, 'bueno', 'ninguno', 3.50),
(75, 8, 5, '2018-04-29', '2018-04-01', 1.50, 'regular', 'Ray??n', 3.50),
(76, 9, 5, '2018-05-30', '2018-05-01', 0.00, 'bueno', 'ninguno', 3.50),
(77, 10, 5, '2018-06-26', '2018-06-28', 2.00, 'regular', 'Pasta pelada', 3.50),
(78, 11, 5, '2018-07-27', '2018-07-29', 0.00, 'bueno', 'ninguno', 3.50),
(46, 12, 5, '2018-08-28', '2018-08-30', 0.00, 'bueno', 'ninguno', 3.50),
(40, 13, 5, '2018-09-29', '2018-10-01', 1.50, 'regular', 'Ray??n', 3.50),
(1, 14, 5, '2018-10-30', '2018-11-01', 0.00, 'bueno', 'ninguno', 3.50),
(1, 15, 5, '2018-11-26', '2018-12-28', 2.00, 'regular', 'Pasta pelada', 3.50),
(4, 16, 5, '2019-12-27', '2019-12-29', 0.00, 'bueno', 'ninguno', 3.50),
(4, 17, 5, '2019-01-25', '2019-01-27', 0.00, 'bueno', 'ninguno', 3.50),
(4, 18, 5, '2019-02-26', '2019-03-01', 1.50, 'regular', 'Ray??n', 3.50),
(4, 19, 5, '2019-03-15', '2019-03-17', 0.00, 'bueno', 'ninguno', 3.50),
(4, 20, 5, '2019-04-26', '2019-04-28', 2.00, 'regular', 'Pasta pelada', 3.50),
(4, 21, 5, '2018-05-27', '2019-05-29', 0.00, 'bueno', 'ninguno', 3.50),
(1, 22, 5, '2019-06-28', '2019-06-30', 0.00, 'bueno', 'ninguno', 3.50),
(1, 23, 5, '2019-07-29', '2019-08-01', 1.50, 'regular', 'Ray??n', 3.50),
(1, 24, 5, '2019-08-30', '2019-09-01', 0.00, 'bueno', 'ninguno', 3.50);


insert into relationship_5 (id_ejemplar, id_visita)
VALUES(1, 1),(2, 1),(3, 1),(4, 1),(5, 1),(6, 1),(7, 1),(8, 1),(9, 1),(10, 1),(11, 1),(12, 1),
(13, 1),(14, 1),(15, 1),(16, 1),(79, 1),(18, 1),(19, 1),(20, 1),(21, 2),(22, 2),(23, 2),(24, 2),(25, 2),
(26, 2),(27, 2),(28, 2),(29, 2),(30, 2),(31, 2),(80, 2),(33, 2),(34, 2),(35, 2),(36, 2),(37, 3),(38, 3),
(39, 3),(40, 3),(41, 3),(42, 3),(43, 3),(44, 3),(45, 3),(46, 3),(47, 3),(48, 3),(49, 3),(50, 4),(51, 4),
(52, 4),(53, 4),(54, 4),(55, 4),(56, 4),(57, 4),(58, 4),(59, 4),(60, 4),(61, 4),(62, 5),(63, 5),(64, 5),
(65, 5),(66, 5),(67, 5),(68, 5),(69, 5),(70, 5),(71, 5),(72, 5),(73, 5),(74, 5),(75, 5),(76, 5),(77, 5),
(78, 5),(17, 5),(32, 5);

insert into relationship_7 (id_ejemplar, id_proveedor)
VALUES(79, 1),(80, 2),(78, 3),(1, 1),(2, 1),(3, 1),(4, 1),(5, 1),(6, 1),(7, 1),(8, 1),(9, 1),
(10, 1),(11, 1),(12, 1),(13, 1),(14, 1),(15, 1),(16, 1),(17, 1),(18, 1),(19, 1),(20, 1),(21, 2),(22, 2),
(23, 2),(24, 2),(25, 2),(26, 2),(27, 2),(28, 2),(29, 2),(30, 2),(31, 2),(32, 2),(33, 2),(34, 2),(35, 2),
(36, 2),(37, 3),(38, 3),(39, 3),(40, 3),(41, 3),(42, 3),(43, 3),(44, 3),(45, 3),(46, 3),(47, 3),(48, 3),
(49, 3),(50, 4),(51, 4),(52, 4),(53, 4),(54, 4),(55, 4),(56, 4),(57, 4),(58, 4),(59, 4),(60, 4),(61, 4),
(62, 5),(63, 5),(64, 5),(65, 5),(66, 5),(67, 5),(68, 5),(69, 5),(70, 5),(71, 5),(72, 5),(73, 6),(74, 7),
(75, 8),(76, 9),(77, 10);

update bibliotecario set ci_bibliotecario='1325489625'
  where id_bibliotecario=2;