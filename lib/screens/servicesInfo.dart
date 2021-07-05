import 'package:flutter/material.dart';
import 'package:mother_and_baby/widgets/NavDrawer.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicesInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: NavDrawer(),
      body: Builder(
        builder: (context) => SafeArea(
          child: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(minHeight: screenSize.height),
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage("assets/images/diary/bg.png"),
                      fit: BoxFit.cover)),
              child: Container(
                margin: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
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
                          Spacer(),
                          Image.asset(
                            "assets/images/menu/icon_item6.png",
                            width: screenSize.width * 0.5,
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ContactInfoWidget(
                      screenSize: screenSize,
                      title: "Asiri Medical Hospital",
                      telephone: "+94 (76) 390 9099",
                      url:
                          "https://www.asirihealth.com/asiri-group/our-locations/asiri-medical-hospital",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ContactInfoWidget(
                      screenSize: screenSize,
                      title: "Asiri Central Hospital",
                      telephone: "+94 (76) 424 0824",
                      url:
                          "https://www.asirihealth.com/asiri-group/our-locations/asiri-central-hospital",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ContactInfoWidget(
                      screenSize: screenSize,
                      title: "Asiri Hospital - Kandy",
                      telephone: "0762 223 038",
                      url:
                          "https://www.asirihealth.com/asiri-group/our-locations/asiri-hospital-kandy",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ContactInfoWidget(
                      screenSize: screenSize,
                      title: "Asiri Hospital - Galle",
                      telephone: "0773029955",
                      url:
                          "https://www.asirihealth.com/asiri-group/our-locations/asiri-hospital-galle",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ContactInfoWidget(
                      screenSize: screenSize,
                      title: "Asiri Hospital - Mathara",
                      telephone: "(077) 378 2419",
                      url:
                          "https://www.asirihealth.com/asiri-group/our-locations/asiri-hospital-matara",
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ContactInfoWidget extends StatelessWidget {
  const ContactInfoWidget({
    Key key,
    @required this.screenSize,
    this.title,
    this.telephone,
    this.url,
  }) : super(key: key);

  final Size screenSize;
  final String title;
  final String telephone;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(minWidth: screenSize.width * 0.5),
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(50))),
          padding: EdgeInsets.only(left: 15, top: 15, bottom: 15, right: 15),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        Container(
          margin: EdgeInsets.all(5),
          child: ClipOval(
            child: Material(
              color: Colors.blue, // Button color
              child: InkWell(
                splashColor: Colors.lightBlue, // Splash color
                onTap: () => {launch("tel:${telephone}")},
                child: SizedBox(
                    width: 56,
                    height: 56,
                    child: Icon(
                      Icons.call,
                      color: Colors.white,
                      size: 30,
                    )),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(5),
          child: ClipOval(
            child: Material(
              color: Colors.blue, // Button color
              child: InkWell(
                splashColor: Colors.lightBlue, // Splash color
                onTap: () => {launch(url)},
                child: SizedBox(
                    width: 56,
                    height: 56,
                    child: Icon(
                      Icons.language,
                      color: Colors.white,
                      size: 30,
                    )),
              ),
            ),
          ),
        )
      ],
    );
  }
}
