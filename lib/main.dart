import 'package:flutter/material.dart';
import 'package:myapp/item.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: new HomePage(),
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
                  hintText: "Eg: Call Jay"
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
  List colors = [Colors.indigo, Colors.cyan, Colors.red];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.0, right: 15.0),
      height: 200.0,
      child: new Container(
            width: 160.0,
            color: colors[i%3],
            padding: EdgeInsets.only(left:35.0,top: 60.0),
            child: new Text(s, style: TextStyle(color: Colors.white, fontSize: 25.0)),
      ),
    );
  }

  MakeTile(this.s,this.i);
}