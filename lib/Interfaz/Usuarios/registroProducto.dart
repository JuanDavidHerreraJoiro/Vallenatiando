import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:turismo/Bll/FileImagenesService.dart';
import 'package:turismo/Bll/MensajesService.dart';
import 'package:turismo/Bll/ProductoService.dart';
import 'package:turismo/Entity/Productos.dart';
import 'package:turismo/Interfaz/Usuarios/Inicio.dart';
import 'package:turismo/Interfaz/Usuarios/tipoRegistroEmpresa.dart';
import 'package:turismo/Interfaz/componentes/TextFielForm.dart';
import 'package:turismo/Interfaz/componentes/TextFieldFormDescription.dart';
import 'package:turismo/Interfaz/componentes/TextFileFromDate.dart';
import 'package:turismo/Interfaz/constante.dart';

TextEditingController controladorNombre = new TextEditingController();
TextEditingController controladorPrecio = new TextEditingController();
TextEditingController controladorDescripcion = new TextEditingController();
TextEditingController controladorFechaVigencia = new TextEditingController();
TextEditingController controladorCantidad = new TextEditingController();
TextEditingController controladorPrecioOferta = new TextEditingController();
TextEditingController controladorFechaVigenciaOferta =
    new TextEditingController();
TextEditingController controladorRutaFoto = new TextEditingController();
var img = 'assets/imagenes/AddImagen.png';

class RegistrarProducto extends StatefulWidget {
  final idEmpresa;

  const RegistrarProducto({Key? key, this.idEmpresa}) : super(key: key);

  @override
  _RegistrarProductoState createState() {
    return _RegistrarProductoState();
  }
}

class _RegistrarProductoState extends State<RegistrarProducto> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var width = size.width;
    var moreSize = 50;
    return _RegistrarProductoHomeState(
      idEmpresa: widget.idEmpresa,
    );
  }
}

class _RegistrarProductoHomeState extends StatefulWidget {
  final idEmpresa;

  const _RegistrarProductoHomeState({Key? key, this.idEmpresa})
      : super(key: key);

  @override
  _RegistrarProductoHomeStateState createState() {
    return _RegistrarProductoHomeStateState();
  }
}

class _RegistrarProductoHomeStateState
    extends State<_RegistrarProductoHomeState> {
  String _chosenValue1 = "Seleccionar";
  String imagenPath1 = "";
  String imagenPath2 = "";
  String imagenPath3 = "";
  String imagenPath4 = "";
  String rutaTemporal1 = "";
  String rutaTemporal2 = "";
  String rutaTemporal3 = "";
  String rutaTemporal4 = "";
  DateTime selectedDate = DateTime.now();
  List imgFile = [];

  @override
  void initState() {
    controladorNombre = new TextEditingController();
    controladorPrecio = new TextEditingController();
    controladorDescripcion = new TextEditingController();
    controladorFechaVigencia = new TextEditingController();
    controladorCantidad = new TextEditingController();
    controladorPrecioOferta = new TextEditingController();
    controladorFechaVigenciaOferta = new TextEditingController();
    controladorRutaFoto = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var width = size.width;
    var moreSize = 50;
    const logoSize = 70.0;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 6,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Registro Producto",
                        style: GoogleFonts.montserrat(
                            fontSize: 25,
                            color: DeliveryColorsRedOrange.red1,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFieldForm(
                        controlador: controladorNombre,
                        icono: Icons.indeterminate_check_box,
                        labelText: 'Nombre del producto',
                      ),
                      TextFieldForm(
                        controlador: controladorPrecio,
                        icono: Icons.attach_money,
                        labelText: 'Precio/Costo/Tarifa',
                      ),
                      TextFieldFormDate(
                        controlador: controladorFechaVigencia,
                        icono: Icons.date_range,
                        labelText: 'Fecha de vigencia',
                        iconoSub: Icons.date_range,
                      ),
                      TextFieldForm(
                        controlador: controladorCantidad,
                        icono: Icons.circle,
                        labelText: 'Cantidad',
                      ),
                      TextFieldForm(
                        controlador: controladorPrecioOferta,
                        icono: Icons.money_rounded,
                        labelText: 'Precio Oferta Opcional',
                      ),
                      TextFieldFormDate(
                        controlador: controladorFechaVigenciaOferta,
                        icono: Icons.date_range,
                        labelText: 'Fecha Vigencia de oferta',
                        iconoSub: Icons.date_range,
                      ),
                      TextFieldFormDescription(
                        controlador: controladorDescripcion,
                        icono: Icons.description,
                        labelText: "Descripcion",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Text(
                          "Agregue Fotos del producto",
                          style: GoogleFonts.montserrat(
                              fontSize: 20,
                              color: DeliveryColorsRedOrange.red1,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Row(
                        children: [
                          contenedorImagen(imagenPath1, 1),
                          contenedorImagen(imagenPath2, 2),
                        ],
                      ),
                      Row(
                        children: [
                          contenedorImagen(imagenPath3, 3),
                          contenedorImagen(imagenPath4, 4),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 6,
                  child: InkWell(
                    onTap: () async {
                      if (imgFile.length > 0) {
                        if (controladorNombre.text.isNotEmpty &&
                            controladorPrecio.text.isNotEmpty &&
                            controladorFechaVigencia.text.isNotEmpty &&
                            controladorCantidad.text.isNotEmpty &&
                            controladorDescripcion.text.isNotEmpty) {
                          List listaProductos = await consultarProductoNombre1(
                              controladorNombre.text.trim(),
                              "ACTIVO",
                              widget.idEmpresa);

                          if (listaProductos.length == 0) {
                            Productos producto = new Productos();
                            producto.nombre =
                                controladorNombre.text.toString().toUpperCase();
                            producto.descripcion =
                                controladorDescripcion.text.trim();
                            producto.precio = controladorPrecio.text.trim();
                            producto.fechaVigencia =
                                controladorFechaVigencia.text.trim();
                            producto.cantidad = controladorCantidad.text.trim();
                            producto.precioOfertaOpcional =
                                controladorPrecioOferta.text.trim();
                            producto.fechaVigenciaOferta =
                                controladorFechaVigenciaOferta.text.trim();
                            producto.estado = "ACTIVO";
                            producto.idEmpresa = widget.idEmpresa;

                            RegistrarProductos1(producto);
                            //print("G " + imgFile.length.toString());

                            List listaProductos2 =
                                await consultarProductoNombre1(
                                    controladorNombre.text.trim(),
                                    "ACTIVO",
                                    widget.idEmpresa);

                            for (var i = 0; i < listaProductos2.length; i++) {
                              //print("id = ${}");
                              for (var item in imgFile) {
                                uploadService(File(item.toString()), "PRODUCTO",
                                    listaProductos2[i]["idProducto"]);
                              }
                            }

                            String texto1 = 'PRODUCTO CREADO EXITOSAMENTE';
                            String texto2 = 'CREAR PRODUCTO';
                            await MensajeService(context, texto1,
                                Colors.green.shade300, texto2, true);
                          } else {
                            String texto1 = 'PRODUCTO YA REGISTRADO!¡';
                            String texto2 = 'REGISTRAR PRODUCTO ERROR...';
                            MensajeService(context, texto1,
                                DeliveryColorsRedOrange.red3, texto2, false);
                          }
                        } else {
                          String texto1 = '¿HAY CAMPOS VACIOS?';
                          String texto2 = 'REGISTRAR EMPRESA ERROR...';
                          MensajeService(context, texto1,
                              DeliveryColorsRedOrange.red3, texto2, false);
                        }
                      } else {
                        String texto1 = '¡SELECCIONAR IMAGEN!';
                        String texto2 = 'IMAGEN ERROR...';
                        MensajeService(context, texto1,
                            DeliveryColorsRedOrange.red3, texto2, false);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.0),
                        gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: deliveryGradientsFinal),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Registrar",
                          style: GoogleFonts.montserrat(color: Colors.white, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_rounded),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => TipoRegistroEmpresa(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  dynamic contenedorImagen(String TipoPath, int tipo) {
    return Expanded(
      child: (TipoPath == "")
          ? Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Container(
                alignment: Alignment.center,
                width: 150.0,
                height: 200.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Seleccionar imagen",
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      child: Container(
                        child: IconButton(
                          alignment: Alignment.bottomRight,
                          iconSize: 60,
                          onPressed: () async {
                            //print('click on edit 1');
                            final ImagePicker imagePicker = ImagePicker();
                            PickedFile? pickedfile = await imagePicker.getImage(
                                source: ImageSource.gallery);

                            if (tipo == 1) {
                              imagenPath1 = pickedfile!.path;

                              if (rutaTemporal1 == "") {
                                rutaTemporal1 = imagenPath1;
                              } else {
                                imgFile.remove(rutaTemporal1);
                                rutaTemporal1 = imagenPath1;
                              }
                              imgFile.add(imagenPath1);
                            } else if (tipo == 2) {
                              imagenPath2 = pickedfile!.path;

                              if (rutaTemporal2 == "") {
                                rutaTemporal2 = imagenPath2;
                              } else {
                                imgFile.remove(rutaTemporal2);
                                rutaTemporal2 = imagenPath2;
                              }
                              imgFile.add(imagenPath2);
                            } else if (tipo == 3) {
                              imagenPath3 = pickedfile!.path;

                              if (rutaTemporal3 == "") {
                                rutaTemporal3 = imagenPath3;
                              } else {
                                imgFile.remove(rutaTemporal3);
                                rutaTemporal3 = imagenPath3;
                              }
                              imgFile.add(imagenPath3);
                            } else if (tipo == 4) {
                              imagenPath4 = pickedfile!.path;

                              if (rutaTemporal4 == "") {
                                rutaTemporal4 = imagenPath4;
                              } else {
                                imgFile.remove(rutaTemporal4);
                                rutaTemporal4 = imagenPath4;
                              }
                              imgFile.add(imagenPath4);
                            }
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.add_a_photo,
                            color: Colors.red,
                            size: 60,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Container(
                width: 150.0,
                height: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(
                      File(TipoPath),
                    ),
                    fit: BoxFit.contain,
                  ),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    IconButton(
                      alignment: Alignment.bottomRight,
                      iconSize: 50,
                      onPressed: () async {
                        final ImagePicker imagePicker = ImagePicker();
                        PickedFile? pickedfile = await imagePicker.getImage(
                            source: ImageSource.gallery);

                        if (tipo == 1) {
                          imagenPath1 = pickedfile!.path;

                          if (rutaTemporal1 == "") {
                            rutaTemporal1 = imagenPath1;
                          } else {
                            imgFile.remove(rutaTemporal1);
                            rutaTemporal1 = imagenPath1;
                          }
                          imgFile.add(imagenPath1);
                        } else if (tipo == 2) {
                          imagenPath2 = pickedfile!.path;

                          if (rutaTemporal2 == "") {
                            rutaTemporal2 = imagenPath2;
                          } else {
                            imgFile.remove(rutaTemporal2);
                            rutaTemporal2 = imagenPath2;
                          }
                          imgFile.add(imagenPath2);
                        } else if (tipo == 3) {
                          imagenPath3 = pickedfile!.path;

                          if (rutaTemporal3 == "") {
                            rutaTemporal3 = imagenPath3;
                          } else {
                            imgFile.remove(rutaTemporal3);
                            rutaTemporal3 = imagenPath3;
                          }
                          imgFile.add(imagenPath3);
                        } else if (tipo == 4) {
                          imagenPath4 = pickedfile!.path;

                          if (rutaTemporal4 == "") {
                            rutaTemporal4 = imagenPath4;
                          } else {
                            imgFile.remove(rutaTemporal4);
                            rutaTemporal4 = imagenPath4;
                          }
                          imgFile.add(imagenPath4);
                        }
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.add_a_photo,
                        color: Colors.red,
                        size: 45,
                      ),
                    ),
                    IconButton(
                      alignment: Alignment.bottomRight,
                      iconSize: 50,
                      onPressed: () async {
                        if (tipo == 1) {
                          if (rutaTemporal1 != "") {
                            imgFile.remove(rutaTemporal1);
                            rutaTemporal1 = "";
                            imagenPath1 = "";
                          }
                        } else if (tipo == 2) {
                          if (rutaTemporal2 != "") {
                            imgFile.remove(rutaTemporal2);
                            rutaTemporal2 = "";
                            imagenPath2 = "";
                          }
                        } else if (tipo == 3) {
                          if (rutaTemporal3 != "") {
                            imgFile.remove(rutaTemporal3);
                            rutaTemporal3 = "";
                            imagenPath3 = "";
                          }
                        } else if (tipo == 4) {
                          if (rutaTemporal4 != "") {
                            imgFile.remove(rutaTemporal4);
                            rutaTemporal4 = "";
                            imagenPath4 = "";
                          }
                        }
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.delete_forever_sharp,
                        color: Colors.red,
                        size: 45,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
