import 'dart:io';
import 'package:turismo/Dal/FileImagenesRepository.dart';

Future uploadService(File imageFile,String tipo,String codigo)  async {
  return uploadRepository(imageFile, tipo, codigo);
}