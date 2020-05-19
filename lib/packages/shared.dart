import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesExample extends StatefulWidget {
  @override
  _SharedPreferencesExampleState createState() =>
      _SharedPreferencesExampleState();
}

class _SharedPreferencesExampleState extends State<SharedPreferencesExample> {
  String myValue = "";
  @override
  void initState() {
    super.initState();
  }

  Future addData() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setString("MyString", "Hello World");
  }

  Future readData() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    if (_preferences.getString("MyString") != null) {
      setState(() {
        myValue = _preferences.getString("MyString");
      });
    }
    return Text('No Data');
  }

  Future deleteData() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.remove("MyString");
    setState(() {
      setState(() {
        myValue = "";
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preference Example'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.code,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SharedPreferencesCode()),
              );
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    addData();
                    print('added');
                  },
                  child: Text('Save Data'),
                ),
                RaisedButton(
                  onPressed: () {
                    readData();

                    print('read');
                  },
                  child: Text('Read Data'),
                ),
                RaisedButton(
                  onPressed: () {
                    deleteData();

                    print('deleted');
                  },
                  child: Text('Delete Data'),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text(myValue)],
            )
          ],
        ),
      ),
    );
  }
}

class SharedPreferencesCode extends StatefulWidget {
  @override
  _SharedPreferencesCodeState createState() => _SharedPreferencesCodeState();
}

class _SharedPreferencesCodeState extends State<SharedPreferencesCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Code'),
        ),
        body: SingleChildScrollView(
            child: Container(padding: EdgeInsets.all(10), child: Text('''
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesExample extends StatefulWidget {
  @override
  _SharedPreferencesExampleState createState() =>
      _SharedPreferencesExampleState();
}

class _SharedPreferencesExampleState extends State<SharedPreferencesExample> {
  String myValue = "";
  @override
  void initState() {
    super.initState();
  }

  Future addData() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setString("MyString", "Hello World");
  }

  Future readData() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    if (_preferences.getString("MyString") != null) {
      setState(() {
        myValue = _preferences.getString("MyString");
      });
    }
    return Text('No Data');
  }

  Future deleteData() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.remove("MyString");
    setState(() {
      setState(() {
        myValue = "";
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preference Example'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.code,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SharedPreferencesCode()),
              );
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    addData();
                    print('added');
                  },
                  child: Text('Save Data'),
                ),
                RaisedButton(
                  onPressed: () {
                    readData();

                    print('read');
                  },
                  child: Text('Read Data'),
                ),
                RaisedButton(
                  onPressed: () {
                    deleteData();

                    print('deleted');
                  },
                  child: Text('Delete Data'),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text(myValue)],
            )
          ],
        ),
      ),
    );
  }
}
    '''))));
  }
}
