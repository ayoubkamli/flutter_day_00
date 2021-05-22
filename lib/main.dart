import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo flutter app",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TODOScreen(),
    );
  }
}

class TODOScreen extends StatefulWidget {
  TODOScreen({Key key}) : super(key: key);
  @override
  _TODOScreenState createState() => _TODOScreenState();
}

class _TODOScreenState extends State<TODOScreen> {
  DateTime _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My to do app"),
        actions: [IconButton(icon: Icon(Icons.exit_to_app), onPressed: () {})],
      ),
      body: Column(
        children: <Widget>[
          TextButton(
            onPressed: () {
              _showDatePicker();
            },
            child: Text(
              DateFormat("dd/MM/yyyy").format(_date).toString(),
            ),
          ),
          ListView.builder(
            padding: const EdgeInsets.all(10.0),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Dismissible(
                  background: Container(
                    alignment: Alignment.centerLeft,
                    color: Colors.red,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.delete)),
                  ),
                  direction: DismissDirection.startToEnd,
                  key: ValueKey(index),
                  child: (Card(
                    margin: const EdgeInsets.all(0.0),
                    child: ListTile(
                      leading: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.check_circle_outline_outlined),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                      title: Text("Title"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[Text("Desc"), Text("Desc")],
                      ),
                    ),
                  )),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  _showDatePicker() async {
    final today = DateTime.now();

    final selecteDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2021, 5, 1),
      lastDate: DateTime(today.year + 1, today.month, today.day),
    );

    if (selecteDate != null && selecteDate != _date) {
      setState(() {
        _date = selecteDate;
      });
    }
  }
}
