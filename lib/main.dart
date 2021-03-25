import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flowing Text",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF343A40),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppNation Flowing Text"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_upward),
          onPressed: null,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_downward),
            onPressed: null,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: 100,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      "This is a sample text to be scrolled",
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
