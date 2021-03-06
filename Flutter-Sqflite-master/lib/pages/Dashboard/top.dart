import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqlite/pages/Dashboard/contactinfo/contactinfo.dart';
import 'package:flutter_sqlite/pages/Dashboard/personalinfo/personalinfo.dart';
import 'package:url_launcher/url_launcher.dart';
import 'contactinfo/contactinfo.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(child: MyApp()),
        ));
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  List cardList = [Item1(), Item2(), Item3(), Item4()];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: cardList.map((card) {
                return Builder(builder: (BuildContext context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.30,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      color: Colors.blueAccent,
                      child: card,
                    ),
                  );
                });
              }).toList(),
            ),
            //this row below is for the progress dots below the slider:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(cardList, (index, url) {
                return Container(
                  width: 20.0,
                  height: 2.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.8),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: _currentIndex == index
                        ? Colors.blueAccent
                        : Colors.grey,
                  ),
                );
              }),
            ),
            Container(
              width: 350,
              height: 75,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 5.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
                gradient: new LinearGradient(
                  colors: [Colors.red, Colors.blue],
                  begin: FractionalOffset.centerLeft,
                  end: FractionalOffset.centerRight,
                ),
              ),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp10()));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 30,
                    ),
                    Text(" "),
                    Text(
                      "Personal Information",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text("            "),
                    Text("0%",
                        style: TextStyle(color: Colors.white, fontSize: 18))
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Container(
              width: 350,
              height: 75,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 5.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
                gradient: new LinearGradient(
                  colors: [Colors.red, Colors.green],
                  begin: FractionalOffset.centerLeft,
                  end: FractionalOffset.centerRight,
                ),
              ),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Cinfo()));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.white,
                      size: 30,
                    ),
                    Text(" "),
                    Text(
                      "Contact Information",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text("              "),
                    Text("0%",
                        style: TextStyle(color: Colors.white, fontSize: 18))
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Container(
              width: 350,
              height: 75,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 5.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
                gradient: new LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                  begin: FractionalOffset.centerLeft,
                  end: FractionalOffset.centerRight,
                ),
              ),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Cinfo()));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.face,
                      color: Colors.white,
                      size: 30,
                    ),
                    Text(" "),
                    Text(
                      " Family Information",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text("                "),
                    Text("0%",
                        style: TextStyle(color: Colors.white, fontSize: 18))
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Container(
              width: 350,
              height: 75,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 5.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
                gradient: new LinearGradient(
                  colors: [Colors.orange, Colors.cyan],
                  begin: FractionalOffset.centerLeft,
                  end: FractionalOffset.centerRight,
                ),
              ),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Cinfo()));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.history_edu,
                      color: Colors.white,
                      size: 30,
                    ),
                    Text(" "),
                    Text(
                      " Citizenship Information",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text("    "),
                    Text("0%",
                        style: TextStyle(color: Colors.white, fontSize: 18))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 350,
              height: 75,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 5.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
                gradient: new LinearGradient(
                  colors: [Colors.pink, Colors.red],
                  begin: FractionalOffset.centerLeft,
                  end: FractionalOffset.centerRight,
                ),
              ),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Cinfo()));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.history_edu,
                      color: Colors.white,
                      size: 30,
                    ),
                    Text(" "),
                    Text(
                      " High School Information",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text("    "),
                    Text("0%",
                        style: TextStyle(color: Colors.white, fontSize: 18))
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class Item1 extends StatelessWidget {
  const Item1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => launch(
            "https://www.nytimes.com/2020/10/14/education/learning/college-application-pandemic.html"),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
                  0.3,
                  1
                ],
                colors: [
                  Color(0xffff4000),
                  Color(0xffffcc66),
                ]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                child: Text("Applying to colleges ? ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold)),
                alignment: Alignment(0, 0),
              ),
              Text("New York Times",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ));
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => launch(
            "https://www.newindianexpress.com/cities/bengaluru/2020/oct/21/colleges-to-open-in-first-week-of-november-2212986.html"),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.3, 1],
                colors: [Color(0xff5f2c82), Color(0xff49a09d)]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Universities to open in Novemeber",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold)),
              Text("Indian Express",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ));
  }
}

class Item3 extends StatelessWidget {
  const Item3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Building India’s Atmanirbhar Universities",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold)),
          Text("Indian Express",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600)),
        ],
      ),
      decoration: BoxDecoration(
          color: Color(0xffffcc66),
          image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstATop),
              image: NetworkImage(
                  'https://www.socialjustice.ie/sites/default/files/file/education_1.jpg'))),
    );
  }
}

class Item4 extends StatelessWidget {
  const Item4({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => launch(
            "https://indianexpress.com/article/education/du-to-have-two-more-cut-off-lists-heres-how-you-can-apply-for-admission-du-ac-in-7060243/"),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.3, 1],
                colors: [Color(0xff5f2c82), Color(0xff49a09d)]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("DU to have more cut-off lists",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold)),
              Text("Indian Express",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ));
  }
}
