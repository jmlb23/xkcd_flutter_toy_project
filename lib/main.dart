import 'package:flutter/material.dart';
import 'package:xkcd_toy_app/model/types/Comic.dart';
import 'package:xkcd_toy_app/bloc/BlocIndex.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XKCD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormPage(),
    );
  }
}

Widget injectPadding(Widget a) => Padding(
    child: a, padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0));

class FormPage extends StatefulWidget {
  FormPage({Key key}) : super(key: key);

  @override
  State<FormPage> createState() => FormPageState();
}

class FormPageState extends State<FormPage> {
  var _stateTextInput = "0";

  void setSateTextInput(String x) => _stateTextInput = x;

  num stringToNumber(String x) => _stateTextInput.isEmpty ? 0 : num.parse(x);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text("Home"))),
        body: Form(
            child: Column(children: <Widget>[
          injectPadding(TextField(
              key: Key("number"),
              decoration: InputDecoration(hintText: "Number of Comic"),
              onChanged: (str) {
                setState(() {
                  setSateTextInput(str);
                });
              })),
          FlatButton(
              child: Text("View"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (c) => Scaffold(
                            appBar: AppBar(
                                title: Center(child: Text("Joke of the day"))),
                            body: ListView(children: [
                              StreamBuilder(
                                stream:
                                    getElement(stringToNumber(_stateTextInput)),
                                builder: (c, AsyncSnapshot<Comic> a) {
                                  return a.hasData
                                      ? Column(children: <Widget>[
                                          Text(a.data.safeTitle,style: TextStyle(fontSize: 20.0,fontStyle: FontStyle.italic),),
                                          Image.network(a.data.urlImg,
                                              scale: 0.5,
                                              repeat: ImageRepeat.noRepeat)
                                        ])
                                      : Center(
                                          child: RefreshProgressIndicator());
                                },
                              )
                            ]))));
              },
              color: Colors.grey)
        ])));
  }
}
