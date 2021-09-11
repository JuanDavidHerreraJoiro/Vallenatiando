//registrarImagenesFile.php
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:turismo/Dal/Global.dart';
import 'package:image/image.dart' as Img;

Future uploadRepository(File imageFile, String tipo, String codigo) async {
  String nombre;
  String ruta;
  String tamano;
  String tipoArchivo;
  var stream =
      new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
  var length = await imageFile.length();
  String urls = urlServidor + "/registrarImagenesFile.php";
  var uri = Uri.parse(urls);

  final tempDir = await getTemporaryDirectory();
  final path = tempDir.path;

  var request = new http.MultipartRequest("POST", uri);

  Img.Image? image =
      Img.decodeImage(new File(imageFile.path).readAsBytesSync());
  Img.Image? smallerImg = Img.copyResize(image!, height: 500, width: 500);
  File compresImg = new File(path + "" + imageFile.path.split("/").last)
    ..writeAsBytesSync(Img.encodeJpg(smallerImg, quality: 85));

  imageFile = compresImg;

  nombre = imageFile.path.split("/").last;
  ruta = "Imagenes/" + imageFile.path.split("/").last;
  tamano = (imageFile.lengthSync() / 1000).toString();
  tipoArchivo = imageFile.path.split(".").last;

  var multipartFile = new http.MultipartFile("image", stream, length,
      filename: basename(imageFile.path));
  request.fields['nombreImagen'] = nombre;
  request.fields['ruta'] = ruta;
  request.fields['tamano'] = tamano.toString();
  request.fields['tipoArchivo'] = tipoArchivo;
  request.fields['tipo'] = tipo;
  request.fields['codigo'] = codigo;
  request.files.add(multipartFile);

  var response = await request.send();

  print(tipoArchivo + " / " + codigo);

  if (response.statusCode == 200) {
    print("Image Uploaded");
  } else {
    print("Upload Failed");
  }
  response.stream.transform(utf8.decoder).listen((value) {
    print(value);
  });
}
