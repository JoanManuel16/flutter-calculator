import 'package:calculadora/src/NotacionPolacaInversa.dart';
import 'package:calculadora/src/ShuntignYar.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  String operacion = "";

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("calculadora"),
        ),
        body: AutoSizeText(
          operacion,
          minFontSize: 20.0,
          maxFontSize: 80.0,
          maxLines: 2,
          textAlign: TextAlign.end,
          style: TextStyle(
            fontWeight: FontWeight.w200,
            decoration: TextDecoration.none,
            fontSize: 80,
          ),
        ),
        floatingActionButton: _construirTeclado());
  }

  Widget _construirBotones(
      {String label = "",
      Color textColor = Colors.white,
      Color backgroundColor = Colors.grey}) {
    return Expanded(
      child: FloatingActionButton(
        backgroundColor: backgroundColor,
        child: Text(
          label,
          style: TextStyle(fontSize: 25, color: textColor),
        ),
        onPressed: () {
          switch (label) {
            case '1':
              setState(() {
                operacion += '1';
              });
              break;
            case '2':
              setState(() {
                operacion += '2';
              });
              break;
            case '3':
              setState(() {
                operacion += '3';
              });
              break;
            case '4':
              setState(() {
                operacion += '4';
              });
              break;
            case '5':
              setState(() {
                operacion += '5';
              });
              break;
            case '6':
              setState(() {
                operacion += '6';
              });
              break;
            case '7':
              setState(() {
                operacion += '7';
              });
              break;
            case '8':
              setState(() {
                operacion += '8';
              });
              break;
            case '9':
              setState(() {
                operacion += '9';
              });
              break;
            case '0':
              setState(() {
                operacion += '0';
              });
              break;
            case 'AC':
              setState(() {
                operacion = '';
              });
              break;
            case 'DEL':
              setState(() {
                if (!(operacion == '')) {
                  operacion = operacion.substring(0, operacion.length - 1);
                }
              });
              break;
            case '/':
              setState(() {
                operacion += '/';
              });
              break;
            case 'x':
              setState(() {
                operacion += '*';
              });
              break;
            case '%':
              setState(() {
                try {
                  num x = double.parse(operacion);
                  x /= 100;
                  operacion = "$x";
                } catch (e) {
                  print("error la variable $operacion no es un nuemro");
                }
              });
              break;
            case '+':
              setState(() {
                if (operacion != '') {
                  operacion += '+';
                }
              });
              break;
            case '-':
              setState(() {
                if (operacion != '') {
                  operacion += '-';
                }
              });
              break;
            case '.':
              setState(() {
                RegExp exp2 = RegExp('[-+\\*/%^()]');
                if (operacion != '') {
                  if (!exp2.hasMatch(operacion[operacion.length - 1])) {
                    operacion += '.';
                  }
                }
              });
              break;
            case '( )':
              setState(() {
                RegExp exp2 = RegExp('[-+\\*/%^]');
                if (operacion == '') {
                  operacion += '(';
                  return;
                }
                if (exp2.hasMatch(operacion[operacion.length - 1])) {
                  operacion += '(';
                  return;
                }
                if (operacion[operacion.length - 1] != "(") {
                  operacion += ')';
                } else {
                  operacion += '(';
                }
              });
              break;
            case '=':
              setState(() {
                ShuntingYard sy = new ShuntingYard(operacion);
                NotacionPolacaInversa npi = new NotacionPolacaInversa(sy.arr);
                double resultado = npi.RPN();
                operacion = "$resultado";
              });
              break;
          }
        },
      ),
    );
  }

  Widget _buildDisplay() {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                operacion,
                minFontSize: 20.0,
                maxFontSize: 80.0,
                maxLines: 1,
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  decoration: TextDecoration.none,
                  fontSize: 80.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _construirTeclado() {
    return Container(
      color: Colors.white,
      height: 400.0,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _construirBotones(label: 'AC', textColor: Colors.red),
                _construirBotones(label: 'DEL', textColor: Colors.green[900]!),
                _construirBotones(label: '%', textColor: Colors.green[900]!),
                _construirBotones(label: '/', textColor: Colors.green[900]!),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _construirBotones(label: '7'),
                _construirBotones(label: '8'),
                _construirBotones(label: '9'),
                _construirBotones(label: 'x', textColor: Colors.green[900]!),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _construirBotones(label: '4'),
                _construirBotones(label: '5'),
                _construirBotones(label: '6'),
                _construirBotones(label: '+', textColor: Colors.green[900]!),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _construirBotones(label: '1'),
                _construirBotones(label: '2'),
                _construirBotones(label: '3'),
                _construirBotones(label: '-', textColor: Colors.green[900]!),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _construirBotones(label: '( )'),
                _construirBotones(label: '0'),
                _construirBotones(label: '.'),
                _construirBotones(
                    label: '=',
                    textColor: Colors.white,
                    backgroundColor: Colors.green[900]!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
