import 'package:flutter/material.dart';
import 'package:mother_and_baby/lan/Languages.dart';
import 'package:mother_and_baby/models/asiriUser.dart';
import 'package:mother_and_baby/screens/kickCounter.dart';
import 'package:mother_and_baby/screens/months/fifthMonth.dart';
import 'package:mother_and_baby/screens/months/firstMonth.dart';
import 'package:mother_and_baby/screens/months/forthMonth.dart';
import 'package:mother_and_baby/screens/months/secondMonth.dart';
import 'package:mother_and_baby/screens/months/seventhMonth.dart';
import 'package:mother_and_baby/screens/months/sixthMonth.dart';
import 'package:mother_and_baby/screens/months/thirdMonth.dart';
import 'package:mother_and_baby/screens/servicesInfo.dart';
import 'package:mother_and_baby/services/user.service.dart';
import 'package:mother_and_baby/widgets/videoPreview.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  final AsiriUser asiriUser;
  final int currentMonth;
  const LandingPage({Key key, this.asiriUser, this.currentMonth})
      : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String getMonthCaption() {
    String caption = "first";
    switch (widget.currentMonth) {
      case 2:
        caption = "second";
        break;
      case 3:
        caption = "third";
        break;
      case 4:
        caption = "fourth";
        break;
      case 5:
        caption = "fifth";
        break;
      case 6:
        caption = "sixth";
        break;
      case 7:
        caption = "seventh";
        break;
      case 8:
        caption = "eighth";
        break;
      case 9:
        caption = "ninth";
        break;
    }
    return caption;
  }

  void goToMonthDescription() {
    switch (7) {
      //widget.currentMonth
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => FirstMonthScreen()));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => SecondMonth()));
        break;
      case 3:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => ThirdMonth()));
        break;
      case 4:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => FourthMonth()));
        break;
        case 5:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => FifthMonth()));
        break;
        case 6:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => SixthMonth()));
        break;
        case 7:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => SeventhMonth()));
        break;
      default:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => FirstMonthScreen()));
    }
  }

  AsiriUser userDatails;
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    if (widget.asiriUser != null) {
      Provider.of<UserService>(context, listen: false)
          .getUser(widget.asiriUser.userId)
          .then((user) {
        setState(() {
          userDatails = user;
        });
      });
    }

    return Container(
      constraints: BoxConstraints(minHeight: screenSize.height),
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/diary/bg.png"),
              fit: BoxFit.cover)),
      child: Column(
        children: [
          Container(
            // height: screenSize.height * 0.3,
            width: screenSize.width,
            padding: EdgeInsets.only(top: 20, bottom: 20, right: 15, left: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              color: Colors.purple,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                          // Navigator.of(context).pop();
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 15),
                          width: 30,
                          child: Image.asset(
                            "assets/images/drawer/burger.png",
                            height: 15,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                "Congratulations!",
                                style: new TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "You are in the ${getMonthCaption()} month of your pregnancy",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 25,
                ),
                if (userDatails != null)
                  Text(
                    "Your due date is ${DateFormat("MMMM d, yyyy").format(DateTime.fromMillisecondsSinceEpoch(userDatails.dueDate))}",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: ListTile(
              leading: Image.asset(
                "assets/images/welcome/baby.png",
                height: 50,
              ),
              title: Text(
                  "${userDatails != null ? userDatails.kickCount : "0"} kicks ❤"),
              subtitle: Text("Go to kick counter.."),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => KickCounter(
                          asiriUser: userDatails,
                        )))
              },
            ),
          ),
          Divider(),
          Container(
            child: ListTile(
              leading: Image.asset(
                "assets/images/factPage/${widget.currentMonth}month.png",
                height: 35,
              ),
              title: Text(
                  "${toBeginningOfSentenceCase(getMonthCaption())} month of pregnancy"),
              subtitle: Text(
                  "What you should know about ${getMonthCaption()} month of pregnancy.."),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              onTap: () => goToMonthDescription(),
            ),
          ),
          Divider(),
          Container(
            child: ListTile(
              leading: Image.asset(
                "assets/images/drawer/hospital.png",
                height: 35,
              ),
              title: Text("Hospital Services 🏥"),
              subtitle: Text("Emergency contact numbers"),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ServicesInfo()))
              },
            ),
          ),
          Divider(),
          VideoPreview(
            iconName: "Dental.jpg",
            text: Languages.of(context).specialistCaption1,
            url:
                "https://firebasestorage.googleapis.com/v0/b/asiri-hospital-tour.appspot.com/o/videos%2F%E0%B7%83%E0%B7%92%E0%B7%83%E0%B7%9A%E0%B6%BB%E0%B7%92%E0%B6%BA%E0%B6%B1%E0%B7%8A%20%E0%B7%83%E0%B7%90%E0%B6%AD%E0%B7%8A%E0%B6%9A%E0%B6%B8.mp4?alt=media&token=a581a8c5-80e3-4391-a4dd-2ea95ae8fefd",
          ),
        ],
      ),
    );
  }
}
