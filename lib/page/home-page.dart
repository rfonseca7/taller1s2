import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String operaciones = "";
  String resultadoOperaciones = "";
  List<Text> listaResultados = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora"),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.cyan,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: listaResultados,
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          color: Colors.white,
          height: 100,
          child: Row(
            children: [
              Text(operaciones),
            ],
          ),
        ),
        Container(
          color: Colors.black,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones = "";
                        });
                      },
                      child: Text("CE")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones = "";
                        });
                      },
                      child: Text("C")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += " √ ";
                        });
                      },
                      child: Text("√")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += " ² ";
                        });
                      },
                      child: Text("x²"))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += "7";
                        });
                      },
                      child: Text("7")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += "8";
                        });
                      },
                      child: Text("8")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += "9";
                        });
                      },
                      child: Text("9")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += " ÷ ";
                        });
                      },
                      child: Text("÷"))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += "4";
                        });
                      },
                      child: Text("4")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += "5";
                        });
                      },
                      child: Text("5")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += "6";
                        });
                      },
                      child: Text("6")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += " x ";
                        });
                      },
                      child: Text("x"))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += "1";
                        });
                      },
                      child: Text("1")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += "2";
                        });
                      },
                      child: Text("2")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += "3";
                        });
                      },
                      child: Text("3")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += " - ";
                        });
                      },
                      child: Text("-"))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += "0";
                        });
                      },
                      child: Text("0")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += ",";
                        });
                      },
                      child: Text(".")),
                  ElevatedButton(
                      onPressed: _calcularOperacion, child: Text("=")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += " + ";
                        });
                      },
                      child: Text("+"))
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _calcularOperacion() {
    var arreglo = operaciones.split(" ");
    double resultado = 0;

    if (arreglo[1].trim() == "+") {
      resultado = double.parse(arreglo[0]) + double.parse(arreglo[2]);
    }

    if (arreglo[1].trim() == "-") {
      resultado = double.parse(arreglo[0]) - double.parse(arreglo[2]);
    }

    if (arreglo[1].trim() == "x") {
      resultado = double.parse(arreglo[0]) * double.parse(arreglo[2]);
    }

    if (arreglo[1].trim() == "÷") {
      resultado = double.parse(arreglo[0]) / double.parse(arreglo[2]);
    }

    if (arreglo[1].trim() == "√") {
      resultado = sqrt(double.parse(arreglo[0]));
    }

    if (arreglo[1].trim() == "²") {
      resultado = pow(double.parse(arreglo[0]), 2);
    }

    setState(() {
      listaResultados.add(Text("$resultado"));
    });
    print(arreglo);
  }
}
