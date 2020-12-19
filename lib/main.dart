import 'package:flutter/material.dart';
import './widgets/CalcButton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalcApp());
}




class CalcApp extends StatefulWidget {
  @override
  CalcAppState createState() => CalcAppState();
}




class CalcAppState extends State<CalcApp> {


  String _history = '';                                 // U S E R    I N P U T
  String _expression = '';


  void numClick(String text){
    setState(() {
      _expression += text;
    });
  }



  void allClear(String text){
    setState(() {
      _history = '';
      _expression = '';
    });
  }



    void clear(String text){
    setState(() {
      _expression = '';
    });
  }



  void evaluate(String text){

    Parser p = Parser();
    Expression exp = p.parse(_expression);                        // Don't know all this SHITTTTTT
    ContextModel cm = ContextModel();
    double evel = exp.evaluate(EvaluationType.REAL, cm);   

    setState(() {
      _history = _expression;
      _expression = evel.toString();
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Scaffold(
        backgroundColor: Color(0xff283637),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [



            Container(
              padding: EdgeInsets.only(right:12),
              child: Text(
                _history,                                    // User input
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(fontSize: 24),       // This container for result UI  P U R P O S E
                  color: Color(0xFF545F61),
                ),
              ),
              alignment: Alignment(1, 1),
            ),




            Container(
              padding: EdgeInsets.all(12),
              child: Text(
                _expression,                                // user expression
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(fontSize: 48),      // This container for user input UI  P U R P O S E
                  color: Colors.white,
                ),
              ),
              alignment: Alignment(1, 1),
            ),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: 'AC',
                  fillColor: 0xff6C807F,
                  callback: allClear,
                ),
                CalcButton(
                  text: 'C',
                  fillColor: 0xff6C807F,
                  callback: clear,            // Pressing this button will show number on screnn
                ),
                CalcButton(
                  text: '%',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  callback: numClick,
                ),
                CalcButton(
                  text: '/',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  callback: numClick,
                ),
              ],
            ),



            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '7',
                  callback: numClick,
                  // fillColor: 0xff6C807F,
                ),
                CalcButton(
                  text: '8',
                  callback: numClick,
                ),
                CalcButton(
                  text: '9',
                  callback: numClick,
                ),
                CalcButton(
                  text: '*',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  callback: numClick,
                ),
              ],
            ),



            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '4',
                  callback: numClick,
                  // fillColor: 0xff6C807F,
                ),
                CalcButton(
                  text: '5',
                  callback: numClick,
                  // fillColor: 0xff6C807F,
                ),
                CalcButton(
                  text: '6',
                  callback: numClick,
                  // fillColor: 0xFFFFFFFF,
                  // textColor: 0xFF65BDAC,
                ),
                CalcButton(
                  text: '-',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  callback: numClick,
                ),
              ],
            ),




            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '1',
                  callback: numClick,
                  // fillColor: 0xff6C807F,
                ),
                CalcButton(
                  text: '2',
                  callback: numClick,
                  // fillColor: 0xff6C807F,
                ),
                CalcButton(
                  text: '3',
                  callback: numClick,
                  // fillColor: 0xFFFFFFFF,
                  // textColor: 0xFF65BDAC,
                ),
                CalcButton(
                  text: '+',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '.',
                  callback: numClick,
                  // fillColor: 0xff6C807F,
                ),
                CalcButton(
                  text: '0',
                  callback: numClick,
                  // fillColor: 0xff6C807F,
                ),
                CalcButton(
                  text: '00',
                  callback: numClick,
                  // fillColor: 0xFFFFFFFF,
                  // textColor: 0xFF65BDAC,
                ),
                CalcButton(
                  text: '=',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  callback: evaluate,
                ),
              ],
            ),
          ], //<widget>
        ),
      ), 
    
 theme:new ThemeData(
        primarySwatch: Colors.green,
        brightness:Brightness.dark,
        accentColor: Colors.red
      ),


    );
  }
}