import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State {
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(title:  Text('Форма ввода')),
        body: Container(
            padding: EdgeInsets.all(10.0),
            child:  Form(
                key: _formKey,
                child:  Column(
                  children: <Widget>[
                     Text(
                      'Имя пользователя:',
                      style: TextStyle(fontSize: 20.0),
                    ),
                     TextFormField(validator: (value) {
                      if (value.isEmpty) return 'Пожалуйста введите свое имя';
                    }),
                     SizedBox(height: 20.0),
                     RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate())
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Форма успешно заполнена'),
                            backgroundColor: Colors.green,
                          ));
                      },
                      child: Text('Проверить'),
                      color: Colors.blue,
                      textColor: Colors.white,
                    ),
                  ],
                ))));
  }
}

