import 'package:flutter/material.dart';

import 'models/player.dart';

class PlayerDetails extends StatelessWidget {
  final Players players;

  PlayerDetails(this.players);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Player Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 100,
                width: 100,
               margin: EdgeInsets.only(top: 40),
                child: CircleAvatar(
                  backgroundImage:
                  NetworkImage(players.picture),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(players.name,style: TextStyle(fontWeight: FontWeight.bold),),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(players.title),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                child: Text(players.about,style: TextStyle(color: Colors.black54),),
              )
            ],
          )
        ],
      ),
    );
  }
}
