import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedColor = 0;

  List<Color> colorList = [
    Colors.indigo,
    Colors.blue,
    Colors.lightBlueAccent,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.red,
  ];

//FUNCTION

  void _changeColorIndex(index) {
    setState(() {
      selectedColor = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Change Background Color'),
      ),
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: Curves.fastLinearToSlowEaseIn,
        color: colorList[selectedColor],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42.0),
              child: Text(
                "Change Color",
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
                height: 100.0,
                child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    scrollDirection: Axis.horizontal,
                    children: List.generate(colorList.length, (index) {
                      return GestureDetector(
                          onTap: () {
                            _changeColorIndex(index);
                          },
                          child: colorBox(colorList[index], selectedColor == index));
                    })))
          ],
        ),
      ),
    );
    ;
  }
}

//CUSTOM WIDGET

Widget colorBox(Color color, bool selected) {
  return AnimatedContainer(
    duration: Duration(seconds: 1),
    curve: Curves.fastLinearToSlowEaseIn,
    height: selected ? 40 : 32,
    width: selected ? 40 : 32,
    margin: EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
      border: Border.all(color: Colors.white, width: selected ? 5 : 2),
    ),
  );
}
