import 'package:flutter/material.dart';
//void main() => runApp(MyApp()); /*1*/
    
  class MyApp extends StatelessWidget {/*2*/
    @override
    Widget build(BuildContext context) { /*3*/
        return MaterialApp(  /*4*/
          home: Scaffold( /*5*/
            appBar:AppBar(
              title: Text('就書'),
            ),
            drawer:Drawer(
              child:ListView(
                children:<Widget>[
                  DrawerHeader(
                    child: Text('メモ一覧'),
                    decoration:BoxDecoration(
                      color:Colors.blue,
                    ),
                  ),
                  ListTile(
                    title:Text('Item1'),
                    onTap:(){
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title:Text('Item2'),
                    onTap:(){
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }