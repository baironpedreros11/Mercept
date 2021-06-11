create table carrito_compras(
    id_producto int4 not null,
    nom_producto varchar(100) not null,
    descuento varchar(100) not null,

    constraint pk_produc_carcom primary key (id_producto,nom_producto),
    constraint fk_produc_carcom foreign key (id_producto,nom_producto) references productos(id, nom_producto)
);

create table historial_compras(
    fecha_compra date not null,
    id_cliente int4 not null ,
    id_producto int4 not null,
    cantidad int4 not null,

    constraint pk_hist_compras primary key (fecha_compra,id_cliente,id_producto),
    constraint fk_clien_hiscom foreign key (id_cliente) references cliente(id),
    constraint fk_prod_hiscom foreign key (id_producto) references productos(id)
);

create table historial_ventas(
    fecha_venta date not null,
    id_producto int4 not null,
    id_cliente int4 not null,
    cantidad int4 not null,

    constraint pk_hist_comp primary key (fecha_venta,id_producto,id_cliente),
    constraint fk_prod_histcomp foreign key (id_producto) references productos(id),
    constraint fk_clie_histcomp foreign key (id_cliente) references cliente(id)
);