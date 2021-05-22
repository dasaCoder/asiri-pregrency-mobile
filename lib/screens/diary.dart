import 'package:flutter/material.dart';
import 'package:mother_and_baby/lan/Languages.dart';
import 'package:mother_and_baby/widgets/NavDrawer.dart';

class DiaryScreen extends StatefulWidget {
  @override
  _DiaryScreenState createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      body: Builder(
        builder: (BuildContext context) => SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {Scaffold.of(context).openDrawer();},
                        child: Container(
                          margin: EdgeInsets.only(right: 15),
                          width: 30,
                          child: Image.asset(
                            "assets/images/drawer/burger.png",
                            height: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: new BoxDecoration(
                      color: Color.fromRGBO(199, 233, 251, 1),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: ListTile(
                    title: Text(
                      Languages.of(context).DiaryAddNote,
                      style: new TextStyle(
                          color: Color.fromRGBO(70, 72, 162, 1), fontSize: 16),
                    ),
                    trailing: Image.asset(
                      "assets/images/diary/note.png",
                      height: 40,
                    ),
                    onTap: () => {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Stack(
                                children: [
                                  Container(
                                    child: Text("Hi"),
                                  )
                                ],
                              ),
                            );
                          })
                    },
                  ),
                ),
                Container(
                  decoration: new BoxDecoration(
                      color: Color.fromRGBO(199, 233, 251, 1),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: ListTile(
                    title: Text(
                      Languages.of(context).DiaryMedicine,
                      style: new TextStyle(
                          color: Color.fromRGBO(70, 72, 162, 1), fontSize: 16),
                    ),
                    trailing: Image.asset(
                      "assets/images/diary/vitamins.png",
                      height: 40,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
