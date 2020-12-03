import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // to open drawer in programmatically way
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          elevation: 9,
        ),
        key: _scaffoldKey,
        drawer: Drawer(
          elevation: 10,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 70, bottom: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.green,
                      Colors.red,
                      Colors.blue
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft
                  )
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage("https://ichef.bbci.co.uk/news/976/cpsprodpb/BAF5/production/_111516874_gettyimages-451627799-1.jpg"),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Khaniki",
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(
                            "khaniki@gmail.com",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Icon(Icons.account_circle_outlined),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Home",
                          style: TextStyle(fontSize: 40),
                        ),
                      ],
                    );
                  },
                  itemCount: 5,
                ),
              ),
              CupertinoButton(
                  child: Text(
                    "Logout",
                    style: TextStyle(color: Colors.red, fontSize: 30),
                  ),
                  onPressed: () {}),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
        endDrawer: Drawer(),
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoButton(
              child: Text("Open Left Drawer"),
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
            ),
            CupertinoButton(
              child: Text("Open Right Drawer"),
              onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
            ),
          ],
        )),
      ),
    );
  }
}
