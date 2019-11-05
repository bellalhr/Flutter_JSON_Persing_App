import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:player_bd/models/player.dart';
import 'package:player_bd/playerDetails.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlayerApp();
  }
}

class PlayerApp extends StatefulWidget {
  @override
  _MyPlayerBdState createState() => _MyPlayerBdState();
}

class _MyPlayerBdState extends State<PlayerApp> {
  Future<List<Players>> _getPlayerList() async {
    var data = await http
        .get("http://www.json-generator.com/api/json/get/bTIoqxGqNu?indent=2");

    var jsonData = json.decode(data.body);

    List<Players> players = [];
    for (var u in jsonData) {
      Players player = Players(
          u["playerId"], u["name"], u["title"], u["about"], u["picture"]);
      players.add(player);
    }
    print(players.length);

    return players;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Player BD'),
        ),
        body: FutureBuilder(
          future: _getPlayerList(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Please wait...')
                    ],
                  )
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                          NetworkImage(snapshot.data[index].picture),
                        ),
                        title: Text(snapshot.data[index].name),
                        subtitle: Text(snapshot.data[index].title),
                        onTap: () {
                          Navigator.push(context,
                              new MaterialPageRoute(builder: (context)=>PlayerDetails(snapshot.data[index]))
                          );
                        },
                      ),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
