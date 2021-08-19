class Personas {
  var idPersona;
  var nombre;
  var apellido;
  var tipoIdentificacion;
  var direccion;
  var celular;
  var telefono;
  var estado;
  var usuario;
  var password;

  Personas({
    this.idPersona,
    this.nombre,
    this.apellido,
    this.tipoIdentificacion,
    this.direccion,
    this.celular,
    this.telefono,
    this.estado,
    this.usuario,
    this.password,
  });

  factory Personas.fromJson(Map<String, dynamic> json) => new Personas(
      idPersona: json['idPersona'],
      nombre: json['nombre'],
      apellido: json['apellido'],
      tipoIdentificacion: json['tipoIdentificacion'],
      direccion: json['direccion'],
      celular: json['celular'],
      telefono: json['telefono'],
      estado: json['estado'],
      usuario: json['usuario'],
      password: json['password']);

  Map<String, dynamic> toMap() => {
        "idPersona": idPersona,
        "nombre": nombre,
        "apellido": apellido,
        "tipoIdentificacion": tipoIdentificacion,
        "direccion": direccion,
        "celular": celular,
        "telefono": telefono,
        "estado": estado,
        "usuario": usuario,
        "password": password
      };
}
