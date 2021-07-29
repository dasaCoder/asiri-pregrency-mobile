import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mother_and_baby/lan/Languages.dart';
import 'package:mother_and_baby/models/asiriUser.dart';
import 'package:mother_and_baby/models/communityPost.dart';
import 'package:mother_and_baby/screens/kickCounter.dart';
import 'package:mother_and_baby/screens/months/eighthMonth.dart';
import 'package:mother_and_baby/screens/months/fifthMonth.dart';
import 'package:mother_and_baby/screens/months/firstMonth.dart';
import 'package:mother_and_baby/screens/months/forthMonth.dart';
import 'package:mother_and_baby/screens/months/ninthMonth.dart';
import 'package:mother_and_baby/screens/months/secondMonth.dart';
import 'package:mother_and_baby/screens/months/seventhMonth.dart';
import 'package:mother_and_baby/screens/months/sixthMonth.dart';
import 'package:mother_and_baby/screens/months/thirdMonth.dart';
import 'package:mother_and_baby/screens/servicesInfo.dart';
import 'package:mother_and_baby/services/user.service.dart';
import 'package:mother_and_baby/widgets/imageCarousel.dart';
import 'package:mother_and_baby/widgets/months/content/eighthMonth.dart';
import 'package:mother_and_baby/widgets/months/content/fifth.dart';
import 'package:mother_and_baby/widgets/months/content/firstMonth.dart';
import 'package:mother_and_baby/widgets/months/content/fourthMonthContent.dart';
import 'package:mother_and_baby/widgets/months/content/ninthMonth.dart';
import 'package:mother_and_baby/widgets/months/content/secondMonth.dart';
import 'package:mother_and_baby/widgets/months/content/seventhMonth.dart';
import 'package:mother_and_baby/widgets/months/content/sixthMonth.dart';
import 'package:mother_and_baby/widgets/months/content/thirdMonth.dart';
import 'package:mother_and_baby/widgets/months/monthCongrats.dart';
import 'package:mother_and_baby/widgets/months/monthSlider.dart';
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
    switch (widget.currentMonth) {
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
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => FourthMonth()));
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
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => SeventhMonth()));
        break;
      case 8:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => EighthMonth()));
        break;
      case 9:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => NinthMonth()));
        break;
      default:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => FirstMonthScreen()));
    }
  }

  AsiriUser userDatails;
  int currentMonth = 1;
  Widget monthlyContent;
  String caption;

  @override
  void initState() {
    currentMonth =  widget.currentMonth;
    getMonthDetails();
  }

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

    getMonthDetails();

    return loadMonthDetails(screenSize, context, userDatails, widget.currentMonth);
  }

  void nextMonth() {
    print("next" + currentMonth.toString());
    if((currentMonth+1) < 10) {
      setState(() {
        currentMonth = currentMonth + 1;
      });
    }
    getMonthDetails();
  }

  void prevMonth() {
    print("prev" + currentMonth.toString());
    if((currentMonth-1) > 0) {
      setState(() {
        currentMonth = currentMonth - 1;
      });
    }
    getMonthDetails();
  }

  void getMonthDetails() {
    switch(currentMonth) {
      case 1: {
        setState(() {
          monthlyContent = FirstMonthContent();
          caption = "First";
        });
        break;
      }
      case 2: {
        setState(() {
          monthlyContent = SecondMonthContent();
          caption = "Second";
        });
        break;
      }
      case 3: {
        setState(() {
          monthlyContent = ThirdMonthContent();
          caption = "Third";
        });
        break;
      }
      case 4: {
        setState(() {
          monthlyContent = FourthMonthContent();
          caption = "Fourth";
        });
        break;
      }
      case 5: {
        setState(() {
          monthlyContent = FifthMonthContent();
          caption = "Fifth";
        });
        break;
      }
      case 6: {
        setState(() {
          monthlyContent = SixthMonthContent();
          caption = "Sixth";
        });
        break;
      }
      case 7: {
        setState(() {
          monthlyContent = SeventhMonthContent();
          caption = "Seventh";
        });
        break;
      }
      case 8: {
        setState(() {
          monthlyContent = EighthMonthContent();
          caption = "Eighth";
        });
        break;
      }
      case 9: {
        setState(() {
          monthlyContent = NinthMonthContent();
          caption = "Ninth";
        });
        break;
      }
      default: {
        setState(() {
          monthlyContent = FourthMonthContent();
          caption = "Fourth";
        });
      }
    }
  }

  Column loadMonthDetails(Size screenSize, BuildContext context, AsiriUser userDetails, int currentMonth) {
    return Column(
      children: [
        SizedBox(height: 10,),
        MonthCongratsWidget(screenSize: screenSize, userDatails: userDetails, currentMonth: currentMonth,),
        SizedBox(height: 20,),
        Center(
          child: Text(
            "$caption Month",
            style: TextStyle(
                fontSize: 24,
                color: Color.fromRGBO(255, 61, 227, 1)),
          ),
        ),
        SizedBox(height: 10,),
        MonthSliderWidget(selectedMonth: currentMonth, toggleNext: nextMonth, togglePrev: prevMonth,),
        Container(child: monthlyContent,),
      ],
    );
  }

  Container homePageContent(Size screenSize, BuildContext context) {
    return Container(
    constraints: BoxConstraints(minHeight: screenSize.height),
    decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage("assets/images/diary/bg.png"),
            fit: BoxFit.cover)),
    child: Column(
      children: [
        MonthCongratsWidget(screenSize: screenSize, userDatails: userDatails, currentMonth: widget.currentMonth,),
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

        Container(
          child: StreamBuilder(
              stream: Provider.of<UserService>(context, listen: false)
                  .getCommunityPosts(5),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Container(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Column(
                    children: [
                      ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, index) {
                            CommunityPost post = CommunityPost.fromJson(
                                snapshot.data.docs[index].data());
                            return Container(
                              margin: EdgeInsets.only(
                                  top: 5, left: 25, right: 25, bottom: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      post.userData.imageUrl != ""
                                          ? CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              post.userData.imageUrl))
                                          : CircleAvatar(
                                        child: Icon(Icons
                                            .account_circle_outlined),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 10.0,
                                            ),
                                            child: Text(
                                              toBeginningOfSentenceCase(
                                                  widget.asiriUser.name),
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 10.0,
                                            ),
                                            child: Text(
                                              DateFormat("MMMM d, yyyy")
                                                  .format(DateTime
                                                  .fromMillisecondsSinceEpoch(
                                                  post.createdAt)),
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Text(
                                      post.text,
                                      style: TextStyle(
                                          fontSize: post.imageList.length > 0
                                              ? 16
                                              : 19),
                                    ),
                                  ),
                                  if (post.imageList.length > 0)
                                    ImageCarousel(
                                      imageList: post.imageList,
                                    ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      post.likedUserIdList == null ||
                                          !post.likedUserIdList.contains(
                                              widget.asiriUser.userId)
                                          ? IconButton(
                                        icon: Icon(
                                          Icons
                                              .favorite_border_outlined,
                                        ),
                                        onPressed: () => {
                                          Provider.of<UserService>(
                                              context,
                                              listen: false)
                                              .likePost(
                                              snapshot.data
                                                  .docs[index].id,
                                              widget
                                                  .asiriUser.userId)
                                        },
                                      )
                                          : IconButton(
                                        icon: Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                        onPressed: () => {
                                          Provider.of<UserService>(
                                              context,
                                              listen: false)
                                              .unlikePost(
                                              snapshot.data
                                                  .docs[index].id,
                                              widget
                                                  .asiriUser.userId)
                                        },
                                      ),
                                      Text(
                                          "${post.likedUserIdList != null ? post.likedUserIdList.length.toString() : 0} likes")
                                    ],
                                  ),
                                  Divider(
                                    thickness: 1,
                                  ),
                                ],
                              ),
                            );
                          }),


                    ],
                  );
                }
              }),
        ),

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
