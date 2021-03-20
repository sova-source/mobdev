import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:labworks_mobdev/lab1/lab1.dart';
import 'package:labworks_mobdev/lab2/lab2.dart';
import 'package:labworks_mobdev/lab3/main_persistent_tabbar.dart';
import 'package:labworks_mobdev/lab4/crud_example.dart';
import 'package:labworks_mobdev/lab5/main_communication_widgets.dart';
import 'package:labworks_mobdev/lab6/form.dart';
import 'package:labworks_mobdev/lab7/main_fetch_data.dart';
import 'package:url_launcher/url_launcher.dart';



void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primarySwatch: Colors.blue,
  ),
  home: MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  onButtonTap(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => page));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Мое первое приложение"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            MyMenuButton(
              title: "Hello World! в консоль",
              actionTap: () {
                display();

              },
            ),
            MyMenuButton(
              title: "Hello World! на экран",
              actionTap: () {
                onButtonTap(
                  Page1()
                );
              },
            ),
            MyMenuButton(
              title: "Работа с окнами",
              actionTap: () {
                onButtonTap(
                  MainPersistentTabBar(),
                );
              },
            ),
            MyMenuButton(
              title: "Работа с БД sqlite",
              actionTap: () {
                onButtonTap(
                MyDbApp(),
                );
              },
            ),
            MyMenuButton(
              title: "Работа с окнами и кнопками",
              actionTap: () {
                onButtonTap(
                  MainCommunicationWidgets(),

                );
              },
            ),
            MyMenuButton(
              title: "Поле ввода и валидация",
              actionTap: () {
                onButtonTap(
                  MyForm(),

                );
              },
            ),
            MyMenuButton(
              title: "Работа с json данными",
              actionTap: () {
                onButtonTap(
                  MainFetchData(),
                );
              },
            ),
            MyMenuButton(
              title: "Github",
              actionTap: () {
                launch("https://github.com/sova-source/flutter_example");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyMenuButton extends StatelessWidget {
  final String title;
  final VoidCallback actionTap;

  MyMenuButton({this.title, this.actionTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: MaterialButton(
        height: 50.0,
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        child: new Text(title),
        onPressed: actionTap,
      ),
    );
  }
}