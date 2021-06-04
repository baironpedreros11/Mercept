create table detalle_pedido(
    id int4 not null,
    id_cliente int4 not null,
    fecha date not null,

    constraint pk_detalle_pedido primary key (id,id_cliente),
    constraint fk_clien_detped foreign key (id_cliente) references cliente(id)
)
;

create table factura(
    num_factura int4 not null,
    nombre_cliente varchar(100) not null,
    fecha date not null,

    constraint pk_factura primary key (nombre_cliente),
    constraint fk_clien_fact foreign key (nombre_cliente) references cliente (Nombre)
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

