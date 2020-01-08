import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AlcoolOuGasolina extends StatefulWidget {
  @override
  _AlcoolOuGasolinaState createState() => _AlcoolOuGasolinaState();
}

class _AlcoolOuGasolinaState extends State<AlcoolOuGasolina> {
  var _imagesApp = AssetImage("images/logo.png");
  var _resultado = "";
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  void _calcular() {
    var calor_alcool = double.tryParse(_controllerAlcool.text);
    var calor_gasolina = double.tryParse(_controllerGasolina.text);


      if (calor_alcool == null || calor_gasolina == null) {
        setState(() {
          _resultado = "Valor invalido";
        });
      }else{
        if(calor_alcool/calor_gasolina>0.7){
          setState(() {
            _resultado = "Melhor usar gasolina";
          });
        }else{
          setState(() {
            _resultado = "Melhor usar alcool";
          });
        }
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
        ),
        body: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 3),
                  child: Image(
                    image: this._imagesApp,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 3),
                  child: Text(
                    "Saiba qual a melhos opção para o seu carro",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: ("Preço do alcool, ex 1.59")),
                  
                  onSubmitted: (String value) {
                    print("Valor $value");
                  },
                  controller: _controllerAlcool,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: ("Preço da gasolina , ex 2.59")),
                  onSubmitted: (String value) {
                    print("Valor $value");
                  },
                  controller: _controllerGasolina,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: RaisedButton(
                    onPressed: () => _calcular(),
                    color: Colors.lightBlue,
                    textColor: Colors.white,
                    child: Text(
                      "Calcule",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "$_resultado",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        ));
  }
}
