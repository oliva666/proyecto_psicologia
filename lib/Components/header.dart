import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({ Key? key }) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {

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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: Text(
                'Asesoría Psicológica',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
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
}