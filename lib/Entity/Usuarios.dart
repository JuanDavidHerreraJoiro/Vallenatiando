class Usuarios {
  var idUsuario;
  var idPersona;
  var usuario;
  var password;
  var estado;

  Usuarios({
    this.idUsuario,
    this.idPersona,
    this.usuario,
    this.password,
    this.estado,
  });

  factory Usuarios.fromJson(Map<String, dynamic> json) => new Usuarios(
      idUsuario: json['idUsuario'],
      idPersona: json['idPersona'],
      usuario: json['usuario'],
      password: json['password'],
      estado: json['estado']);

  Map<String, dynamic> toMap() => {
        "idUsuario": idUsuario,
        "idPersona": idPersona,
        "usuario": usuario,
        "password": password,
        "estado": estado
      };
}
