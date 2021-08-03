import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mother_and_baby/models/asiriUser.dart';
import 'package:mother_and_baby/services/user.service.dart';
import 'package:provider/provider.dart';

class KickCounter extends StatefulWidget {
  final AsiriUser asiriUser;

  const KickCounter({Key key, this.asiriUser}) : super(key: key);
  @override
  _KickCounterState createState() => _KickCounterState();
}

class _KickCounterState extends State<KickCounter> {
  AsiriUser updatableAsiriUser;
  int kickCount = 0;
  @override
  void initState() {
    if(widget.asiriUser == null || widget.asiriUser.userId == "" ) {
      print("widget user is null");
      String uuid = Provider.of<User>(context).uid;
      Provider.of<UserService>(context).getUser(uuid).then((value) {
        Provider.of<UserService>(context, listen: false)
            .getUser(widget.asiriUser.userId)
            .then((userData) {
          setState(() {
            updatableAsiriUser = userData;
            kickCount = updatableAsiriUser.kickCount != null
                ? updatableAsiriUser.kickCount
                : 0;
          });
        });
      });
    } else {
      Provider.of<UserService>(context, listen: false)
          .getUser(widget.asiriUser.userId)
          .then((userData) {
        setState(() {
          updatableAsiriUser = userData;
          kickCount = updatableAsiriUser.kickCount != null
              ? updatableAsiriUser.kickCount
              : 0;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(
            minHeight: screenSize.height, minWidth: screenSize.width),
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/images/diary/bg.png"),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          // Scaffold.of(context).openDrawer();
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 15),
                          width: 30,
                          child: Icon(
                            Icons.arrow_back_rounded,
                            size: 25,
                            color: Color.fromRGBO(161, 129, 239, 1),
                          ),
                        ),
                      ),
                      Text(
                        "Kick Counter",
                        style: new TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(161, 129, 239, 1)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: screenSize.height*0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          "${kickCount.toString()}",
                          style: new TextStyle(fontSize: 60, color: Colors.purple),
                        ),
                      ),
                      Text(
                        "Kicks 😍😍",
                        style: new TextStyle(fontSize: 18, color: Colors.purple),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 100, right: 100),
                        // decoration: BoxDecoration(color: Colors.red),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(60, 180, 242, 1),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              kickCount++;
                            });
                            Provider.of<UserService>(context, listen: false)
                                .incrementKickCount(widget.asiriUser.userId);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  padding: EdgeInsets.only(top: 5, bottom: 5),
                                  width: 50,
                                  child: Icon(
                                    Icons.add,
                                    size: 30,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
