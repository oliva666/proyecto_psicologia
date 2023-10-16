import 'package:flutter/material.dart';
import 'package:proyecto_psicologia/Components/boton_psicologia.dart';
import 'package:proyecto_psicologia/Components/header.dart';

class TestVocacionalView extends StatefulWidget {
  const TestVocacionalView({ Key? key }) : super(key: key);

  @override
  State<TestVocacionalView> createState() => _TestVocacionalViewState();
}

class _TestVocacionalViewState extends State<TestVocacionalView> {

  bool isChanged = false;
  bool isFinished = false;

  IconData idBoton = Icons.arrow_forward_rounded;

  int numPage = 1;
  int taps = 0;

  String textoBoton = 'Siguiente';

  PageController pageController = PageController(
    initialPage: 0,
    viewportFraction: 1,
    keepPage: true
  );

  Map<int,String> preguntas = {
    0: '¿Con qué frecuencia te sientes triste o deprimido?',
    1: '¿Con qué frecuencia sientes que la vida no tiene sentido?',
    2: '¿Has tenido pensamientos de hacer daño a ti mismo o suicidarte?',
    3: '¿Cómo te sientes con respecto a tu desempeño académico?',
    4: '¿Cómo te sientes con respecto a tu desempeño laboral?',
    5: '¿Cómo te sientes con respecto a tu desempeño en tus relaciones interpersonales?',
    6: '¿Cómo te sientes con respecto a tu desempeño en tu vida familiar?',
    7: '¿Cómo te sientes con respecto a tu desempeño en tu vida social?',
    8: '¿Cómo te sientes con respecto a tu desempeño en tu vida sexual?',
  };
  
  Map<int,Map<int,String>> respuestas = {
    0: {
      0: 'Nunca',
      1: 'Casi nunca',
      2: 'A veces',
      3: 'Casi siempre',
      4: 'Siempre'
    },
    1: {
      0: 'Nunca',
      1: 'Casi nunca',
      2: 'A veces',
      3: 'Casi siempre',
      4: 'Siempre'
    },
    2: {
      0: 'Nunca',
      1: 'Casi nunca',
      2: 'A veces',
      3: 'Casi siempre',
      4: 'Siempre'
    },
    3: {
      0: 'Muy mal',
      1: 'Mal',
      2: 'Regular',
      3: 'Bien',
      4: 'Muy bien'
    },
    4: {
      0: 'Muy mal',
      1: 'Mal',
      2: 'Regular',
      3: 'Bien',
      4: 'Muy bien'
    },
    5: {
      0: 'Muy mal',
      1: 'Mal',
      2: 'Regular',
      3: 'Bien',
      4: 'Muy bien'
    },
    6: {
      0: 'Muy mal',
      1: 'Mal',
      2: 'Regular',
      3: 'Bien',
      4: 'Muy bien'
    },
    7: {
      0: 'Muy mal',
      1: 'Mal',
      2: 'Regular',
      3: 'Bien',
      4: 'Muy bien'
    },
    8: {
      0: 'Muy mal',
      1: 'Mal',
      2: 'Regular',
      3: 'Bien',
      4: 'Muy bien'
    },
  };

  Map<int,String> respuestasSeleccionadas = {};

  Map<int,String> abcedario = {
    0: 'A',
    1: 'B',
    2: 'C',
    3: 'D',
    4: 'E',
    5: 'F',
    6: 'G',
  };

  
  String calcularRespuestaFrecuente(Map<int, String?> respuestasSelec) {
    // en esta parte se calcula la respuesta mas frecuente
    final frecuencias = respuestasSelec.values.fold<Map<String, int>>(
      {},
      // esta funcion se ejecuta por cada respuesta
      (frequencies, respuesta) {
        // se obtiene la letra de la respuesta
        final letra = respuesta!.split('   ')[0];
        // se retorna un nuevo mapa con la letra y la frecuencia
        return {...frequencies, letra: (frequencies[letra] ?? 0) + 1};
      }
    );

    final letraMasFrecuente = frecuencias.entries.reduce((a, b) => a.value > b.value ? a : b);
    final porcentaje = (letraMasFrecuente.value / respuestasSelec.length) * 100;

    return '${letraMasFrecuente.key} $porcentaje%';
  }



  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      pageController.addListener(() {
        setState(() {
          numPage = pageController.page!.toInt() + 1;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Header(),
            filaBotones(),
            body(),
          ],
        )
      )
    );
  }

  body(){
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          pageBuilder(
            preguntas: preguntas,
            respuestas: respuestas,
          ),
          const SizedBox(height: 20,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(taps > 0)
                botonRetroceso(),
              const SizedBox(width: 20,),
              Text(
                '$numPage de ${preguntas.length}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(width: 20,),
              botonSiguiente(),
            ],
          ),
        ],
      ),
    );
  }

  filaBotones(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BotonPsicologia(
          iconData: Icons.arrow_back_rounded,
          text: 'Volver',
          onTap: (){
            Navigator.pop(context);
          },
        ),
        BotonPsicologia(
          iconData: Icons.save_rounded,
          text: 'Guardar',
          width: 150,
          onTap: (){},
        ),
      ],
    );
  }

  pageBuilder({
    required Map<int,String> preguntas,
    required Map<int,Map<int,String>> respuestas,
  }){
    return SizedBox(
      height: 400,
      width: 500,
      child: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: preguntas.length,
        itemBuilder: (context,index){
          return Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    preguntas[index]!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Column(
                    children: respuestas[index]!.entries.map(
                      (e) {
                        int pos = respuestas[index]!.values.toList().indexOf(e.value);
                        String opcion = '${abcedario[pos]!}   ${e.value}';
                        return RadioListTile(
                          title: Text(opcion),
                          value: opcion,
                          groupValue: respuestasSeleccionadas[index],
                          onChanged: (value){
                            setState(() {
                              respuestasSeleccionadas[index] = value.toString();
                            });
                          },
                        );
                      }
                    ).toList(),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  botonRetroceso(){
    return BotonPsicologia(
      iconData: Icons.arrow_back_rounded,
      text: 'Retroceder',
      width: 165,
      onTap: (){
        setState(() {
          taps--;
          pageController.previousPage(
            duration: const Duration(milliseconds: 300), 
            curve: Curves.easeInOut
          );
        });
      },
    );
  }

  botonSiguiente(){
    return BotonPsicologia(
      iconData: idBoton,
      text: textoBoton,
      width: 150,
      onTap: (){
        // No se puede avanzar si no se ha seleccionado una respuesta
        if(respuestasSeleccionadas[taps] == null){
          return;
        }
        setState(() {
          if(taps < preguntas.length - 1){
            taps++;
            if(taps == preguntas.length - 1){
              textoBoton = 'Finalizar';
              idBoton = Icons.check_rounded;
            }
          }else{
            isFinished = true;
            showDialog(
              
              context: context, 
              builder: (context){
                return AlertDialog(
                  title: const Text('Test Vocacional'),
                  content: Text('Tu porcentaje de respuestas es: ${calcularRespuestaFrecuente(respuestasSeleccionadas)}'),
                  actions: [
                    TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      }, 
                      child: const Text('Aceptar')
                    )
                  ],
                );
              }
            );
          }

          pageController.nextPage(
            duration: const Duration(milliseconds: 300), 
            curve: Curves.easeInOut
          );
        });
      },
    );
  }


}