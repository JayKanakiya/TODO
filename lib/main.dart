import 'package:flutter/material.dart';
// import 'package:myapp/item.dart';


void main() => runApp(MyApp());
String res="";
// List<String> items = ["Jay"];
// // items.add(503)
// items.add("vee");

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
    int _count = 0;
    // String res="";
    @override
    Widget build(BuildContext context) {
        List<Widget> _itemlist = new List.generate(_count, (int i) => new itemList());

        return Scaffold(
            body: new Container(
            child: new Column(
                children: <Widget>[
                    Text('TODO LIST'),
                    Container(
                        margin: EdgeInsets.only(bottom: 50.0, top: 50.0),
                        child: new TextField(

                        onChanged: (text){
                            res = text;
                            // items.add(res);
                        },
                        
                    ),
                    ),
                    Container(
                        height: 200.0,
                        child: new ListView(
                        padding: EdgeInsets.only(left:15.0),
                        children: _itemlist,
                        scrollDirection: Axis.horizontal,
                        ),
                    ),
                    
                    Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: new RaisedButton(
                            onPressed: _addNewItem,
                            child: new Icon(Icons.add),
                        ),
                    ),
                    RaisedButton(
                        onPressed: _removeItem,
                        child: new Icon(Icons.delete),
                    ),
                ],
            ),
            ),
        );
    }
    void _removeItem(){
        setState(() {
            _count = _count - 1;          
        });  
    }
    void _addNewItem(){
        setState(() {
            _count = _count + 1;
            // items.add(res);
            
        });
    }
}

class itemList extends StatefulWidget {
  @override
  _itemListState createState() => _itemListState();
}

class _itemListState extends State<itemList> {
  @override
  Widget build(BuildContext context) {
    return new Container(
        // margin: EdgeInsets.symmetric(vertical: 0.0),
        height: 300.0,
        padding: EdgeInsets.only(left: 40.0),
        margin: EdgeInsets.only(top:0.0,left: 20.0),
        width: 160.0,
        color: Colors.red,
        child: new Text(res, style: TextStyle(color: Colors.white, fontSize: 10.0),),
    
        );
  }
}