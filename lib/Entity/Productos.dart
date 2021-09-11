class Productos {
  var idProducto;
  var nombre;
  var descripcion;
  var precio;
  var fechaVigencia;
  var cantidad;
  var precioOfertaOpcional;
  var fechaVigenciaOferta;
  var estado;
  var idEmpresa;

  Productos({
    this.idProducto,
    this.nombre,
    this.descripcion,
    this.precio,
    this.fechaVigencia,
    this.cantidad,
    this.precioOfertaOpcional,
    this.fechaVigenciaOferta,
    this.estado,
    this.idEmpresa,
  });

  factory Productos.fromJson(Map<String, dynamic> json) => new Productos(
      idProducto: json['idProducto'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      precio: json['precio'],
      fechaVigencia: json['fechaVigencia'],
      cantidad: json['cantidad'],
      precioOfertaOpcional: json['precioOfertaOpcional'],
      fechaVigenciaOferta: json['fechaVigenciaOferta'],
      estado: json['estado'],
      idEmpresa: json['idEmpresa']);

  Map<String, dynamic> toMap() => {
        "idProducto": idProducto,
        "nombre": nombre,
        "descripcion": descripcion,
        "precio": precio,
        "fechaVigencia": fechaVigencia,
        "cantidad": cantidad,
        "precioOfertaOpcional": precioOfertaOpcional,
        "fechaVigenciaOferta": fechaVigenciaOferta,
        "estado": estado,
        "idEmpresa": idEmpresa
      };
}
