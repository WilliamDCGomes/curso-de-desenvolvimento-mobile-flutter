import 'package:flutter/material.dart';
class SliderTest extends StatefulWidget {
  const SliderTest({Key key}) : super(key: key);

  @override
  _SliderTestState createState() => _SliderTestState();
}

class _SliderTestState extends State<SliderTest> {
  double valor = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Slider(
                value: valor,
                min: 0,
                max: 10,
                label: valor.toString(),
                divisions: 10,
                activeColor: Colors.red,
                inactiveColor: Colors.purple,
                onChanged: (double novoValor){
                  setState(() {
                    valor = novoValor;
                  });
                }
            )
          ],
        ),
      ),
    );
  }
}
