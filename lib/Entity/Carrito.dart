class Carrito {
  var id_carrito;
  var id_cliente;
  var id_producto;

  Carrito({this.id_carrito, this.id_cliente, this.id_producto});

  factory Carrito.fromJson(Map<String, dynamic> json) => Carrito(
        id_carrito: json['id_carrito'],
        id_cliente: json['id_cliente'],
        id_producto: json['id_producto'],
      );

  Map<String, dynamic> toMap() => {
        "id_carrito": id_carrito,
        "id_cliente": id_cliente,
        "id_producto": id_producto,
      };
}
