import 'package:flutter/material.dart';
import 'package:myapp/item.dart';

  final colorIndigo = const Color(0xff4B0091);
  final colorCyan = const Color(0xff97C7CE);
  final colorMagenta = const Color(0xff5C1135);

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: new HomePage(),
      theme: ThemeData(fontFamily: 'Raleway'),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  bool showBox = false;
  TextEditingController tec = new TextEditingController();
  List<String> itemList = [];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Notes"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: (){
              setState(() {
                showBox = true;                
              });
              
            },
          ),
        ],
      ),

      body: new Container(
        child: new Column(
          children: <Widget>[
            showBox == true?
            new AlertDialog(
              title: new Text("Add Note"),
              content: new TextField(
                controller: tec,
                decoration: new InputDecoration.collapsed(
                  hintText: "Call Jay"
                ),
                onSubmitted: (String s){

                },
              ),
              actions: <Widget>[
                new FlatButton(
                  onPressed: (){
                    setState(() {
                      showBox = false;  
                      itemList.add(tec.text);
                      tec.clear();              
                    });
                  },
                  child: new Text("Add"),
                ),
              ],
            ) : new Text(""),

            new Flexible(
              child: new ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: itemList.length,
                itemBuilder: (BuildContext ctxt, int index){
                  return new Column(
                    children: <Widget>[
                      new MakeTile(itemList[index],index),
                    ],
                  );
                }
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class MakeTile extends StatelessWidget {
  String s;
  int i;

  List colors = [colorIndigo, colorCyan, colorMagenta];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 5.0, top: 150.0),
      height: 240.0,
      child: new Container(
            decoration: new BoxDecoration(
              color: colors[i%3],
              borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
            ),
            width: 170.0,
            padding: EdgeInsets.only(top: 60.0),
            child: new Text(s, style: TextStyle(color: Colors.white, fontSize: 20.0, fontFamily: 'Raleway'), textAlign: TextAlign.center),
      ),
    );
  }

  MakeTile(this.s,this.i);
}