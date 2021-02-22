import 'package:flutter/material.dart';
import 'package:wiredash/wiredash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final _navigatorKey= GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return Wiredash(
        projectId: "altacall-calculus-kdbwut0",
        secret: "s0q2uw49ftuvnh5hqnixsvsf4r8bi3pcuey5x2urhhhnx25w",
        navigatorKey: _navigatorKey,
        child: MaterialApp(
          navigatorKey: _navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'AltaCALL Direct Solution',
        theme: ThemeData(

        primarySwatch: Colors.lightBlue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
          home: MyHomePage(title: 'AltaCall Calculus'),
    ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;
  double textsize = 18;
  double hightBox = 10;
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  double result;

  String _calculate() {
    if (controller1.text.trim().isNotEmpty &&
        controller2.text.trim().isNotEmpty &&
        controller3.text.trim().isNotEmpty) {
      final firtValue = double.parse(controller1.text);
      final secondValue = double.parse(controller2.text);
      final thirdValue = double.parse(controller3.text);
      result = firtValue - (secondValue * 150) - thirdValue;
    }
    return result.toString();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   'You have pushed the button this many times:',
            // ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
            ListTile(
              leading: Icon(
                Icons.money,
                color: Colors.black,
              ),
              title: Text('La revenue annuelle de client:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: textsize,
                  )),
              subtitle: TextField(
                enabled: true,
                controller: controller1,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Entrer içi'),
              ),
              trailing: Icon(
                Icons.info,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: hightBox,
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: Text('les nombres des enfants:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: textsize,
                  )),
              subtitle: TextField(
                enabled: true,
                controller: controller2,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Entrer içi'),
              ),
              trailing: Icon(
                Icons.info,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: hightBox,
            ),
            ListTile(
              leading: Icon(
                Icons.transfer_within_a_station,
                color: Colors.black,
              ),
              title: Text('Crédit en cours:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: textsize,
                  )),
              subtitle: TextField(
                enabled: true,
                controller: controller3,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Entrer içi'),
              ),
              trailing: Icon(
                Icons.info,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      textStyle:
                      TextStyle(fontSize: 30, fontStyle: FontStyle.italic)),
                  onPressed: () {
                    return showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text('la Reste à vivre'),
                          content: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text('le reste pour le client: '),
                              Text(
                                _calculate(),
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: Text(
                                  'ok',
                                  style: TextStyle(fontSize: 18),
                                ))
                          ],
                        ));
                  },
                  child: Text(
                    'Calculer ',
                  )),
            ),
            RaisedButton(
              onPressed: () => Wiredash.of(context).show(),
              child: Text('FeedBACK'),
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
