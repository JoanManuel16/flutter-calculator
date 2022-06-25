import 'package:flutter/material.dart';

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
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              operacion,
              style: TextStyle(fontSize: 25),
            )
          ],
        )),
        floatingActionButton: _construirTeclado());
  }

  Widget _construirBotones(String label,
      {Color textColor = Colors.white, Color backgroundColor = Colors.grey}) {
    return Expanded(
      child: FloatingActionButton(
        backgroundColor: backgroundColor,
        child: Text(
          label,
          style: TextStyle(fontSize: 24, color: textColor),
        ),
        onPressed: () {
          setState(() {});
        },
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
                _construirBotones('AC', textColor: Colors.red),
                _construirBotones('DEL', textColor: Colors.green[900]!),
                _construirBotones('%', textColor: Colors.green[900]!),
                _construirBotones('/', textColor: Colors.green[900]!),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _construirBotones('7'),
                _construirBotones('8'),
                _construirBotones('9'),
                _construirBotones('x', textColor: Colors.green[900]!),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _construirBotones('4'),
                _construirBotones('5'),
                _construirBotones('6'),
                _construirBotones('+', textColor: Colors.green[900]!),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _construirBotones('1'),
                _construirBotones('2'),
                _construirBotones('3'),
                _construirBotones('-', textColor: Colors.green[900]!),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _construirBotones('+/-'),
                _construirBotones('0'),
                _construirBotones('.'),
                _construirBotones('=',
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
