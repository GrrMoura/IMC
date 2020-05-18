import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    title: "só teste",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController hightController = TextEditingController();

  String _infoText = "Informe seus dados";

  void _resetField() {
    setState(() {
      weightController.text = "";
      hightController.text = "";
      _infoText = "Informe seus dados";
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double hight = double.parse(hightController.text) / 100;
      double imc = weight / (hight * hight);
      if (imc < 18.6) {
        _infoText = "você está abaixo do peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.7 && imc <= 24.9) {
        _infoText = "você está no peso ideal (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 25.0 && imc <= 29.9) {
        _infoText = "você está com sobrepeso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 30.0 && imc <= 34.9) {
        _infoText =
            "você está com obesidade grau 1 (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 35.0 && imc <= 39.9) {
        _infoText =
            "você está com obesidade no grau 2 (${imc.toStringAsPrecision(3)})";
      } else {
        _infoText =
            "você está com obesidade no grau 3 (${imc.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: Text(
            "Calculdora de IMC",
            style: TextStyle(fontSize: 25),
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.refresh), onPressed: _resetField)
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          //SingLeChildScrollViews serve para criar um Scroll view
          padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
          // padding serve para dar espaço entre coisas
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .stretch, //stretch é para preencher a tela toda
            children: <Widget>[
              Icon(
                Icons.people_outline,
                size: 120,
                color: Colors.green,
              ),
              TextField(
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso(kg)",
                    labelStyle: TextStyle(fontSize: 25, color: Colors.green)),
                controller: weightController,
              ),
              TextField(
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    // para adicionar texto e outras coisas ao textfield
                    labelText: "Altura(cm)",
                    labelStyle: TextStyle(fontSize: 25, color: Colors.green)),
                controller: hightController,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Container(
                    height: 50.0,
                    child: RaisedButton(
                      //risedButton é um botao preenchido
                      onPressed: _calculate,
                      child: Text(
                        "Calcular",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      color: Colors.green,
                    )),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
        ));
  }
}
