import 'package:flutter/material.dart';
import 'package:mother_and_baby/lan/Languages.dart';
import 'package:mother_and_baby/widgets/diary/symptomsRecorder.dart';

class SymptomsWidget extends StatefulWidget {
  final String selectedDate;

  const SymptomsWidget({Key key, this.selectedDate}) : super(key: key);
  @override
  _SymptomsWidgetState createState() => _SymptomsWidgetState();
}

class _SymptomsWidgetState extends State<SymptomsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          color: Color.fromRGBO(255, 164, 179, 1),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding:
      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(left: 35.0),
          //   child: Text(
          //     Languages.of(context).symptomsTxt,
          //     style: new TextStyle(color: Colors.white, fontSize: 16),
          //   ),
          // ),
          // SizedBox(
          //   height: 10,
          // ),

          ExpansionTile(
            title: Text(
              Languages.of(context).symptomsTxt,
              style: new TextStyle(color: Colors.white, fontSize: 16),
            ),
            trailing: Image.asset(
              "assets/images/diary/stress.png",
              height: 45,
            ),
            children: [
              /**
               * First row
               */
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.25,
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SymptomsRecorder(
                                    selectedDate: widget.selectedDate,
                                    title: "Nausca",
                                    iconData: Icons.mood_bad_outlined,
                                    symptomIconName: "nausca",
                                    iconsColor: Colors.green);
                              });
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/diary/nausca.png",
                              height: 45,
                            ),
                            Container(
                                margin: EdgeInsets.all(5),
                                child: Text(
                                  "Nausca",
                                  style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                                )),
                          ],
                        ),
                      ),
                    ),
                    /**
                     * Vomiting
                     */
                    Container(
                      width: MediaQuery.of(context).size.width*0.25,
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SymptomsRecorder(
                                    selectedDate: widget.selectedDate,
                                    title: "Vomiting",
                                    iconData: Icons.mood_bad_outlined,
                                    symptomIconName: "vomiting",
                                    iconsColor: Colors.green);
                              });
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/diary/vomiting.png",
                              height: 45,
                            ),
                            Container(
                                margin: EdgeInsets.all(5),
                                child: Text(
                                  "Vomiting",
                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                )),
                          ],
                        ),
                      ),
                    ),
                    /**
                     * Urinating
                     */
                    Container(
                      width: MediaQuery.of(context).size.width*0.25,
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SymptomsRecorder(
                                    selectedDate: widget.selectedDate,
                                    title: "Urinating",
                                    iconData: Icons.wc_outlined,
                                    symptomIconName: "urine",
                                    iconsColor: Colors.orange);
                              });
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/diary/urine.png",
                              height: 45,
                            ),
                            Container(
                                margin: EdgeInsets.all(5),
                                child: Text(
                                  "Urinating",
                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /**
               * Second row
               */
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.25,
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SymptomsRecorder(
                                    selectedDate: widget.selectedDate,
                                    title: "Breast Sensitivity",
                                    iconData: Icons.sentiment_satisfied_outlined,
                                    symptomIconName: "breast",
                                    iconsColor: Colors.amber);
                              });
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/diary/breast.png",
                              height: 45,
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 5,left: 5, right: 5),
                                child: Text(
                                  "Breast",
                                  textAlign: TextAlign.center,
                                  style:
                                  TextStyle(color: Colors.white, fontSize: 15,),
                                )),
                            Container(
                                margin: EdgeInsets.only(bottom: 5),
                                // width: 90,
                                // constraints: BoxConstraints(maxWidth: 90),
                                child: Text(
                                  "Sensitivity",
                                  textAlign: TextAlign.center,
                                  style:
                                  TextStyle(color: Colors.white, fontSize: 15,),
                                )),
                          ],
                        ),
                      ),
                    ),
                    /**
                     * Headache
                     */
                    Container(
                      width: MediaQuery.of(context).size.width*0.25,
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SymptomsRecorder(
                                    selectedDate: widget.selectedDate,
                                    title: "Headache",
                                    iconData: Icons.sentiment_very_dissatisfied_outlined,
                                    symptomIconName: "headache",
                                    iconsColor: Colors.orange);
                              });
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/diary/headache.png",
                              height: 45,
                            ),
                            Container(
                                margin: EdgeInsets.all(5),
                                child: Text(
                                  "Headache",
                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                )),
                          ],
                        ),
                      ),
                    ),
                    /**
                     * Hunger
                     */
                    Container(
                      width: MediaQuery.of(context).size.width*0.25,
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SymptomsRecorder(
                                    selectedDate: widget.selectedDate,
                                    title: "Hunger",
                                    iconData: Icons.restaurant_outlined,
                                    symptomIconName: "hunger",
                                    iconsColor: Colors.orange);
                              });
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/diary/hunger.png",
                              height: 45,
                            ),
                            Container(
                                margin: EdgeInsets.all(5),
                                child: Text(
                                  "Hunger",
                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /**
               * Third row
               */
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.25,
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SymptomsRecorder(
                                    selectedDate: widget.selectedDate,
                                    title: "Cravings",
                                    iconData: Icons.lunch_dining,
                                    symptomIconName: "cravings",
                                    iconsColor: Colors.deepOrangeAccent);
                              });
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/diary/cravings.png",
                              height: 45,
                            ),
                            Container(
                                margin: EdgeInsets.all(5),
                                child: Text(
                                  "Cravings",
                                  style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                                )),
                          ],
                        ),
                      ),
                    ),
                    /**
                     * stress
                     */
                    Container(
                      width: MediaQuery.of(context).size.width*0.25,
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SymptomsRecorder(
                                    selectedDate: widget.selectedDate,
                                    title: "Stress",
                                    iconData: Icons.sentiment_very_dissatisfied_outlined,
                                    symptomIconName: "stress",
                                    iconsColor: Colors.amber);
                              });
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/diary/stress.png",
                              height: 45,
                            ),
                            Container(
                                margin: EdgeInsets.all(5),
                                child: Text(
                                  "Stress",
                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                )),
                          ],
                        ),
                      ),
                    ),
                    /**
                     * tension
                     */
                    Container(
                      width: MediaQuery.of(context).size.width*0.25,
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SymptomsRecorder(
                                    selectedDate: widget.selectedDate,
                                    title: "Tension",
                                    iconData: Icons.sentiment_neutral_outlined,
                                    symptomIconName: "tension",
                                    iconsColor: Colors.red);
                              });
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/diary/tension.png",
                              height: 45,
                            ),
                            Container(
                                margin: EdgeInsets.all(5),
                                child: Text(
                                  "Tension",
                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /**
               * Fouth row
               */
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.25,
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SymptomsRecorder(
                                    selectedDate: widget.selectedDate,
                                    title: "Gas",
                                    iconData: Icons.masks_outlined,
                                    symptomIconName: "gas",
                                    iconsColor: Colors.blue);
                              });
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/diary/gas.png",
                              height: 45,
                            ),
                            Container(
                                margin: EdgeInsets.all(5),
                                child: Text(
                                  "Gas",
                                  style:
                                  TextStyle(color: Colors.white, fontSize: 15),
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

        ],
      ),
    );
  }
}
