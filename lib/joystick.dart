import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';

const ballSize = 20.0;
const step = 10.0;
double valorSlider = 0;

double centroX = 0;
double centroY = 0;

double xAnt = centroX;
double yAnt = centroY;

String mensaje = '';

class JoystickExample extends StatefulWidget {
  const JoystickExample({Key? key}) : super(key: key);

  @override
  _JoystickExampleState createState() => _JoystickExampleState();
}

class _JoystickExampleState extends State<JoystickExample> {
  double _x = 100;
  double _y = 100;
  JoystickMode _joystickMode = JoystickMode.all;

  @override
  void didChangeDependencies() {
    _x = MediaQuery.of(context).size.width / 2 - ballSize / 2;
    centroX = _x;
    centroY = MediaQuery.of(context).size.height / 2 - ballSize / 2;
    xAnt = centroX;
    yAnt = centroY;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Color.fromARGB(255, 32, 192, 37),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
                //  color: Color.fromARGB(255, 72, 63, 112),
                ),
            Ball(_x, _y),
            Text(mensaje),
            Align(
              //alignment: const Alignment(0, 0.8),
              child: Joystick(
                mode: _joystickMode,
                listener: (details) {
                  setState(() {
                    _x = _x + step * details.x;
                    _y = _y + step * details.y;
                    mensaje = posicion(_x, _y);
                  });
                },
              ),
            ),
            /*
            Slider(
              value: valorSlider,
              min: 0,
              max: 100,
              divisions: 50,
              label: valorSlider.round().toString(),
              activeColor: Colors.redAccent,
              inactiveColor: Colors.blueAccent,
              onChanged: (nuevoValor) {
                print(nuevoValor);
            }),
            */
          ],
        ),
      ),
    );
  }
}

class Ball extends StatelessWidget {
  final double x;
  final double y;

  const Ball(this.x, this.y, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      child: Container(
        width: ballSize,
        height: ballSize,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.redAccent,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 3),
            )
          ],
        ),
      ),
    );
  }
}

String posicion(double x, double y) {
  String direccion = '';

  if (x > xAnt) {
    if (y > yAnt) {
      direccion = 'Derecha-Abajo';
    } else {
      direccion = 'derecha-Arriba';
    }
  } else {
    if (y > yAnt) {
      direccion = 'Izquierda-Abajo';
    } else {
      direccion = 'Izquierda-Arriba';
    }
  }

  xAnt = x;
  yAnt = y;

  return direccion;
}
