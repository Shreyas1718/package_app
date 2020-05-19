import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpExample extends StatefulWidget {
  @override
  _HttpExampleState createState() => _HttpExampleState();
}

class _HttpExampleState extends State<HttpExample> {
  Future<Cocktails> cocktails;

  @override
  void initState() {
    super.initState();
    cocktails = getCocktails();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<Cocktails> getCocktails() async {
    var response = await http.get(
        'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail');
    if (response.statusCode == 200) {
      return Cocktails.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Load');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Package'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.code,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HttpExampleCode()),
              );
            },
          )
        ],
      ),
      body: FutureBuilder<Cocktails>(
        future: cocktails,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.drinks.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: 44,
                                minHeight: 44,
                                maxWidth: 64,
                                maxHeight: 64,
                              ),
                              child: Image.network(
                                  snapshot.data.drinks[index].strDrinkThumb)),
                          title: Text(snapshot.data.drinks[index].strDrink),
                          subtitle: Text(snapshot.data.drinks[index].idDrink),
                        ),
                      ],
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class Cocktails {
  List<Drinks> drinks;

  Cocktails({this.drinks});

  Cocktails.fromJson(Map<String, dynamic> json) {
    if (json['drinks'] != null) {
      drinks = new List<Drinks>();
      json['drinks'].forEach((v) {
        drinks.add(new Drinks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.drinks != null) {
      data['drinks'] = this.drinks.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Drinks {
  String strDrink;
  String strDrinkThumb;
  String idDrink;

  Drinks({this.strDrink, this.strDrinkThumb, this.idDrink});

  Drinks.fromJson(Map<String, dynamic> json) {
    strDrink = json['strDrink'];
    strDrinkThumb = json['strDrinkThumb'];
    idDrink = json['idDrink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strDrink'] = this.strDrink;
    data['strDrinkThumb'] = this.strDrinkThumb;
    data['idDrink'] = this.idDrink;
    return data;
  }
}

class HttpExampleCode extends StatefulWidget {
  @override
  _HttpExampleCodeState createState() => _HttpExampleCodeState();
}

class _HttpExampleCodeState extends State<HttpExampleCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Code'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Text('''
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpExample extends StatefulWidget {
  @override
  _HttpExampleState createState() => _HttpExampleState();
}

class _HttpExampleState extends State<HttpExample> {
  Future<Cocktails> cocktails;

  @override
  void initState() {
    super.initState();
    cocktails = getCocktails();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<Cocktails> getCocktails() async {
    var response = await http.get(
          'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail');
    if (response.statusCode == 200) {
        return Cocktails.fromJson(json.decode(response.body));
    } else {
        throw Exception('Failed to Load');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Http Package'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.code,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HttpExampleCode()),
                );
              },
            )
          ],
        ),
        body: FutureBuilder<Cocktails>(
          future: cocktails,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.drinks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minWidth: 44,
                                  minHeight: 44,
                                  maxWidth: 64,
                                  maxHeight: 64,
                                ),
                                child: Image.network(
                                    snapshot.data.drinks[index].strDrinkThumb)),
                            title: Text(snapshot.data.drinks[index].strDrink),
                            subtitle: Text(snapshot.data.drinks[index].idDrink),
                          ),
                        ],
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text(snapshot.error);
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
    );
  }
}

class Cocktails {
  List<Drinks> drinks;

  Cocktails({this.drinks});

  Cocktails.fromJson(Map<String, dynamic> json) {
    if (json['drinks'] != null) {
        drinks = new List<Drinks>();
        json['drinks'].forEach((v) {
          drinks.add(new Drinks.fromJson(v));
        });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.drinks != null) {
        data['drinks'] = this.drinks.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Drinks {
  String strDrink;
  String strDrinkThumb;
  String idDrink;

  Drinks({this.strDrink, this.strDrinkThumb, this.idDrink});

  Drinks.fromJson(Map<String, dynamic> json) {
    strDrink = json['strDrink'];
    strDrinkThumb = json['strDrinkThumb'];
    idDrink = json['idDrink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strDrink'] = this.strDrink;
    data['strDrinkThumb'] = this.strDrinkThumb;
    data['idDrink'] = this.idDrink;
    return data;
  }
}
          '''),
        ),
      ),
    );
  }
}
