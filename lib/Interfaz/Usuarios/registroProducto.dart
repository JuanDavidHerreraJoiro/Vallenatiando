import 'package:flutter/material.dart';
import 'package:turismo/Interfaz/Inicio/tipoRegistro.dart';
import 'package:turismo/Interfaz/componentes/TextFielForm.dart';
import 'package:turismo/Interfaz/componentes/TextFieldFormDescription.dart';
import 'package:turismo/Interfaz/constante.dart';

TextEditingController controladorNIT = new TextEditingController();
TextEditingController controladorNombre = new TextEditingController();
TextEditingController controladorApellido = new TextEditingController();
TextEditingController controladorDireccion = new TextEditingController();
TextEditingController controladorTelefono1 = new TextEditingController();
TextEditingController controladorTelefono2 = new TextEditingController();
var img = 'assets/imagenes/AddImagen.png';

class RegistrarProducto extends StatefulWidget {
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
    return _RegistrarProductoHomeState();
  }
}

class _RegistrarProductoHomeState extends StatefulWidget {
  @override
  _RegistrarProductoHomeStateState createState() {
    return _RegistrarProductoHomeStateState();
  }
}

class _RegistrarProductoHomeStateState
    extends State<_RegistrarProductoHomeState> {
  String _chosenValue1 = "Seleccionar";

  @override
  void initState() {
    controladorNIT = new TextEditingController();
    controladorNombre = new TextEditingController();
    controladorApellido = new TextEditingController();
    controladorDireccion = new TextEditingController();
    controladorTelefono1 = new TextEditingController();
    controladorTelefono2 = new TextEditingController();
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
                        style: TextStyle(
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
                        controlador: controladorNombre, 
                        icono: Icons.attach_money,
                        labelText: 'Precio/Costo/Tarifa',
                      ),
                      TextFieldForm(
                        controlador: controladorDireccion, 
                        icono: Icons.map_sharp,
                        labelText: 'Ubicacion',
                      ),
                      TextFieldForm(
                        controlador: controladorTelefono1, 
                        icono: Icons.date_range,
                        labelText: 'Fecha de vigencia',
                      ),
                      TextFieldForm(
                        controlador: controladorTelefono2, 
                        icono: Icons.circle,
                        labelText: 'Cantidad',
                      ),
                      TextFieldForm(
                        controlador: controladorTelefono2, 
                        icono: Icons.money_rounded,
                        labelText: 'Precio Oferta',
                      ),
                      TextFieldForm(
                        controlador: controladorTelefono2, 
                        icono: Icons.date_range_outlined,
                        labelText: 'Fecha de Vigencia de la oferta',
                      ),
                      TextFieldFormDescription(
                        controlador: controladorNombre, 
                        icono: Icons.description,
                        labelText: "Descripcion",
                      ),
                      SizedBox(height: 20,),

                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Text(
                          "Agrege Fotos del producto",
                        style: TextStyle(
                            fontSize: 20,
                            color: DeliveryColorsRedOrange.red1,
                            fontWeight: FontWeight.w400),
                        ),
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: GestureDetector(
                                onTap: () {
                                  print('click on edit 1');
                                },
                                child: Icon(
                                  Icons.add_a_photo,
                                  color: Colors.red,
                                  size: 80,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: GestureDetector(
                                onTap: () {
                                  print('click on edit 2');
                                },
                                child: Icon(
                                  Icons.add_a_photo,
                                  color: Colors.red,
                                  size: 80,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: GestureDetector(
                                onTap: () {
                                  print('click on edit 1');
                                },
                                child: Icon(
                                  Icons.add_a_photo,
                                  color: Colors.red,
                                  size: 80,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: GestureDetector(
                                onTap: () {
                                  print('click on edit 2');
                                },
                                child: Icon(
                                  Icons.add_a_photo,
                                  color: Colors.red,
                                  size: 80,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 6,
                  child: InkWell(
                    onTap: () async { },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.0),
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Colors.orangeAccent,
                            Colors.redAccent,
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Registrar",
                          style: TextStyle(color: Colors.white, fontSize: 20),
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
                          builder: (_) => TipoRegistro(),
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
}
