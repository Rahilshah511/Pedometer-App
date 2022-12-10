import 'package:DoNation/model/leaderboard_item.dart';
import 'package:DoNation/shared/utils/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LeaderBoardPage extends StatefulWidget {
  @override
  _LeaderBoardPageState createState() => _LeaderBoardPageState();
}

class _LeaderBoardPageState extends State<LeaderBoardPage> {
  List<LeaderBoardItem> _leaderBoardItems = List<LeaderBoardItem>();

  @override
  Widget build(BuildContext context) {
    generateDummyData();

    return Container(
      child: ListView.builder(
          itemCount: _leaderBoardItems.length,
          itemBuilder: (BuildContext ctxt, int index) =>
              buildList(ctxt, index)),
    );
    // );
  }

  Widget buildList(BuildContext ctxt, int index) {
    int ind = index + 1;

    Widget crown;

    if (ind == 1) {
      crown = Padding(
          padding: const EdgeInsets.only(right: 0.0),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Center(
                  child: Icon(
                FontAwesomeIcons.crown,
                size: 36,
                color: Colors.yellow,
              )),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 6),
                child: Center(
                    child: Text(
                  '1',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )),
              )
            ],
          ));
    } else if (ind == 2) {
      crown = Padding(
          padding: const EdgeInsets.only(right: 0.0),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Center(
                  child: Icon(
                FontAwesomeIcons.crown,
                size: 36,
                color: Colors.grey[300],
              )),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 6),
                child: Center(
                    child: Text(
                  '2',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )),
              )
            ],
          ));
    } else if (ind == 3) {
      crown = Padding(
          padding: const EdgeInsets.only(right: 0.0),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Center(
                  child: Icon(
                FontAwesomeIcons.crown,
                size: 36,
                color: Colors.orange[300],
              )),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 6),
                child: Center(
                    child: Text(
                  '3',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )),
              )
            ],
          ));
    } else {
      crown = CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 13,
          child: Text(
            ind.toString(),
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ));
    }

    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5.0)]),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(right: 0.0),
                  child: Row(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 25),
                          child: crown,
                        ),
                      ),
                      Align(
                        child: CircleAvatar(
                          backgroundColor: Colors.red.shade800,
                          child: Text('GI'),
                          radius: 30,
                        ),
                      ),
                      Align(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 5),
                            child: Text(
                              _leaderBoardItems[index].name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _leaderBoardItems[index].totalCalory +
                      ' ' +
                      AppLocalizations.of(context).i18nKCal,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void generateDummyData() {
    _leaderBoardItems = List<LeaderBoardItem>();

    for (var i = 1; i < 21; i++) {
      LeaderBoardItem lbi = LeaderBoardItem(
        userId: 'user$i',
        name: 'User $i',
        email: 'user$i@gmail.com',
        totalCalory: (1000 + i).toString(),
      );

      _leaderBoardItems.add(lbi);
    }

    _leaderBoardItems = _leaderBoardItems.reversed.toList();
  }
}
