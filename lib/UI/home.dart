import 'package:flutter/material.dart';
import 'package:height_slider/height_slider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _infoText = "Informe seus dados";
  int height = 160;

  int sexo = 1;
  double _peso = 60;

  /*void _alerta(BuildContext context) {
    var alertaResultado = AlertDialog(
      title: Text("Seu IMC é "),
      content: Text("$_infoText "),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("OK"))
      ],
    );
    showDialog(context: context, builder: (context) => alertaResultado);
  }*/

  void _somar() {
    setState(() {
      _peso += 0.5;
    });
  }

  void _subtrair() {
    setState(() {
      _peso -= 0.5;
    });
  }

  void _sexoM() {
    setState(() {
      sexo = 0;
      print(sexo);
    });
  }

  void _sexoH() {
    setState(() {
      sexo = 1;
      print(sexo);
    });
  }

  void _resetField() {
    setState(() {
      _infoText = "Informe seus dados";
    });
  }

  void _calculate() {
    setState(() {
      double _imc = _peso / (height * height);
      if (_imc < 18.6) {
        _infoText = "você está abaixo do peso (${_imc.toStringAsPrecision(3)})";
      } else if (_imc >= 18.7 && _imc <= 24.9) {
        _infoText = "você está no peso ideal (${_imc.toStringAsPrecision(3)})";
      } else if (_imc >= 25.0 && _imc <= 29.9) {
        _infoText = "você está com sobrepeso (${_imc.toStringAsPrecision(3)})";
      } else if (_imc >= 30.0 && _imc <= 34.9) {
        _infoText =
            "você está com obesidade grau 1 (${_imc.toStringAsPrecision(3)})";
      } else if (_imc >= 35.0 && _imc <= 39.9) {
        _infoText =
            "você está com obesidade no grau 2 (${_imc.toStringAsPrecision(3)})";
      } else {
        _infoText =
            "você está com obesidade no grau 3 (${_imc.toStringAsPrecision(3)})";
      }
      // _alerta(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(18, 21, 59, 1.0),
          centerTitle: true,
          title: Text(
            "Calculdora de IMC",
            style: TextStyle(fontSize: 25),
          ),
          actions: <Widget>[
//IconButton(icon: Icon(Icons.refresh), onPressed: _resetField)
          ],
        ),
        backgroundColor: Color.fromRGBO(12, 18, 52, 30),
        body: SingleChildScrollView(
          //SingLeChildScrollViews serve para criar um Scroll view
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              //stretch é para preencher a tela toda
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: InkWell(
                          enableFeedback: true,
                          autofocus: true,
                          onTap: _sexoH,
                          child: Container(
                              color: Color.fromRGBO(39, 42, 78, 35),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    child: Image.asset("images/homem.png",
                                        scale: 20, color: Colors.white),
                                    height: 90,
                                    width: 180,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    child: Text(
                                      "HOMEM",
                                      style: TextStyle(
                                          fontWeight: sexo == 0
                                              ? FontWeight.normal
                                              : FontWeight.bold,
                                          fontSize: 20,
                                          color: sexo == 0
                                              ? Color.fromRGBO(
                                                  104, 106, 120, 50)
                                              : Colors.white),
                                    ), //
                                  )
                                ],
                              )),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: InkWell(
                          onTap: _sexoM,
                          child: Container(
                              color: Color.fromRGBO(39, 42, 78, 35),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    child: Image.asset(
                                      "images/mulher.png",
                                      color: Colors.white,
                                      scale: 17,
                                    ),
                                    height: 90,
                                    width: 180,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    child: Text(
                                      "MULHER",
                                      style: TextStyle(
                                          fontWeight: sexo == 1
                                              ? FontWeight.normal
                                              : FontWeight.bold,
                                          fontSize: 20,
                                          color: sexo == 1
                                              ? Color.fromRGBO(
                                                  104, 106, 120, 50)
                                              : Colors.white),
                                    ),
                                  )
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 70),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                                color: Color.fromRGBO(39, 42, 78, 35),
                                width: 180,
                                height: 150,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      "Peso",
                                      style: TextStyle(
                                        color:
                                            Color.fromRGBO(104, 106, 120, 50),
                                        fontSize: 25,
                                      ),
                                    ),
                                    Text("$_peso KG",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 35,
                                        )),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Container(
                                              width: 40,
                                              height: 40,
                                              color: Color.fromRGBO(
                                                  124, 126, 140, 50),
                                              child: IconButton(
                                                  iconSize: 25,
                                                  icon: Icon(
                                                    Icons.remove,
                                                    // size: 30,
                                                    color: Colors.white,
                                                  ),
                                                  onPressed: _subtrair)),
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            color: Color.fromRGBO(
                                                124, 126, 140, 50),
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.add,
                                                size: 25,
                                                color: Colors.white,
                                              ),
                                              onPressed: _somar,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                              height: 50.0,
                              child: RaisedButton(
                                //risedButton é um botao preenchido
                                onPressed: _calculate,
                                child: Text(
                                  "Calcular",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                                color: sexo == 0 ? Colors.pink : Colors.blue,
                              )),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        color: Color.fromRGBO(39, 42, 78, 35),
                        width: 180,
                        height: 400,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(3, 8, 3, 5),
                          child: HeightSlider(
                              primaryColor: Color.fromRGBO(18, 21, 59, 1.0),
                              personImagePath:
                                  sexo == 1 ? "images/01.svg" : "images/02.svg",
                              currentHeightTextColor: Colors.white,
                              numberLineColor: Colors.white,
                              sliderCircleColor:
                                  sexo == 0 ? Colors.pink : Colors.blue,
                              height: height,
                              minHeight: 130,
                              onChange: (val) => setState(() => height = val)),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  _infoText,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
        ));
  }
}
