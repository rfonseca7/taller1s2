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
  List<Container> containers = [];
  int sinSignos = 0;
  String errorMath = "";

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
            color: Colors.white60,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: containers,
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          color: Colors.blue,
          height: 100,
          child: Row(
            children: [
              Text(operaciones),
              Text(errorMath),
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
                          errorMath = "";
                        });
                      },
                      child: Text("CE")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones = "";
                          errorMath = "";
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

  /*
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
*/
  void _calcularOperacion() {
    try {
      do {
        List<String> arreglo = operaciones.split(' ');
        if (arreglo.length == 1) {
          if (operaciones.contains("+") ||
              operaciones.contains("-") ||
              operaciones.contains("x") ||
              operaciones.contains("÷")) {
            break;
          } else {
            sinSignos++;
            break;
          }
        }
        if (operaciones.contains("x") || operaciones.contains("÷")) {
          sinSignos = 0;
          for (int x = 0; x < arreglo.length; x++) {
            if (arreglo[x] == "x") {
              var resultado =
                  double.parse(arreglo[x - 1]) * double.parse(arreglo[x + 1]);

              operaciones = operaciones.replaceAll(
                  '${arreglo[x - 1]} ${arreglo[x]} ${arreglo[x + 1]}',
                  '$resultado');
              break;
            } else if (arreglo[x] == "÷") {
              var resultado =
                  double.parse(arreglo[x - 1]) / double.parse(arreglo[x + 1]);

              operaciones = operaciones.replaceAll(
                  '${arreglo[x - 1]} ${arreglo[x]} ${arreglo[x + 1]}',
                  '$resultado');
              break;
            }
          }
        } else if (operaciones.contains('+') || operaciones.contains('-')) {
          sinSignos = 0;
          for (int x = 0; x < arreglo.length; x++) {
            if (arreglo[x] == '+') {
              var resultado =
                  double.parse(arreglo[x - 1]) + double.parse(arreglo[x + 1]);

              operaciones = operaciones.replaceAll(
                  '${arreglo[x - 1]} ${arreglo[x]} ${arreglo[x + 1]}',
                  '$resultado');
              break;
            } else if (arreglo[x] == "-") {
              var resultado =
                  double.parse(arreglo[x - 1]) - double.parse(arreglo[x + 1]);

              operaciones = operaciones.replaceAll(
                  '${arreglo[x - 1]} ${arreglo[x]} ${arreglo[x + 1]}',
                  '$resultado');
              break;
            }
          }
        } else if (operaciones.contains("√") || operaciones.contains("²")) {
          sinSignos = 0;
          for (int x = 0; x < arreglo.length; x++) {
            if (arreglo[x] == "√") {
              var resultado = pow(double.parse(arreglo[x + 1]), 1 / 2);
              operaciones = operaciones.replaceAll(
                  '${arreglo[x]} ${arreglo[x + 1]}', '$resultado');
            } else if (arreglo[x] == '²') {
              var resultado = pow(double.parse(arreglo[x - 1]), 2);
              operaciones = operaciones.replaceAll(
                  '${arreglo[x - 1]} ${arreglo[x]}', '$resultado');
            }
          }
        }
      } while (operaciones.contains('+') ||
          operaciones.contains("-") ||
          operaciones.contains("x") ||
          operaciones.contains("÷") ||
          operaciones.contains("√") ||
          operaciones.contains("²"));

      if (sinSignos > 0) {
        if (sinSignos == 1) {
          setState(() {
            containers.add(Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text(operaciones)],
              ),
            ));
          });
        }
      } else {
        setState(() {
          containers.add(Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Text(operaciones)],
            ),
          ));
        });
      }
    } catch (e) {
      setState(() {
        errorMath = "Expresión  malformada";
      });
    }
  }
}
