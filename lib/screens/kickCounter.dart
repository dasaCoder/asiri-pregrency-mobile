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
  int kickCount  = 0;
  @override
  void initState() {
    Provider.of<UserService>(context, listen: false).getUser(widget.asiriUser.userId).then((userData) {
      setState(() {
        updatableAsiriUser = userData;
        kickCount = updatableAsiriUser.kickCount != null ? updatableAsiriUser.kickCount : 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(minHeight: screenSize.height, minWidth: screenSize.width),
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/images/diary/bg.png"),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Container(
            height: screenSize.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "${kickCount.toString()}",
                    style: new TextStyle(
                        fontSize: 60, color: Colors.purple),
                  ),
                ),
                Text(
                  "Kicks 😍😍",
                  style: new TextStyle(
                      fontSize: 18, color: Colors.purple),
                ),
                SizedBox(height: 10,),
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
                      Provider.of<UserService>(context, listen: false).incrementKickCount(widget.asiriUser.userId);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                            width: 50,
                            child: Icon(Icons.add, size: 30,)),
                      ],
                    ),
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
