create table cliente(
    id int4 not null,
    Nombre varchar(100) not null unique,
    Apellido varchar(100) not null ,
    Direccion varchar(100) not null  ,
    Telefono int4 not null unique ,
    Email varchar(100) not null  ,
    Usuario varchar(100) not null unique ,
    Contraseña varchar(100) not null unique ,

    constraint pk_cliente primary key (id)

);
insert into cliente
values (1,'miguel','santodomingo','Cll-71-M-49','311547861','santodomingomi45@mercept.co','Miguel_Santodomingo',md5('miguel123'));
insert into cliente
values (2,'Kevin','santos','Cll-30-j-30','32249871','santoskevin85@mercept.co','Kevin_Santos',md5('Kevin45'));
insert into cliente
values (3,'Julian','marquez','Cra-7-ñ-75','356871256','marquezjulian@mercept.co','Julian_marquez',md5('marquez46'));
insert into cliente
values (4,'Dilan','Gonzales','Cra-4-85','320156789','Dilan78@mercept.co','Dilan_Gonzales',md5('Dilan756'));
insert into cliente
values (5,'Erika','Ramirez','Cra-78-98','311840871','Erika756ra@mercept.co','Erika_Ramirez',md5('Erika-ramirez125'));
select * from cliente;

create table empresa(
    id int4 not null,
    nom_empresa varchar(100) not null,
    direccion varchar(100) not null,
    telefono int4 not null,
    email varchar(100) not null,

    constraint pk_empresa primary key (id)

);
Insert into empresa
values (1,'Madecenter','Calle 59 No. 27 - 35','6223452','madecenter@mercept.co');
Insert into empresa
values (2,'Los Santos','Calle 20 No. 22 - 27','8845585','los-santosc@mercept.co');
Insert into empresa
values (3,'San Pedro','Carrera  5 No. 3 -74  centro','8241832','sanpedro759@mercept.co');
Insert into empresa
values (4,'Los Pinares','Calle 25 No. 4 - 38','5847711','Lospiinars@mercept.co');
Insert into empresa
values (5,'DecoMaderas','Carrera 7A No. 32','3305040','decomade@mercept.co');
select* from empresa;

create table tamaño(
    id int4 not null,
    tamaño varchar(50) not null,

    constraint pk_tamaño primary key (id)
);
Insert into tamaño
values ('1','50');
Insert into tamaño
values ('2','35');
Insert into tamaño
values ('3','12');
Insert into tamaño
values ('4','11');
Insert into tamaño
values ('5','22');
select * from tamaño;

create table categoria(
    id int4 not null,
    nom_categoria varchar(100) not null,
    descripcion varchar(400) not null,

    constraint pk_categoria primary key (id)
);
insert into categoria
values ('1','Maderas','Espacio donde se almacena todos los tipos de Maderas');
insert into categoria
values ('2','Armarios','Espacio donde se almacena todos los de Armarios  y su descripcion');
insert into categoria
values ('3','Sillas','Espacio donde se almacena todos los tipo de Sillas y su descripcion');
insert into categoria
values ('4','Mesas','Espacio donde se almacena todos los tipo de Mesas y su descripcion');
insert into categoria
values ('5','Decoraciones','Espacio de decoracion en todo tipo de madera');
select * from categoria;

create table productos(
    id int4 not null unique,
    id_categoria int4 not null unique,
    id_tamaño int4 not null unique ,
    id_empresa int4 not null,
    nom_producto varchar(100) not null unique,
    marca varchar(100) not null ,
    modelo varchar(100) not null ,
    precio int4 not null unique,

    constraint pk_productos primary key (id,id_categoria,id_tamaño,id_empresa),
    constraint fk_categ_produ foreign key (id_categoria) references categoria(id),
    constraint "fk_tamaño_produ" foreign key (id_tamaño) references tamaño(id),
    constraint fk_empre_produ foreign key (id_empresa) references empresa(id)
);
insert into productos
values ('1','2','3','4','Mesa','--','--','120000');
insert into productos
values ('2','1','5','3','Escritorio','--','--','200000');
insert into productos
values ('3','4','1','2','Repisa','--','--','50000');
insert into productos
values ('4','3','2','1','Mesita_de_cafe','--','--','140000');
insert into productos
values ('5','5','4','5','Carro_madera','--','--','70000');
select * from productos;

create table catalogo(
    id int4 not null unique,
    nom_producto varchar(100) not null unique,
    id_producto int4 not null unique,
    imagen varchar(500) not null ,

    constraint pk_catalogo primary key (id,id_producto),
    constraint fk_cata_produc foreign key  (id_producto) references productos(id),
    constraint fk_cat_product foreign key (nom_producto) references productos (nom_producto)

    );
insert into catalogo
values ('1','Mesa','4','--');
insert into catalogo
values ('2','Escritorio','3','--');
insert into catalogo
values ('3','Carro_madera','2','--');
insert into catalogo
values ('4','Repisa','5','--');
insert into catalogo
values ('5','Mesita_de_cafe','1','--');
select * from catalogo;

create table inventario(
    id_productos int4 not null,
    id_cliente int4 not null,
    existencia varchar(20) not null,

    constraint pk_inventario primary key (id_productos,id_cliente),
    constraint fk_prod_inven foreign key (id_productos) references productos(id),
    constraint fk_client_invent foreign key (id_cliente) references cliente(id)
);
insert into inventario
values ('2','1','--');
insert into inventario
values ('3','5','--');
insert into inventario
values ('4','3','--');
insert into inventario
values ('5','4','--');
insert into inventario
values ('1','5','--');
select * from inventario;

create table detalle_pedido(
    id int4 not null,
    id_cliente int4 not null,
    fecha date not null,

    constraint pk_detalle_pedido primary key (id,id_cliente),
    constraint fk_clien_detped foreign key (id_cliente) references cliente(id)
);
insert into detalle_pedido
values ('1','2','15-1-21');
insert into detalle_pedido
values ('2','3','15-1-21');
insert into detalle_pedido
values ('3','1','15-1-21');
insert into detalle_pedido
values ('4','4','15-1-21');
insert into detalle_pedido
values ('5','5','15-1-21');
select * from detalle_pedido;

create table factura(
    num_factura int4 not null,
    nombre_cliente varchar(100) not null,
    fecha date not null,

    constraint pk_factura primary key (nombre_cliente),
    constraint fk_clien_fact foreign key (nombre_cliente) references cliente (Nombre)
);
insert into factura
values ('1','miguel','15-1-21');
insert into factura
values ('2','Kevin','15-1-21');
insert into factura
values ('3','Julian','15-1-21');
insert into factura
values ('4','Dilan','15-1-21');
insert into factura
values ('5','Erika','15-1-21');
select * from factura;


create table venta(
    id_producto int4 not null,
    fecha date not null,
    id_cliente int4 not null,
    total_a_pagar int4 not null,
    estado varchar(25) not null,

    constraint pk_id_producto primary key (id_producto,id_cliente),
    constraint fk_prod_venta foreign key (id_producto) references productos(id),
    constraint fk_clien_venta foreign key (id_cliente) references cliente(id)
);
insert into venta
values ('1','15-1-21','2','20000','Nuevo');
insert into venta
values ('2','15-1-21','3','150000','Nuevo');
insert into venta
values ('3','15-1-21','5','140000','Nuevo');
insert into venta
values ('4','15-1-21','4','120000','Nuevo');
insert into venta
values ('5','15-1-21','1','50000','Nuevo');
select * from venta;

create table carrito_compras(
    id_producto int4 not null,
    nom_producto varchar(100) not null,
    descuento varchar(100) not null,

    constraint pk_produc_carcom primary key (id_producto),
    constraint fk_produc_carcom foreign key (id_producto) references productos(id),
    constraint fk_catal_carcom foreign key (nom_producto) references catalogo (nom_producto)
);
insert into carrito_compras
values ('1','Mesa','80%');
insert into carrito_compras
values ('2','Escritorio','50%');
insert into carrito_compras
values ('4','Repisa','10%');
insert into carrito_compras
values ('5','Mesita_de_cafe','10%');
insert into carrito_compras
values ('3','Carro_madera','20%');
select * from carrito_compras;

create table historial_compras(
    fecha_compra date not null,
    id_cliente int4 not null ,
    id_producto int4 not null,
    cantidad int4 not null,

    constraint pk_hist_compras primary key (fecha_compra,id_cliente,id_producto),
    constraint fk_clien_hiscom foreign key (id_cliente) references cliente(id),
    constraint fk_prod_hiscom foreign key (id_producto) references productos(id)
);
insert into historial_compras
values ('15-1-21','1','2','75');
insert into historial_compras
values ('15-1-21','2','3','20');
insert into historial_compras
values ('15-1-21','3','4','45');
insert into historial_compras
values ('15-1-21','4','5','30');
insert into historial_compras
values ('15-1-21','5','1','20');
select * from historial_compras;

create table historial_ventas(
    fecha_venta date not null,
    id_producto int4 not null,
    id_cliente int4 not null,
    cantidad int4 not null,

    constraint pk_hist_comp primary key (fecha_venta,id_producto,id_cliente),
    constraint fk_prod_histcomp foreign key (id_producto) references productos(id),
    constraint fk_clie_histcomp foreign key (id_cliente) references cliente(id)
);
insert into historial_ventas
values ('15-1-21','2','5','62');
insert into historial_ventas
values ('15-1-21','3','1','7');
insert into historial_ventas
values ('15-1-21','1','4','8');
insert into historial_ventas
values ('15-1-21','4','3','1');
insert into historial_ventas
values ('15-1-21','5','2','2');
select * from historial_ventas;


/*Dml Mercept*/

