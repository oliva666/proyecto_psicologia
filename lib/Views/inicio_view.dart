import 'package:flutter/material.dart';
import 'package:proyecto_psicologia/Components/boton_psicologia.dart';

class InicioView extends StatefulWidget {
  const InicioView({ Key? key }) : super(key: key);

  @override
  _InicioViewState createState() => _InicioViewState();
}

class _InicioViewState extends State<InicioView> {

  double height = 0;
  double width = 0;

  // metodo para obtener el tamaño de la pantalla
  void _getScreenSize(){
    setState(() {
      height = MediaQuery.of(context).size.height;
      width = MediaQuery.of(context).size.width;
    });
  }

  @override
  Widget build(BuildContext context) {
    _getScreenSize();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              header(),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  botonSalir(),

                  SizedBox(
                    child: Row(
                      children: [
                        botonAgendarCita(),
                        botonConsultarCita(),
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  header(){
    return Container(
      height: 80,
      width: width,
      color: const Color(0xFF1F3D6D),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              'assets/images/logo.png',
              fit: BoxFit.contain,
            ),
            const Text(
              'Asesoría Psicológica',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
            Image.network(
              'assets/images/logo2.png',
              fit: BoxFit.contain,
            )
          ],
        ),
      ),
    );
  }

  botonSalir(){
    // boton para salir
    return BotonPsicologia(
      iconData: Icons.logout,
      text: 'Salir',
      onTap: (){},
    );
  }

  botonAgendarCita(){
    // boton agendar cita
    return BotonPsicologia(
      iconData: Icons.calendar_today_rounded,
      text: 'Agendar cita',
      onTap: (){},
      height: 70,
      width: 150,
    );
  }

  botonConsultarCita(){
    // boton para consultar citas
    return BotonPsicologia(
      iconData: Icons.alarm_rounded,
      text: 'Consultar cita',
      onTap: (){},
      height: 70,
      width: 150,
    );
  }
}