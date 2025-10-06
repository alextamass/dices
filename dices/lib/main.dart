import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roller',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DiceRoller(),
    );
  }
}

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  _DiceRollerState createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  int _diceNumber = 1; // Počiatočné číslo kocky (1)

  // Funkcia na generovanie náhodného čísla
  void _rollDice() {
    setState(() {
      _diceNumber = Random().nextInt(6) + 1; // Generuje číslo medzi 1 a 6
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dice Roller')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Zobrazenie obrázku kocky na základe čísla
            Image.asset('assets/images/dice-$_diceNumber.png'),
            SizedBox(height: 20),
            // Tlačidlo na prehodenie kocky
            ElevatedButton(
              onPressed: _rollDice,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Farba tlačidla
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: Text('Roll the Dice'),
            ),
          ],
        ),
      ),
    );
  }
}
