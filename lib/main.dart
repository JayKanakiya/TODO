import 'package:flutter/material.dart';
import 'package:myapp/item.dart';

final colorIndigo = const Color(0xff4B0091);
final colorCyan = const Color(0xff97C7CE);
final colorMagenta = const Color(0xff5C1135);
List<String> itemList = [];
List<String> itemDesc = [];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTask()));
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.pink,
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Align(
              alignment: Alignment.topLeft,
              child: new Container(
                margin: EdgeInsets.only(top: 40.0, left: 20.0),
                child: Text("Notes",
                    style: TextStyle(fontSize: 50), textAlign: TextAlign.left),
              ),
            ),
            new Flexible(
              child: new ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: itemList.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return new Column(
                      children: <Widget>[
                        new MakeTile(itemList[index], index),
                      ],
                    );
                  }),
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
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
      height: 110.0,
      child: new Container(
        decoration: new BoxDecoration(
          color: colors[i % 3],
          borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
        ),
        width: MediaQuery.of(context).size.width - 30,
        padding: EdgeInsets.only(top: 40.0),
        child: new Column(
          children: <Widget>[
            // Text("Task", style: TextStyle(color: Colors.white, fontSize: 15.0, fontFamily: 'Raleway'), textAlign: TextAlign.left),
            new Align(
              alignment: Alignment.center,
              // margin: EdgeInsets.only(bottom:20),
              child: Text(s,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontFamily: 'Raleway')),
            ),
          ],
        ),
      ),
    );
  }

  MakeTile(this.s, this.i);
}

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController tec = new TextEditingController();
  TextEditingController dec = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        margin: EdgeInsets.only(top: 50.0),
        child: new Column(
          children: <Widget>[
            new TextField(
              controller: tec,
              decoration: new InputDecoration.collapsed(hintText: "Title"),
              onSubmitted: (String s) {},
            ),
            new Container(
              margin: EdgeInsets.only(top: 20.0),
              child: new TextField(
                maxLines: null,
                controller: dec,
                decoration:
                    new InputDecoration.collapsed(hintText: "Description"),
                onSubmitted: (String s) {},
              ),
            ),
            new FlatButton(
              onPressed: () {
                setState(() {
                  // showBox = false;
                  itemList.add(tec.text);
                  tec.clear();
                  itemDesc.add(dec.text);
                  dec.clear();
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: new Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
