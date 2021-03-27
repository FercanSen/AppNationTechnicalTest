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
  ScrollController _scrollController = ScrollController();
  int scrollSpeed = 50;
  bool bottomScrollPressed = false;
  bool topScrollPressed = false;

  _scroll(bool scrollBottom) {
    double maxExtent = _scrollController.position.maxScrollExtent;
    double minExtent = _scrollController.position.minScrollExtent;

    if (scrollBottom) {
      // Scroll to the bottom of the screen
      double distanceDifference = maxExtent - _scrollController.offset;
      double durationDouble = distanceDifference / scrollSpeed;

      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        curve: Curves.linear,
        duration: Duration(seconds: durationDouble.toInt()),
      );
    } else {
      // Scroll to the top of the screen
      double distanceDifference = _scrollController.offset - minExtent;
      double durationDouble = distanceDifference / scrollSpeed;

      _scrollController.animateTo(
        _scrollController.position.minScrollExtent,
        curve: Curves.linear,
        duration: Duration(seconds: durationDouble.toInt()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppNation Flowing Text"),
        centerTitle: true,
        leading: IconButton(
            color: topScrollPressed ? Color(0xFFF5325C) : Colors.white,
            icon: Icon(Icons.arrow_upward),
            onPressed: () {
              setState(() {
                topScrollPressed = !topScrollPressed;
              });
              _scroll(false); // scrollBottom = false
            }),
        actions: [
          IconButton(
            color: bottomScrollPressed ? Color(0xFFF5325C) : Colors.white,
            icon: Icon(Icons.arrow_downward),
            onPressed: () {
              setState(() {
                bottomScrollPressed = !bottomScrollPressed;
              });
              _scroll(true); //scrollBottom = ture
            },
          )
        ],
      ),
      body: NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollEndNotification) {
            setState(() {
              bottomScrollPressed = false;
              topScrollPressed = false;
            });
          }
          return true;
        },
        child: SingleChildScrollView(
          controller: _scrollController,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
