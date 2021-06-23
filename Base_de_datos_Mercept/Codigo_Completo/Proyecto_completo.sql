/*Tablas Julian*/
create schema Mercept;

Create table cliente(

    id int4 not null ,
    nombre varchar(100) not null unique ,
    Apellido varchar(100) not null ,
    Direccion varchar(100) not null  ,
    Telefono int4 not null  ,
    Email varchar(100) not null  ,
    Usuario varchar(100) not null ,
    Contraseña varchar(100) not null ,

    PRIMARY KEY (id),
    /*constraint de uk_clie nombre no lo funciona*/
    CONSTRAINT uk_clie UNIQUE (Usuario,Contraseña,Telefono,nombre)
);



create table empresa(
    id INT4 NOT NULL,
    nom_empresa varchar(100) not null,
    direccion varchar(100) not null,
    telefono int4 not null,
    email varchar(100) not null,

    PRIMARY KEY (id),
    CONSTRAINT uk_emp UNIQUE (nom_empresa)

);
/*Tablas Bayron*/
create table tamaño(
    id int4 not null,
    tamaño varchar(50) not null,

    PRIMARY KEY (id)
);

create table categoria(
    id int4 not null,
    nom_categoria varchar(100) not null,
    descripcion varchar(400) not null,

    PRIMARY KEY (id),
    Constraint uk_cate UNIQUE (nom_categoria)
);

create table productos(
    id int4 not null ,
    id_categoria int4 not null ,
    id_tamano int4 not null  ,
    id_empresa int4 not null,
    nom_producto varchar(100) not null unique ,
    marca varchar(100) not null ,
    modelo varchar(100) not null ,
    precio int4 not null,


    PRIMARY KEY (id),
    /*El dato nom_producto no coje el constraint uk_produc para la foreign key con catalogo*/

    CONSTRAINT uk_produ UNIQUE (id_categoria,id_tamano,id_empresa,precio,nom_producto),
    constraint fk_categ_produ foreign key (id_categoria) references categoria(id),
    constraint fk_tamano_produ foreign key (id_tamano) references tamaño(id),
    constraint fk_empre_produ foreign key (id_empresa) references empresa(id)
);

/*Tablas Andryu*/
create table catalogo(
    id int4 not null,
    nom_producto varchar(100) not null unique ,
    id_producto int4 not null ,
    imagen varchar(500) not null ,

    primary key (id),
    /*No identifica los constraint de uk_cata*/
    constraint uk_cata UNIQUE (id_producto,nom_producto),
    constraint fk_cata_produc foreign key  (id_producto) references productos(id),
    constraint fk_ct_pro foreign key  (nom_producto) references productos(nom_producto)

 );

create table inventario
(
    id           int4        not null,
    id_productos int4        not null,
    id_cliente   int4        not null,
    existencia   varchar(20) not null,

    primary key (id),
    CONSTRAINT uk_inve UNIQUE (id_productos, id_cliente),
    constraint fk_prod_inven foreign key (id_productos) references productos (id),
    constraint fk_client_invent foreign key (id_cliente) references cliente (id)
);

create table detalle_pedido(
    id int4 not null,
    id_cliente int4 not null,
    fecha date not null,

    primary key (id),
    CONSTRAINT uk_detal UNIQUE (id_cliente),
    constraint fk_clien_detped foreign key (id_cliente) references cliente(id)
);
/*Tablas Luis*/
create table factura(
    id int4 not null,
    num_factura int4 not null,
    nombre_cliente varchar(100) not null,
    fecha date not null,

    primary key (id,nombre_cliente),
    CONSTRAINT uk_fact UNIQUE (num_factura,nombre_cliente),
    constraint fk_clien_fact foreign key (nombre_cliente) references cliente (nombre)
);

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

create table carrito_compras(
    id int4 not null,
    id_producto int4 not null,
    nomb_producto varchar(100) not null,
    descuento varchar(100) not null,

    constraint pk_produc_carcom primary key (id_producto),
    constraint fk_produc_carcom foreign key (id_producto) references productos(id),
    constraint fk_catal_carcom foreign key (nomb_producto) references catalogo (nom_producto)
);
/*Tablas Jorge*/
create table historial_compras(
    id int4 not null,
    fecha_compra date not null,
    id_cliente int4 not null ,
    id_producto int4 not null,
    cantidad int4 not null,

    constraint pk_hist_compras primary key (id),
    constraint fk_clien_hiscom foreign key (id_cliente) references cliente(id),
    constraint fk_prod_hiscom foreign key (id_producto) references productos(id)
);

create table historial_ventas(
    id int4 not null ,
    fecha_venta date not null,
    id_producto int4 not null,
    id_cliente int4 not null,
    cantidad int4 not null,

    constraint pk_hist_comp primary key (id),
    constraint fk_prod_histcomp foreign key (id_producto) references productos(id),
    constraint fk_clie_histcomp foreign key (id_cliente) references cliente(id)
);
