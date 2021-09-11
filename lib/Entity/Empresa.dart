class Empresa {
  dynamic idEmpresa;
  dynamic correo;
  dynamic tipoID;
  dynamic descripcion;
  dynamic nombre;
  dynamic direccion;
  dynamic telefono;
  dynamic celular;
  dynamic estado;
  dynamic longitud;
  dynamic latitud;
  dynamic idPersona;

  Empresa({
    this.idEmpresa,
    this.correo,
    this.tipoID,
    this.descripcion,
    this.nombre,
    this.direccion,
    this.telefono,
    this.celular,
    this.estado,
    this.longitud,
    this.latitud,
    this.idPersona,
  });

  factory Empresa.fromJson(Map<String, dynamic> json) => new Empresa(
      idEmpresa: json['idEmpresa'],
      correo: json['correo'],
      tipoID: json['tipoID'],
      descripcion: json['descripcion'],
      nombre: json['nombre'],
      direccion: json['direccion'],
      telefono: json['telefono'],
      celular: json['celular'],
      longitud: json['longitud'],
      latitud: json['latitud'],
      estado: json['estado'],
      idPersona: json['idPersona']);

  Map<String, dynamic> toMap() => {
        "idEmpresa": idEmpresa,
        "correo": correo,
        "tipoID": tipoID,
        "descripcion": descripcion,
        "nombre": nombre,
        "direccion": direccion,
        "telefono": telefono,
        "celular": celular,
        "estado": estado,
        "longitud": longitud,
        "latitud": latitud,
        "idPersona": idPersona
      };
}
